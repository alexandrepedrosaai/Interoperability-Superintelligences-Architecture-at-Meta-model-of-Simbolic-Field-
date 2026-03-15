module SymbolicField
    ( interoperabilityVersion
    , emptySymbolMap
    ) where

import qualified Data.Map.Strict as Map
import qualified Data.Text as T

-- | Version of the Symbolic Field interoperability framework.
interoperabilityVersion :: T.Text
interoperabilityVersion = T.pack "0.1.0.0"

-- | An empty symbol registry for the symbolic field model.
emptySymbolMap :: Map.Map T.Text T.Text
emptySymbolMap = Map.empty
