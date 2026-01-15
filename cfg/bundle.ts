import { SolidPlugin } from "@dschz/bun-plugin-solid";
import tailwind from "bun-plugin-tailwind";
import { build, $ } from "bun";

export async function bundle(prod: boolean) {
  const { exitCode } = await $` bun res`.nothrow();
  if (exitCode != 0) return;
  build({
    entrypoints: ["./src/Main.jsx", "./src/tailwind.css"],
    outdir: "./dist",
    target: 'browser',
    minify: prod,
    sourcemap: prod ? 'none' : 'external',
    define: {
      "process.env.NODE_ENV": prod ? '"production"' : '"development"',
    },
    format: "iife",
    plugins: [
      SolidPlugin({
        generate: "dom",
        // debug: !prod,
        hydratable: false,
        sourceMaps: !prod,
      }),
      tailwind
    ],
  }).catch((e) => console.log(`Error ${e}`)
  );
}
