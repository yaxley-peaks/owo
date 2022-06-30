module Main where

import Control.Monad (forever)
import Converter (convert)
import Options.Applicative


conIO :: String -> IO String
conIO = return . convert

newtype Args = Args {s :: String}

args :: Parser Args
args = Args <$> argument str (metavar "STRING")

opts :: ParserInfo Args
opts =
  info
    (args <**> helper)
    ( fullDesc
        <> progDesc "OwOfy a String"
        <> header "owo - OwOfy text"
    )

main :: IO ()
main = do
  Args s <- execParser opts
  putStrLn $ convert s