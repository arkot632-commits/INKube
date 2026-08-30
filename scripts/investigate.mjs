import { spawnSync } from "node:child_process";
import { existsSync } from "node:fs";

const npm = spawnSync("npm", ["--version"], { encoding: "utf8" });
const hasPackageManifest = existsSync("package.json");

console.log(`node: ${process.execPath}`);
console.log(`npm spawn error: ${npm.error?.code ?? "none"}`);
console.log(`package.json exists: ${hasPackageManifest}`);

if (npm.error?.code === "ENOENT" && !hasPackageManifest) {
  console.log(
    "ROOT CAUSE: the npm validation command cannot start because npm is not installed or on PATH, and this checkout is not bootstrapped as an npm project.",
  );
}
