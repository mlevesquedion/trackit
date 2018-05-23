module Main exposing (..)

import Html exposing (beginnerProgram)
import Model exposing (Model)
import Update exposing (update)
import View exposing (view)
import Msg exposing (Msg)


init : Model
init =
    Model [] "" 0


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = init, view = view, update = update }
