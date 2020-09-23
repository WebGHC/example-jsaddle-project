{-# LANGUAGE TemplateHaskell #-}
module Frontend where

import Control.Monad.IO.Class
import Control.Lens
import Language.Javascript.JSaddle

mainWidget :: JSM ()
mainWidget = do
  liftIO $ putStrLn "Hello from example-jsaddle-project"

  eval ("w = console; w.log('Hello World on console!')" :: [Char])
  doc <- jsg ("document" :: String)
  doc ^. js ("body" :: String) ^. jss ("innerHTML":: String) ("<h1>Kia ora (Hi)</h1>" :: String)
  return ()

data MyData = MyData
  { _someInt :: Int
  , _someString:: String
  }

makeLenses ''MyData
