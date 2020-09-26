# Example JSaddle Project

This example demonstrates how to structure and compile a simple JSaddle app with `GHC` and `WebGHC`.

This uses `wasm-cross` internally for using `WebGHC` and `reflex-platform` to provide `TemplateHaskell` support.

## Build via GHC

The `jsaddle-warp` is used here to provide a browser based app. It is possible to use `jsaddle-webkit2gtk` to get a desktop app instead.

```
nix-build -A ghc.example-jsaddle-project -o result-ghc
./result-ghc/bin/example-jsaddle-project
```

Then open http://localhost:3709

## Build via WebGHC

Build the project to obtain the WebAssembly executable

```
nix-build -A wasm.example-jsaddle-project -o result-wasm
```

The `release.nix` has a `wasm-app` target to package the generated WebAssembly executable with the JS files from `webabi`.

In addition to that this also calls `wasm-strip` and `wasm-opt` to reduce the size of the binary.

```
nix-build release.nix -A wasm-app -o result-wasm-app
cd ./result-wasm-app
hserv -p8000
```

Then open http://localhost:8000

