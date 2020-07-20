module Main exposing (..)


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
    = Ome Value
    | Two Value


type alias Model =
    { turn : Player
    , board : Board
    }
