let
  project = import ./default.nix {};
  reflex-platform = import ./dep/reflex-platform {};
  wasm-cross = reflex-platform.wasm-cross;
in {
  inherit wasm-cross;
  example-jsaddle-project-ghc = project.ghc.example-jsaddle-project;
  example-jsaddle-project-wasm = project.wasm.example-jsaddle-project;
  wasm-app = reflex-platform.build-wasm-app-wrapper
    "example-jsaddle-project" # Name of exe
    project.wasm.example-jsaddle-project
    {};
}