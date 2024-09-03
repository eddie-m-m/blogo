module Main where

import Html

main :: IO ()
main = putStrLn (render_ myhtml)

myhtml :: Html
myhtml =
  html_
    "Refugium, remix"
    ( append_
        (h1_ "Reflections")
        ( append_
            (p_ "Reflection 1")
            (p_ "Reflection 2")
        )
    )
