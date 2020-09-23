{-# LANGUAGE CPP #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main where

#if defined(wasm32_HOST_ARCH)
import Language.Javascript.JSaddle.Wasm (run)
#else
import Language.Javascript.JSaddle.Warp (run)
#endif

import Frontend (mainWidget)

main = run 3709 $ mainWidget
