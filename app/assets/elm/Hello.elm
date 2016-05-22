port module Hello exposing (..)
import Html exposing (..)
import Html.App as Html

main =
  Html.programWithFlags
    {
      init = init
      , subscriptions = subscriptions
      , update = update
      , view = view
    }

type alias Model =
  {
    noun : String
  }

init : String -> (Model, Cmd Msg)
init noun =
  (Model noun, Cmd.none)

type Msg
  = Change String

update : Msg -> Model -> (Model, Cmd Msg)
update action model =
  case action of
    Change noun ->
      ({ model | noun = noun }, Cmd.none)

port data : (String -> msg) -> Sub msg

subscriptions : Model -> Sub Msg
subscriptions model =
  data Change

view : Model -> Html Msg
view model =
  div [] [ text ("Hello " ++ model.noun) ]
