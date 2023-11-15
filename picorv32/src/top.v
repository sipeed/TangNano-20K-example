`timescale 1 ns / 1 ps

module system (
	input            clk,
	input            resetn,
	output           trap,
	output           ser_tx
);

// 4096 32bit words = 16kB
parameter MEM_SIZE = 4096;

wire mem_valid;
wire mem_instr;
reg mem_ready;
wire [31:0] mem_addr;
wire [31:0] mem_wdata;
wire [3:0] mem_wstrb;
reg [31:0] mem_rdata;

picorv32 #(
.ENABLE_MUL(1), // 乘法指令
.ENABLE_DIV(1), // 除法指令
.COMPRESSED_ISA(1) // 压缩指令
) picorv32_core (
    .clk         (clk         ),
    .resetn      (!resetn      ),
    .trap        (trap        ),
    .mem_valid   (mem_valid   ),
    .mem_instr   (mem_instr   ),
    .mem_ready   (mem_ready   ),
    .mem_addr    (mem_addr    ),
    .mem_wdata   (mem_wdata   ),
    .mem_wstrb   (mem_wstrb   ),
    .mem_rdata   (mem_rdata   )
);

wire uart_wait;

simpleuart #(
.DEFAULT_DIV(234)
) simpleuart_inst (
   .clk(clk),
   .resetn(!resetn),
   .ser_tx(ser_tx),
   .reg_dat_we(mem_valid && !mem_ready && |mem_wstrb && mem_addr == 32'h1000_0000),
   .reg_dat_di(mem_wdata),
   .reg_dat_wait(uart_wait)
);

reg [31:0] memory [0:MEM_SIZE-1];
initial $readmemh("firmware.hex", memory);

reg [31:0] m_read_data;
reg m_read_en;

always @(posedge clk) begin
    m_read_en <= 0;
    mem_ready <= (mem_valid && !mem_ready && m_read_en) || 
                 (mem_valid && !mem_ready && |mem_wstrb && mem_addr == 32'h1000_0000 && !uart_wait);

    m_read_data <= memory[mem_addr >> 2];
    mem_rdata <= m_read_data;

    (* parallel_case *)
    case (1)
        mem_valid && !mem_ready && !mem_wstrb && (mem_addr >> 2) < MEM_SIZE: begin
            m_read_en <= 1;
        end
        mem_valid && !mem_ready && |mem_wstrb && (mem_addr >> 2) < MEM_SIZE: begin
            if (mem_wstrb[0]) memory[mem_addr >> 2][ 7: 0] <= mem_wdata[ 7: 0];
            if (mem_wstrb[1]) memory[mem_addr >> 2][15: 8] <= mem_wdata[15: 8];
            if (mem_wstrb[2]) memory[mem_addr >> 2][23:16] <= mem_wdata[23:16];
            if (mem_wstrb[3]) memory[mem_addr >> 2][31:24] <= mem_wdata[31:24];
            mem_ready <= 1;
        end
    endcase
end

endmodule