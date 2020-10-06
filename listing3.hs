module Main where
import Text.ParserCombinators.Parsec hiding (spaces)
import System.Environment

symbol :: Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

spaces :: Parser () -- wrap
spaces = skipMany1 space


readExpr :: String -> String
readExpr input = case parse (spaces >> symbol) "lisp" input of  -- at least ONE space
  Left err -> "No match: " ++ show err
  Right val -> "Found Value"

main :: IO ()
main = do
         (expr:_) <- getArgs -- comand input 
         putStrLn (readExpr expr) 

 