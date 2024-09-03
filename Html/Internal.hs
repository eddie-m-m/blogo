module Html.Internal where

newtype Html
  = Html String

newtype Structure
  = Structure String

type Title =
  String

html_ :: Title -> Structure -> Html
html_ title content =
  Html
    ( el
        ( escape
            "html"
        )
        ( el (escape "head") (el "title" (escape title))
            <> el (escape "body") (getStructureString content)
        )
    )

p_ :: String -> Structure
p_ = Structure . el "p" . escape

h1_ :: String -> Structure
h1_ = Structure . el "h1" . escape

el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure (a <> b)

getStructureString :: Structure -> String
getStructureString content =
  case content of
    Structure str -> str

render_ :: Html -> String
render_ html =
  case html of
    Html str -> str

escape :: String -> String
escape =
  let escapeChar c = case c of
        '<' -> "&lt;"
        '>' -> "&gt;"
        '&' -> "&amp;"
        '"' -> "&quot;"
        '\'' -> "&#39;"
        _ -> [c]
   in concat . map escapeChar
