module Example exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Main exposing (DataType(..))
import Test exposing (..)



-- fun_set : DataType -> DataType -> Maybe DataType
-- fun_set a b =
--     if a == b then
--         Just a
--     else
--         Nothing
-- v2
-- fun_set : a -> Maybe a


suite : Test
suite =
    let
        singleton_f_set : DataType -> Maybe DataType
        singleton_f_set =
            \data2 -> Main.singleton_set SuccessType data2

        f_contains_set_1 : DataType -> Maybe DataType
        f_contains_set_1 =
            \data2 -> Main.singleton_set SuccessType data2

        f_contains_set_2 : DataType -> Maybe DataType
        f_contains_set_2 =
            \data2 -> Main.singleton_set (BoolType False) data2
    in
    describe "fun set tests"
        [ describe "empty set"
            [ test "1" <|
                \_ -> Expect.equal Nothing (Main.empty_set (IntType 1))
            , test "2" <|
                \_ -> Expect.equal Nothing (Main.empty_set (BoolType False))
            , test "3" <|
                \_ -> Expect.equal Nothing (Main.empty_set (StringType "test"))
            ]
        , describe "singleton set"
            [ test "1"
                (\_ -> Expect.equal Nothing (singleton_f_set (IntType 1)))
            , test "2" <|
                \_ -> Expect.equal Nothing (singleton_f_set (BoolType False))
            , test "3" <|
                \_ -> Expect.equal Nothing (singleton_f_set (StringType "test"))
            , test "4" <|
                \_ -> Expect.equal (Just SuccessType) (singleton_f_set SuccessType)
            ]
        , describe "f contains test"
            [ test "1"
                (\_ -> Expect.equal True (Main.f_contains f_contains_set_1 SuccessType))
            ]
        ]
