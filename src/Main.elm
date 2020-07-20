module Main exposing (main)

import Element
import Html


type alias Position =
    { x : Int
    , y : Int
    }


type Value
    = Red
    | Green


type alias Cell =
    { pos : Position
    , val : Maybe Value
    }


type alias Board =
    List Cell


type alias Row =
    Int


type alias Column =
    Int


type Player
    = One Value
    | Two Value


type alias Model =
    { turn : Player
    , board : Board
    }


main : Html.Html msg
main =
    view init


init : Model
init =
    { turn = One Red, board = [] }


view : Model -> Html.Html msg
view model =
    Element.layout []
        (Element.column [] [])
