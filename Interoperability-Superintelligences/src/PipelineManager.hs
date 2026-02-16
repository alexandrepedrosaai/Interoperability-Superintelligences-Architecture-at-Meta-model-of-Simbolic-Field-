module PipelineManager
  ( PipelineManager
  , newManager
  , setPipeline
  , getPipeline
  ) where

import Control.Concurrent.STM

newtype PipelineManager = PipelineManager (TVar [String])

newManager :: IO PipelineManager
newManager = PipelineManager <$> newTVarIO ["copilot", "gpt5", "meta_ai"]

setPipeline :: PipelineManager -> [String] -> IO ()
setPipeline (PipelineManager tv) newPipe =
  atomically $ writeTVar tv newPipe

getPipeline :: PipelineManager -> IO [String]
getPipeline (PipelineManager tv) =
  atomically $ readTVar tv
