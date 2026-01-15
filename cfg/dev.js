import { watch } from "fs";
import { bundle } from "./bundle";


function watcher() {
  watch("src", { recursive: true }, (event, filename) => {
    if (filename?.endsWith(".res")) {
      console.log(`Reloaded: ${filename}`);
      bundle(false);
    }
  });
}

console.log('dev watch mode started')
bundle(false);
watcher();
