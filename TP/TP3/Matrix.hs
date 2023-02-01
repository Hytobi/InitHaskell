module Matrix where

-- Exercice 1
type Matrix = (Integer, Integer) -> (Bool, Integer)

-- Exercice 2
sparse :: Matrix
sparse (2, 3) = (True, 1)
sparse (3, 2) = (True, 1)
sparse (i, j)
    | 1 <= i && i <= 3 && 1 <= j && j <= 4 = (True, 0)
    | otherwise = (False, 0)

matA :: Matrix
matA (i,j)
    | i < 1 || j < 1 = (False, 0)
    | i > 4 || j > 4 = (False, 0)
    | otherwise = (True, 2*i + j)

-- Exercice 3
identity :: Integer -> Matrix
identity n (i,j)
    | n < 1 = (False, 0)
    | i < 1 || j < 1 = (False, 0)
    | i > n || j > n = (False, 0)
    | i == j = (True, 1)
    | otherwise = (True, 0)

-- Exercice 4
maxI :: Matrix -> Integer
maxI m = maxI' m 1
    where 
        maxI' m i
            | fst (m (i,1)) == False = i-1
            | otherwise = maxI' m (i+1)

maxJ :: Matrix -> Integer
maxJ m = maxJ' m 1
    where 
        maxJ' m j
            | fst (m (1,j)) == False = j-1
            | otherwise = maxJ' m (j+1)

dims :: Matrix -> (Integer, Integer)
dims m = (i,j)
    where
        (i,j) = (maxI m, maxJ m)

-- Exercice 5
toList :: Matrix -> [[Integer]]
toList m = toList' m 1
    where
        toList' m i
            | i > maxI m = []
            | otherwise = (toList'' m i 1) : (toList' m (i+1))
        toList'' m i j
            | j > maxJ m = []
            | otherwise = snd (m (i,j)) : (toList'' m i (j+1))

-- Exercice 6
add :: Matrix -> Matrix -> Matrix
add m1 m2 (i,j)
    | fst (m1 (i,j)) == False = (False, 0)
    | fst (m2 (i,j)) == False = (False, 0)
    | otherwise = (True, snd (m1 (i,j)) + snd (m2 (i,j)))


