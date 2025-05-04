const header = "41 42 b7 4a 00 00 00 00 00 00 00 00 00 00 00 00 00 C3 14 40".split(" ").map(i => parseInt(i, 16));
const bin = await Deno.readFile("hello.rom");
//const bin2 = new Uint8Array([...header, ...bin]);
const cut = 3;
const bin2 = new Uint8Array(32 * 1024);
for (let i = 0; i < header.length; i++) bin2[i] = header[i];
for (let i = header.length; i < bin2.length; i++) bin2[i] = bin[i - header.length + cut];
await Deno.writeFile("hello2.rom", bin2);
