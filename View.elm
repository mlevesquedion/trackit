module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (placeholder, value, style)
import Html.Events exposing (onClick, onInput, on)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Form.Input as Input
import BootstrapUtils exposing (smallCol, bootstrapButton, emptyRow)
import Model exposing (..)
import Msg exposing (Msg(..))
import Update exposing (onKeyDown)


view : Model -> Html Msg
view model =
    Grid.container []
        ([ CDN.stylesheet ]
            ++ [ title ]
            ++ [ viewNextCounter model ]
            ++ emptyRow
            ++ (List.map viewCounter model.counters)
        )


title : Html Msg
title =
    Grid.row []
        [ smallCol 0 <| h1 [] [ text "Trackit" ] ]


viewNextCounter : Model -> Html Msg
viewNextCounter model =
    Grid.row []
        [ smallCol 6 <|
            Input.text
                [ Input.attrs
                    [ placeholder "What do you wish to track ?"
                    , onInput UpdateLabel
                    , onKeyDown KeyDown
                    , value model.nextLabel
                    ]
                ]
        , smallCol 6 <| bootstrapButton "" AddCounter "Track it !"
        ]


viewCounter : Counter -> Html Msg
viewCounter counter =
    Grid.row []
        [ smallCol 6 <| h3 [] [ text counter.label ]
        , smallCol 1 <| bootstrapButton "primary" (Decrement counter.id) "-"
        , smallCol 1 <| h3 [] [ text <| toString counter.count ]
        , smallCol 1 <| bootstrapButton "primary" (Increment counter.id) "+"
        , smallCol 3 <| bootstrapButton "danger" (Delete counter.id) "Delete"
        ]
