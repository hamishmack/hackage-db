module Main ( main ) where

import Distribution.Hackage.DB.Unparsed
import Distribution.Hackage.DB.Path

import Control.Monad
import Data.Map as Map
import Distribution.Package
import Distribution.Text
import Data.List as List

main :: IO ()
main = do
  tarball <- hackagePath
  db <- readTarball tarball Nothing
  forM_ (toList db) $ \(PackageName pn, PackageData vr vs) -> do
    putStrLn $ pn ++ ": " ++ intercalate ", " (fmap display (keys vs)) ++
               " (preferred: " ++ show vr ++ ")"