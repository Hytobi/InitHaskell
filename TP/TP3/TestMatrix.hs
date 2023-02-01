module TestMatrix where
import Matrix

testMatA :: [Bool]
testMatA = [
    matA (1,1) == (True, 3),
    matA (2,3) == (True, 7),
    matA (3,8) == (False, 0),
    matA (4,4) == (True, 12)
    ]

testIdentity :: [Bool]
testIdentity = [
    identity 3 (2,2) == (True,1),
    identity 3 (1,2) == (True,0),
    identity 3 (2,7) == (False,0)
    ]

testDims :: [Bool]
testDims = [
    dims matA == (4,4),
    dims (identity 3) == (3,3),
    dims sparse == (3,4)
    ]

testToList :: [Bool]
testToList = [
    toList sparse == [[0,0,0,0],[0,0,1,0],[0,1,0,0]],
    toList matA == [[3,4,5,6],[5,6,7,8],[7,8,9,10],[9,10,11,12]],
    toList (identity 3) == [[1,0,0],[0,1,0],[0,0,1]]
    ]

testAdd :: [Bool]
testAdd = [
    (add (identity 3) (identity 3)) (1,1) == (True, 2),
    (add (identity 3) matA) (2,3) == matA (2,3),
    (add matA matA) (1,1) == (True, 6)
    ]

test :: [Bool] -> Bool
test [] = True
test (x : xs) = x && test xs

testAll :: [Char]
testAll
    | test [ 
        test testMatA, 
        test testIdentity,
        test testDims,
        test testToList,
        test testAdd
         ] == True = "Success!"
    | otherwise = "Fail!"