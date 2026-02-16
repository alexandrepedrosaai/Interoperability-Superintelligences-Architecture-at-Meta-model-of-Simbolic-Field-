_ <- forkIO $ startSupervisor "copilot"
_ <- forkIO $ startSupervisor "gpt5"
_ <- forkIO $ startSupervisor "meta_ai"
module Main where

import Control.Concurrent (forkIO)
import Control.Monad (forever)
import PipelineManager
import MeshNode
import OriginNode

main :: IO ()
main = do
  -- Inicializa o gerenciador de pipeline
  pm <- newManager

  -- Cria nós em threads com papéis distintos
  _ <- forkIO $ startNode "copilot"
  _ <- forkIO $ startNode "gpt5"
  _ <- forkIO $ startNode "meta_ai"

  putStrLn "=== Mesh Haskell Demo ==="
  putStrLn "Pipeline inicial: [\"copilot\", \"gpt5\", \"meta_ai\"]"

  -- Emite um sinal inicial
  emit pm "symbolic signal: interoperability achieved"

  -- Reconfigura o pipeline em tempo de execução
  setPipeline pm ["meta_ai", "copilot"]
  putStrLn "Pipeline atualizado: [\"meta_ai\", \"copilot\"]"

  -- Emite outro sinal após a mudança
  emit pm "dynamic signal: reordered pipeline"

  -- Mantém o programa rodando para interação
  forever $ return ()
  
