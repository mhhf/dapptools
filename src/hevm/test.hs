module Denis where

import EVM.Symbolic (litBytes, SymWord(..), sw256, Buffer(..))
import EVM.Concrete (createAddress, Word, Whiff(..))
import Data.SBV.Trans.Control
import Data.SBV.Trans hiding (distinct, Word)
import Data.SBV hiding (runSMT, newArray_, addAxiom, distinct, sWord8s, Word)

ff = Data.SBV.Trans.free_

denis :: IO ()
denis = Data.SBV.Trans.runSMT $ query $ do {
  x <- ff;
  y <- ff;
  c <- ff;
  io
  $ print
  $ (\(S a x) -> ite ((S a x) .== 0) (S (UnOp "isZero" a) 1) (S (UnOp "isNotZero" a) 0)) (S Dull c)}

