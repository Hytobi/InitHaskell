module CarteBanque where

-- Exercice 1
toDigitsRev :: Integer -> [Integer]
toDigitsRev n
    | n <= 0 = []
    | otherwise = (n `mod` 10) : toDigitsRev (n `div` 10)


--Exercice 2
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther [x] = [x]
doubleEveryOther (x:y:xs) = x : (2*y) : doubleEveryOther xs


--Exercice 3
rem9 :: Integer -> Integer
rem9 n
    | n < 0 = 0
    | n < 10 = n
    | otherwise = n-9

--Exercice 4
--On fait le rem9 en meme temps
sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:xs) = (rem9 x) + sumDigits xs

--Exercice 5
validate :: Integer -> Bool
validate n = (sumDigits(doubleEveryOther (toDigitsRev n)) `mod` 10 ) == 0
