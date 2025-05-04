const header = "C3 03 40 3E 46 CD A2 00 18 FE".split(" ").map(i => parseInt(i, 16));
const bin2 = new Uint8Array(32 * 1024);
for (let i = 0; i < header.length; i++) bin2[i] = header[i];
await Deno.writeFile("hello2.rom", bin2);
