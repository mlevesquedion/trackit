module BootstrapUtils exposing (smallCol, bootstrapButton, emptyRow)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick, onInput, on)
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Button as Button
import Msg exposing (Msg(..))


smallCol : Int -> Html Msg -> Grid.Column Msg
smallCol size html =
    let
        bootstrapSize =
            case size of
                6 ->
                    Col.sm6

                3 ->
                    Col.sm3

                1 ->
                    Col.sm1

                _ ->
                    Col.sm
    in
        Grid.col [ bootstrapSize ] [ html ]


bootstrapButton : String -> Msg -> String -> Html Msg
bootstrapButton style msg label =
    let
        buttonStyle =
            case style of
                "primary" ->
                    Button.primary

                "danger" ->
                    Button.danger

                _ ->
                    Button.secondary
    in
        Button.button [ buttonStyle, Button.attrs [ onClick msg ] ] [ text label ]


emptyRow : List (Html Msg)
emptyRow =
    [ Grid.row [] [ smallCol 0 <| div [ style [ ( "visibility", "hidden" ) ] ] [ text "." ] ] ]
