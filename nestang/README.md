# NESTang - an NES emulator for Tang Primer 20K

To start this, you need `a HDMI monitor`, a `Tang Nano 20K` and 2 `joysticks` and their `convert boards`, one breadboard will save many wiring time.

1. Program FPGA

Burn the `nes.fs` into Tang Nano 20K FPGA, then this FPGA development board is a Retro emulator.

Program the firmware into Flash to store this firmware. SRAM MODE does not store your firmware if no power.

![nes_burn_into_flash](./../.assets/nes_burn_into_flash.png)

2. Prepare Games

Get your NES games, and use `tools/nes2img.py` to generate your games for playing.

This is a example of making `1.nes` `2.nes` `3.nes` games into one image file named `games.img`.

```bash
python nes2img.py -o games.img 1.nes 2.nes 3.nes
```

Use `Balena Etcher` or `dd` to flash this generated image file into TF card. Here is the command if you use `dd` command to flash this image file.

```bash
sudo dd if=games.img of=/dev/sdx bs=512
```

Insert the TF card into FPGA.

![nes_tang_tf_card_onsert](./../.assets/nes_tang_tf_card_onsert.jpg)

3. Connect the joystick

Connect the FPGA with the joystick convert board. Here we use the Breadboard to reduce the annoying wiring operation.

![nes_tang_breadboard_connecting](./../.assets/nes_tang_breadboard_connecting.jpg)

Note the red line in this picture, it shown the end FPGA pin matches the joystick end pin.

> Player 1 is the right joystick constrain.

This table is the default pin constrain of NESTang Project.

| Player 2 | FPGA Pins | Player 1 | FPGA Pins |
| -------- | --------- | -------- | --------- |
| clk2     | 52        | clk      | 17        |
| mosi2    | 53        | mosi     | 20        |
| miso2    | 71        | miso     | 19        |
| cs2      | 72        | cs       | 18        |

4. Start the game

Connect the joystick with the joystick convert board, connect the FPGA board with HDMI monitor, and power Tang Nano 20K, Start your game.

Press 2 On joystick to start the game.
Press S1 key on the FPGA to switch to game selecting menu.

5. Questions

It you meet troubles, give an issue in this project or read the [original nestang project](https://github.com/nand2mario/nestang).