module Main where

import Converter (convert)
import Options.Applicative

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