module ElmTest.Assertion where

{-| The basic component of a test case, an assertion.

# Assert
@docs assertT, assert, assertEqual, assertNotEqual

-}    

data Assertion = AssertTrue     (() -> Bool)
               | AssertFalse    (() -> Bool)
               | AssertEqual    (() -> Bool) String String
               | AssertNotEqual (() -> Bool) String String

{-| Basic function to create an Assert True assertion. Delays execution until tests are run. -}
assertT : (() -> Bool) -> Assertion
assertT = AssertTrue

{-| Basic function to create an Assert True assertion. Delays execution until tests are run. -}          
assert : Bool -> Assertion
assert b = AssertTrue (\_ -> b)

{-| Basic function to create an Assert Equals assertion, the expected value goes on the left. -}
assertEqual : a -> a -> Assertion
assertEqual a b = AssertEqual (\_ -> a == b) (show a) (show b)

{-| Given a list of values and another list of expected values,
generate a list of Assert Equal assertions. -}
assertionList : [a] -> [a] -> [Assertion]
assertionList xs ys = zipWith assertEqual xs ys

{-| Basic function to create an Assert Not Equals assertion. -}
assertNotEqual : a -> a -> Assertion
assertNotEqual a b = AssertNotEqual (\_ -> a /= b) (show a) (show b)