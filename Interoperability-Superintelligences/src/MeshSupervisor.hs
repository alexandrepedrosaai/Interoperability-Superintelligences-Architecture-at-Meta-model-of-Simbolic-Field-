module MeshSupervisor (startSupervisor) where

import Control.Concurrent.Async
import Control.Exception (SomeException, catch)
import MeshNode (startNode)

-- Supervisor que inicia um nó e reinicia em caso de falha
startSupervisor :: String -> IO ()
startSupervisor role = do
  putStrLn $ "[Supervisor] Starting node: " ++ role
  supervise role

-- Função interna que supervisiona o nó
supervise :: String -> IO ()
supervise role = do
  worker <- async (startNode role `catch` handler role)
  _ <- wait worker
  -- Reinicia automaticamente após falha ou término
  supervise role

-- Tratamento de exceções
handler :: String -> SomeException -> IO ()
handler role e = putStrLn $ "[Supervisor] Node " ++ role ++ " crashed: " ++ show e
