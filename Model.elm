module Model exposing (..)


type alias ID =
    Int


type alias Counter =
    { id : ID
    , label : String
    , count : Int
    }


type alias Model =
    { counters : List Counter
    , nextLabel : String
    , nextId : ID
    }
