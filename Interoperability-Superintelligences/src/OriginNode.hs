module OriginNode (emit) where

import PipelineManager

emit :: PipelineManager -> String -> IO ()
emit pm signal = do
  pipeline <- getPipeline pm
  case pipeline of
    (first:rest) -> putStrLn $ "[Origin] emitted: " ++ signal ++ " into pipeline " ++ show pipeline
    []           -> putStrLn "[Origin] pipeline empty"
