const fn = "cbios_main_msx1_jp.rom";
const fn2 = "cbios_main_msx1_ichigojam_jp.rom";
const bin = await Deno.readFile(fn);

const url = "https://ichigojam.github.io/ichigojam-font/ichigojam-font.json";
const font = await (await fetch(url)).json();

const start = 0x1bbf;
for (let i = 0; i < font.length; i++) {
  const f = font[i];
  for (let j = 0; j < 8; j++) {
    bin[start + i * 8 + j] = parseInt(f.substring(j * 2, j * 2 + 2), 16);
  }
}
await Deno.writeFile(fn2, bin);
