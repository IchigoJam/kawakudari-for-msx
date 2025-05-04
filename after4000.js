const fn = Deno.args[0];
const bin = await Deno.readFile(fn);
const bin2 = new Uint8Array(16 * 1024);
for (let i = 0; i < 0x4000; i++) {
  bin2[i] = bin[i + 0x4000];
}
await Deno.writeFile(fn, bin2);
