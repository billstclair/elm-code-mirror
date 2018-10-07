----------------------------------------------------------------------
--
-- Main.elm
-- Example of using Custom Elements with CodeMirror
-- Copyright (c) 2018 Bill St. Clair <billstclair@gmail.com>
-- Some rights reserved.
-- Distributed under the MIT License
-- See LICENSE.txt
--
----------------------------------------------------------------------


module Main exposing (main)

import Browser
import Char
import Html exposing (Attribute, Html, a, br, div, p, pre, text)
import Html.Attributes exposing (href, property)
import Html.Events exposing (on)
import Json.Decode as JD exposing (Decoder)
import Json.Encode as JE exposing (Value)


main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { value : String
    }


type Msg
    = CodeChanged String


init : () -> ( Model, Cmd Msg )
init () =
    ( { value =
            """module Main exposing (main)

import Html

main = Html.text "Hello, World!"
       """
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CodeChanged value ->
            ( { model | value = value }
            , Cmd.none
            )


{-| Here's our custom element, defined in site/code-editor.js
-}
codeEditor : List (Attribute msg) -> List (Html msg) -> Html msg
codeEditor =
    Html.node "code-editor"


{-| This is how you set the contents of the code editor.
-}
editorValue : String -> Attribute msg
editorValue value =
    property "editorValue" <|
        JE.string value


{-| This is how you receive changes to the contents of the code editor.
-}
onEditorChanged : (String -> msg) -> Attribute msg
onEditorChanged tagger =
    on "editorChanged" <|
        JD.map tagger <|
            JD.at [ "target", "editorValue" ]
                JD.string


copyright : String
copyright =
    String.fromList [ Char.fromCode 169 ]


view : Model -> Html Msg
view model =
    div []
        [ codeEditor
            [ editorValue model.value
            , onEditorChanged CodeChanged
            ]
            []
        , p []
            [ text "Text above echoed below:" ]
        , pre []
            [ text model.value ]
        , p []
            [ text <| copyright ++ " 2017-2018 "
            , a [ href "https://lisplog.org/" ]
                [ text "Bill St. Clair" ]
            , br [] []
            , text "Source code: "
            , a [ href "https://github.com/billstclair/elm-code-mirror" ]
                [ text "github.com/billstclair/elm-code-mirror" ]
            ]
        ]
