module Converter where

convert :: String -> String
convert = owofy . excl
  where
    owofy :: String -> String
    owofy s =
      let repl 'r' = 'w'
          repl 'l' = 'w'
          repl 'R' = 'W'
          repl 'L' = 'W'
          repl c = c
       in map repl s

    excl :: [Char] -> String
    excl = concatMap handle
      where
        handle :: Char -> String
        handle c = if c == '!' then ">w< " else c2s c
        c2s :: Char -> String
        c2s c = [c]