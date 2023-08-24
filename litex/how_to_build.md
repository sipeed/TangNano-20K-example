# Build litex firmware

These are the example steps to build the litex firmware, if you have trouble, new an issue.

If you want to know more about litex, read [litex](https://github.com/enjoy-digital/litex) or [litex wiki](https://github.com/enjoy-digital/litex/wiki).

## Requirements

OS: Latest linux version, X86/X64 platform.
Software: `pythons` `git` ``pip

## Install litex

> This takes a long time

```bash
wget https://raw.githubusercontent.com/enjoy-digital/litex/master/litex_setup.py
chmod +x litex_setup.py
./litex_setup.py --init --install --user `whoami` --config=full
```

## Get compile toolchain

```bash
pip3 install meson
sudo ./litex_setup.py --gcc=riscv
```

## Get gowin chain

```bash
mkdir ~/gowin
wget -P ~/gowin/ http://cdn.gowinsemi.com.cn/Gowin_V1.9.8.11_Education_linux.tar.gz
tar xvf ~/gowin/Gowin* -C ~/gowin/
chmod +x -R ~/gowin/IDE/bin
```

## Build litex bitstream

```bash
PATH=~/gowin/IDE/bin:$PATH
python3 -m litex_boards.targets.sipeed_tang_nano_20k --build
```

Then you will see there is a `build` folder at present path, and the bitstream file `sipeed_tang_nano_20k.fs` is in the `/build/sipeed_tang_nano_20k/gateware/` path.

Flash `sipeed_tang_nano_20k.fs` into [Tang Nano 20K](https://wiki.sipeed.com/nano20k) via [openFPGAloader](https://github.com/trabucayre/openFPGALoader) in Linux or Gowin Programmer in Windows.

## Error

### OSError: Unable to find Gowin toolchain

```bash
PATH=~/gowin/IDE/bin:$PATH
```

### No valid Meson

```bash
pip3 install meson
```

Then reboot your conputer may fix this.

### no module litex_boards

Make sure you have install litex successfully.

If you install litex, you can see there are applications like `litex_cli` in `~/.local/bin/` directory.

And reboot computer may fix this.
