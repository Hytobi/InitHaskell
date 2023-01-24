module TestList where
import List


testMyConcat::[Bool]
testMyConcat = 
    [
        myConcat ([] :: [Integer], []) == [], 
        myConcat ([1,2,3], []) == [1,2,3], 
        myConcat ([], [4,5,6]) == [4,5,6], 
        myConcat ([1,2,3], [4,5,6]) == [1,2,3,4,5,6]
    ]

testMyReverse::[Bool]
testMyReverse = 
    [
        myReverse ([] :: [Integer]) == [], 
        myReverse [1,2,3] == [3,2,1], 
        myReverse [1,2,3,4,5,6] == [6,5,4,3,2,1]
    ]

testMyPalindrome::[Bool]
testMyPalindrome = 
    [
        myPalindrome ([] :: [Integer]) == True,
        myPalindrome [1,1] == True,
        myPalindrome "abc" == False,
        myPalindrome "ressasser" == True,
        myPalindrome "essayasse" == True,
        myPalindrome "une phrase quelconque" == False,
        myPalindrome "saippuakivikauppias" == True, -- "un marchand de stéalite" en Finnois
        myPalindrome "sator arepo tenet opera rotas" == True -- Le Carré Sator.
    ]

testDuplicate::[Bool]
testDuplicate = 
    [
        duplicate ([] :: [Integer]) == [], 
        duplicate [1] == [1,1],
        duplicate [1,2,3] == [1,1,2,2,3,3]
    ]

testMyRepeat::[Bool]
testMyRepeat = 
    [
        myRepeat (-1,3) == [],
        myRepeat ( 0,3) == [],
        myRepeat ( 3,3) == [3,3,3],
        myRepeat ( 3,[3]) == [[3],[3],[3]]
    ]

testMyReplicate::[Bool]
testMyReplicate = 
    [
        myReplicate (-1,[1,2,3]) == [],
        myReplicate ( 0,[1,2,3]) == [],
        myReplicate ( 1,[1,2,3]) == [1,2,3],
        myReplicate ( 3,[] :: [Integer]) == [],
        myReplicate ( 3,[1,2,3]) == [1,1,1,2,2,2,3,3,3]
    ]

testCompress::[Bool]
testCompress =
    [
        compress ([] :: [Integer]) == [],
        compress [1] == [1],
        compress [1,2,2,2,3,4,4,5,6,6,7,7,7,7] == [1,2,3,4,5,6,7]
    ]

testPack::[Bool]
testPack =
    [
        pack ([] :: [Integer]) == [],
        pack [1] == [[1]],
        pack [1,2] == [[1],[2]],
        pack [1,1,2,2] == [[1,1],[2,2]],
        pack [1,2,2,2,3,4,4,5,6,6,7,7,7,7] == [[1],[2,2,2],[3],[4,4],[5],[6,6],[7,7,7,7]]
    ]

testRange::[Bool]
testRange =
    [
        range (0,0) == [0],
        range (1,-1) == [],
        range (-1,-2) == [],
        range (-1,1) == [-1,0,1],
        range (-10,10) == [-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10]
    ]

testMyTake::[Bool]
testMyTake =
    [
        myTake (-1,[1,2,3]) == [],
        myTake (0,[1,2,3]) == [],
        myTake (2,[1,2,3]) == [1,2],
        myTake (54,[1,2,3]) == [1,2,3]
    ]

testSuffix::[Bool]
testSuffix =
    [
        suffix (-1,[1,2,3]) == [],
        suffix ( 0,[1,2,3]) == [],
        suffix ( 2,[1,2,3]) == [2,3],
        suffix (54,[1,2,3]) == [1,2,3],
        suffix (4,[] :: [Integer]) == []
    ]

testSlice::[Bool]
testSlice =
    [
        slice ( 0,0,[1,2,3]) == [1],
        slice ( 0,2,[1,2,3] :: [Integer]) == [1,2,3],
        slice ( 0,8,[1,2,3] :: [Integer]) == [1,2,3],
        slice ( 2,2,[1,2,3] :: [Integer]) == [3],
        slice ( 0,4,[] :: [Integer]) == [],
        slice ( 2,0,[1,2,3] :: [Integer]) == [],
        slice (-1,1,[1,2,3] :: [Integer]) == []
    ]

test :: [Bool] -> Bool
test [] = True
test (x : xs) = x && test xs

testAll :: [Char]
testAll
    | test [ 
        test testMyConcat, 
        test testMyReverse,
        test testMyPalindrome,
        test testDuplicate,
        test testMyReplicate,
        test testRange,
        test testMyTake,
        test testSuffix,
        test testSlice
         ] == True = "Success!"
    | otherwise = "Fail!"