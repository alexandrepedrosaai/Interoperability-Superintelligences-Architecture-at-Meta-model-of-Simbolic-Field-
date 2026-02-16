module MeshNode (startNode) where

import Control.Concurrent
import Control.Monad (forever)

startNode :: String -> IO ()
startNode role = forever $ do
  msg <- getLine
  putStrLn $ transform role msg

transform :: String -> String -> String
transform "copilot" msg = "[Copilot] code suggestion from: " ++ msg
transform "gpt5"    msg = "[GPT-5] semantic refinement of: " ++ msg
transform "meta_ai" msg = "[Meta AI] cultural harmonization of: " ++ msg
transform role      msg = "[" ++ role ++ "] raw: " ++ msg
