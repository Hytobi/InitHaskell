module TestCarteBanque where
import CarteBanque

testToDigitsRev :: [Bool]
testToDigitsRev = [ toDigitsRev 1234 == [4,3,2,1], toDigitsRev 0 == [],toDigitsRev (-17) == [] ]


testDoubleEveryOther :: [Bool]
testDoubleEveryOther = [ doubleEveryOther [8,7,6,5] == [8,14,6,10], doubleEveryOther [1,2,3] == [1,4,3] ]

testRem9 :: [Bool]
testRem9 = [ rem9 0 == 0, rem9 (-12) == 0, rem9 3 == 3, rem9 12 == 3, rem9 18 == 9 ]

testSumDigits :: [Bool]
testSumDigits = [ sumDigits [1,1,8,1,0,4] == 15, sumDigits [1,2,3] == 6 ]

testValidate :: [Bool]
testValidate = [ validate 4012888888881881, not (validate 4012888888881882), not (validate 4012888888881892) ]


test :: [Bool] -> Bool
test [] = True
test (x : xs) = x && test xs

testAll :: [Char]
testAll
    | test [ test testToDigitsRev, test testDoubleEveryOther,test testRem9, test testSumDigits,test testValidate ] == True = "Success!"
    | otherwise = "Fail!"
