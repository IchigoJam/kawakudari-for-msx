wla-z80 -o $1.obj $1.asm
wlalink $1.linkfile $1.rom
deno -A after4000.js $1.rom 
openmsx -machine C-BIOS_MSX1_ICHIGOJAM_JP -cart $1.rom
