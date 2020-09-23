{ reflex-platform ? import ./dep/reflex-platform {}
} :

reflex-platform.project ({ pkgs, ... }: {
  packages = {
    example-jsaddle-project = pkgs.lib.cleanSource ./.;
  };

  shells = {
    ghc = ["example-jsaddle-project"];
    wasm = ["example-jsaddle-project"];
  };

  # These overrides are a HACK needed because the cabal2nix does not detect
  # the dependencies properly for wasm
  overrides = (self: super: {
    example-jsaddle-project = if super.jsaddle-warp == null
      then with pkgs.haskell.lib; overrideCabal (enableCabalFlag super.example-jsaddle-project "wasm32") (drv: {
          libraryHaskellDepends = (drv.libraryHaskellDepends or []) ++ [ self.jsaddle-wasm ];
        })
      else super.example-jsaddle-project;
  });
})