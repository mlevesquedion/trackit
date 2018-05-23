module Update exposing (update, onKeyDown)

import Html exposing (Attribute)
import Html.Events exposing (on, keyCode, onInput)
import Json.Decode as Json
import Model exposing (Model, Counter, ID)
import Msg exposing (Msg(..))


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment id ->
            updateCounter id model increment

        Decrement id ->
            updateCounter id model decrement

        Reset id ->
            updateCounter id model reset

        Delete id ->
            let
                counters =
                    List.filter ((/=) id << .id) model.counters
            in
                { model | counters = counters }

        AddCounter ->
            addCounter model

        UpdateLabel newLabel ->
            { model | nextLabel = newLabel }

        KeyDown keyCode ->
            if keyCode == 13 then
                addCounter model
            else
                model


onKeyDown : (Int -> msg) -> Attribute msg
onKeyDown tagger =
    on "keydown" (Json.map tagger keyCode)


addCounter : Model -> Model
addCounter model =
    if not <| String.isEmpty model.nextLabel then
        let
            newCounter =
                Counter model.nextId model.nextLabel 0
        in
            { model
                | counters = newCounter :: model.counters
                , nextId = model.nextId + 1
                , nextLabel = ""
            }
    else
        model


updateCounter : ID -> Model -> (Int -> Int) -> Model
updateCounter id model func =
    let
        counters =
            List.map (ifMatches id func) model.counters
    in
        { model | counters = counters }


ifMatches : ID -> (Int -> Int) -> Counter -> Counter
ifMatches id func counter =
    if id == counter.id then
        { counter | count = func counter.count }
    else
        counter


increment : Int -> Int
increment =
    (+) 1


decrement : Int -> Int
decrement =
    max 0 << flip (-) 1


reset : Int -> Int
reset =
    always 0
