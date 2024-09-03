module Main where

main :: IO ()
main = putStrLn myhtml

myhtml :: String
myhtml =
  makeHtml
    "Refugium, remix"
    (h1_ "Reflections")
    <> (p_ "Reflection 1" <> p_ "Reflection 2")

makeHtml :: String -> String -> String
makeHtml title body = html_ (head_ (title_ title) <> body_ body)

el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

html_ :: String -> String
html_ = el "html"

body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ = el "head"

title_ :: String -> String
title_ = el "title"

p_ :: String -> String
p_ = el "p"

h1_ :: String -> String
h1_ = el "h1"
