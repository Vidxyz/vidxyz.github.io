import { cp, mkdir, readdir, rm } from "node:fs/promises";
import path from "node:path";

const repoRoot = path.resolve(process.cwd(), "..");
const outDir = path.resolve(process.cwd(), "out");
const docsDir = path.join(repoRoot, "docs");

const entries = await readdir(outDir).catch(() => []);
if (entries.length === 0) {
  throw new Error(
    "Missing export output. Run `npm run export` or `npm run deploy` from v2."
  );
}

await mkdir(docsDir, { recursive: true });
const docsEntries = await readdir(docsDir);
await Promise.all(
  docsEntries.map((entry) =>
    rm(path.join(docsDir, entry), { recursive: true, force: true })
  )
);

await cp(outDir, docsDir, { recursive: true });
console.log("Deployed v2 static export to /docs");
