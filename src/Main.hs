module Main (main) where

import Lexer 
import Parser
import System.Environment (getArgs)
import System.IO()

main :: IO ()
main = do
    args <- getArgs

    case args of 
        [filename] -> do
            content <- readFile filename
            let tokens = alexScanTokens content
            print tokens
            let ast = parser tokens
            print ast
        _ -> putStrLn "Usage: stack exec tala <filename>"
