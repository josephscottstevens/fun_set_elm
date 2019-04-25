module Main exposing (DataType(..), empty_set, f_contains, main, singleton_set)

import Html exposing (text)


type DataType
    = IntType Int
    | BoolType Bool
    | StringType String
    | SuccessType


empty_set : DataType -> Maybe a
empty_set _ =
    Nothing


singleton_set : DataType -> DataType -> Maybe DataType
singleton_set =
    \data1 data2 ->
        if data1 == data2 then
            Just data2

        else
            Nothing


f_contains : (DataType -> DataType -> Maybe DataType) -> DataType -> (DataType -> Bool)
f_contains fun_set1 data1 =
    \data2 ->
        case fun_set1 data1 data2 of
            Just _ ->
                if data1 == data2 then
                    True

                else
                    False

            Nothing ->
                False



-- union : Maybe DataType -> Maybe DataType -> Maybe DataType
-- union data1 data2 =
--     fun_set1 >> fun_set2
-- Output
-- x =
--     IntType 5
-- y =
--     IntType 8
-- display_fun_set : DataType -> String
-- display_fun_set dataType =
--     case dataType of
--         IntType int ->
--             String.fromInt int
--         BoolType bool ->
--             if bool then
--                 "True"
--             else
--                 "False"
--         StringType string ->
--             string
--         SuccessType ->
--             "SuccessType"
-- funSetOutput : String
-- funSetOutput =
--     fun_set x y
--         |> Maybe.map display_fun_set
--         |> Maybe.withDefault "Nil"
-- singletonSetOutput : String
-- singletonSetOutput =
--     singleton_set x y
--         |> Maybe.map display_fun_set
--         |> Maybe.withDefault "Nil"


main =
    text ""



--(funSetOutput ++ " - " ++ singletonSetOutput)
