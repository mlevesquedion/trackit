module Msg exposing (Msg(..))

import Model exposing (ID)


type alias KeyCode =
    Int


type Msg
    = Increment ID
    | Decrement ID
    | Reset ID
    | Delete ID
    | AddCounter
    | UpdateLabel String
    | KeyDown KeyCode
