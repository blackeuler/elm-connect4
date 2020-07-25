module Main exposing (..)

import Html
import Html.Attributes


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


view : Model -> Html.Html msg
view model =
    Html.div [] []


grid : Row -> Column -> List (Html.Html msg) -> Html.Html msg
grid row col =
    Html.div
        [ Html.Attributes.style "display" "grid"
        , Html.Attributes.style "grid-template-rows" <|
            "repeat("
                ++ String.fromInt row
                ++ ", 1fr)"
        , Html.Attributes.style "grid-template-columns" <|
            "repeat("
                ++ String.fromInt col
                ++ ", 1fr)"
        ]


placeCell : Row -> Column -> List (Html.Attribute msg)
placeCell row col =
    [ Html.Attributes.style "grid-row" (String.fromInt row)
    , Html.Attributes.style "grid-column" (String.fromInt col)
    ]


viewCell : Cell -> Html.Html msg
viewCell cell =
    Html.div (placeCell cell.pos.x cell.pos.y ++ []) [ viewCellAux cell ]


viewCellAux : Cell -> Html.Html msg
viewCellAux cell =
    Html.div
        [ Html.Attributes.style "border" "solid black 2px"
        , Html.Attributes.style "height" "80px"
        ]
        [ Html.div
            [ Html.Attributes.style "border" "solid black 2px"
            , Html.Attributes.style "border-radius" "50%"
            , cellColor cell
            , Html.Attributes.style "height" "95%"
            ]
            [ Html.text "" ]
        ]


cellColor : Cell -> Html.Attribute msg
cellColor cell =
    let
        color =
            case cell.val of
                Nothing ->
                    "white"

                Just Red ->
                    "red"

                Just Green ->
                    "green"
    in
    Html.Attributes.style "background-color" color


viewBoard : Board -> Html.Html msg
viewBoard board =
    grid 7 7 <|
        List.map viewCell board


initBoard : Row -> Column -> Board
initBoard row col =
    List.concatMap (\x1 -> List.map (\y1 -> { pos = { x = x1, y = y1 }, val = Nothing }) <| List.range 1 col) <| List.range 1 row
initControls : Html.Html msg
initControls =
    grid 1 7 <| List.map (\t ->Html.div (placeCell 1 t ++ []) [Html.text "place"] ) <|List.range 1 7

test : Html.Html msg
test =
    Html.div []
        [ viewBoard
            (initBoard 6 7)
        , initControls
        ]


main =
    test
