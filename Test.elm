module Test where

import open ElmTest.Assertion
import open ElmTest.Test

-- Example Usage
----------------
tests : [Test]
tests = [ (2^3) `equals` 1
        , 3 `equals` 3
        , defaultTest (assert True)
        , test "test head" (assertEqual 1 (head [1..10]))
        ]