# kawakudari game for MSX

- kawakudari ROM for MSX forked from an IchigoJam mini game

## setup

```sh
brew install openmsx
brew install wla-dx
```

## compile and run

```sh
sh c.sh kawakudari
```

[c.sh](c.sh)
```sh
wla-z80 -o $1.obj $1.asm
wlalink $1.linkfile $1.rom
deno -A after4000.js $1.rom 
openmsx -machine C-BIOS_MSX1_ICHIGOJAM_JP -cart $1.rom
```

### C-BIOS font change to IchigoJam font

using [IchigoJam-font](https://github.com/IchigoJam/ichigojam-font) for [C-BIOS](https://cbios.sourceforge.net/)
```sh
deno -A changefont.js
deno -A https://code4fukui.github.io/SHA1/cli.js cbios_main_msx1_ichigojam_jp.rom
```

- make [C-BIOS_MSX1_ICHIGOJAM_JP.xml](C-BIOS_MSX1_ICHIGOJAM_JP.xml) from [C-BIOS_MSX1_JP.xml](C-BIOS_MSX1_JP.xml)
- edit rom and sha1

```sh
cp C-BIOS_MSX1_ICHIGOJAM_JP.xml /opt/homebrew/Cellar/openmsx/20.0/openMSX.app/Contents/Resources/share/machines/
cp cbios_main_msx1_ichigojam_jp.rom /opt/homebrew/Cellar/openmsx/20.0/openMSX.app/Contents/Resources/share/machines/
```

```sh
sh c-ij.sh kawakudari
```

## reference

- [MSX用カートリッジ基板の自作 - takuya matsubara blog](https://nicotakuya.hatenablog.com/entry/2021/08/21/095238)
- [8bitworkshop](https://8bitworkshop.com/)
- [C-BIOS Association](https://cbios.sourceforge.net/)
- [IchigoJam FONT](https://github.com/IchigoJam/ichigojam-font)
- [VDP command](https://beach.biwako.ne.jp/~beaver/msx/msxtecho/vdpcmd.htm)
- [ワークエリア - MSX JAPAN▉](https://msxjpn.jimdofree.com/%E3%83%AF%E3%83%BC%E3%82%AF%E3%82%A8%E3%83%AA%E3%82%A2/)
- [Webアプリ多め！ネットで見つけたMSX向け開発関連ツールまとめ - Gigamix Online](https://gigamix.hatenablog.com/entry/devmsx/msx-utils)
