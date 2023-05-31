# Tang Nano 20K Linux

This `readme` tells how to run linux on Tang Nano 20k.

## Environment

OS: Linux
Software: `Python`, `litex` [Click me to know litex](https://github.com/enjoy-digital/litex/wiki).

## Instruction

### Burn FPGA firmware

`openFPGALoader -f -c ft2232 ./firmware/sipeed_tang_nano_20k.fs`

### Load Linux image

This will take a long tims.

`litex_term --speed 3000000 --serial-boot --images ./image/boot.json /dev/ttyUSB1`