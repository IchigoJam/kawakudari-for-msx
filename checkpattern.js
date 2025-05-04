const fn = "cbios_main_msx1_jp.rom";
//const fn = "cbios_main_msx1_ichigojam_jp.rom";
const bin = await Deno.readFile(fn);
const start = 0x1bbf;
//const cha = "y".charCodeAt(0);
//const cha = "A".charCodeAt(0);
const cha = 0x01; // 月
//const cha = 250;
for (let i = 0; i < 8; i++) {
  const s = "0000000" + bin[start + cha * 8 + i].toString(2);
  console.log(s.substring(s.length - 8));
}
/*
00010000
00101000
00101000
01111100
01000100
01000100
00000000
00000000
*/
