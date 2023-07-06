# Litex

## What is this firmware

This firmware is generate on litex.

[The LiteX framework provides a convenient and efficient infrastructure to create FPGA Cores/SoCs, to explore various digital design architectures and create full FPGA based systems.](https://github.com/enjoy-digital/litex)

## How to use this firmware

Flash this firmware into Tang Nano 20K, both GOWIN programmer or openFPGALoader works fine.

Then open the serial port of Tang Nano 20K with 115200 baudrate, you can test the litex terminal

## How to compile this firmware by myself

Here we use ubuntu 20.04 as the system to compile this firmware.

1. Get litex
2. Install litex
3. Get Gowin toolchain
4. Compile the firmware

### Get litex

```bash
mkdir ~/litex
cd ~/litex
wget https://raw.githubusercontent.com/enjoy-digital/litex/master/litex_setup.py
```

### Install litex

```bash
cd ~/litex
chmod +x litex_setup.py
python ./litex_setup.py --init --install --user `whoami` --config=full
```

### Get Gowin toolchain

Get GOWIN IDE ([Chinese](http://www.gowinsemi.com.cn/faq.aspx) | [English](https://www.gowinsemi.com/en/support/download_eda/)).

Here we use Education edition IDE as the example, make sure that your IDE is V1.9.8.11 version or newer. Otherwise you need license or your IDE does not support Tang Nano 20K FPGA Chip GW2AR-QN88C6I5

```bash
mkdir ~/gowin
cd ~/gowin
wget http://cdn.gowinsemi.com.cn/Gowin_V1.9.8.11_Education_linux.tar.gz
tar zxvf Gowin_V1.9.8.11_Education_linux.tar.gz
export PATH=~/gowin/IDE/bin:$PATH # Add gowin toolchain PATH
```

### Compile the firmware

```bash
cd ~/litex
python3 -m litex_boards.targets.sipeed_tang_nano_20k --build
```