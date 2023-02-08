module TestBST where
import BST

testBelongs :: [Bool]
testBelongs = [
    not (belongs 0 example),
    belongs 1 example,
    belongs 13 example
    ]

testToList :: [Bool]
testToList = [
    toList example == [1,3,4,6,7,8,10,13,14],
    toList Empty == ([] :: [Integer])
    ]

testInsert :: [Bool]
testInsert = [
    toList (insert 0 example) == [0,1,3,4,6,7,8,10,13,14],
    toList (insert 1 example) == [1,3,4,6,7,8,10,13,14],
    toList (insert 13 example) == [1,3,4,6,7,8,10,13,14],
    toList (insert 15 example) == [1,3,4,6,7,8,10,13,14,15],
    insert 1 example == example,
    belongs 5 (insert 5 example),
    belongs 9 (insert 9 example)
    ]

testValid :: [Bool]
testValid = [
    valid example,
    valid (insert 1 example),
    valid (insert 5 example)
    ]

testMin :: [Bool]
testMin = [
    BST.min example == 1,
    BST.min (insert 0 example) == 0,
    BST.min (insert 5 example) == 1,
    BST.min (insert 15 example) == 1
    ]

testDeleteRoot :: [Bool]
testDeleteRoot = [
    deleteRoot example == Node 10 (Node 3 (Node 1 Empty Empty) (Node 6 (Node 4 Empty Empty) (Node 7 Empty Empty))) (Node 14 (Node 13 Empty Empty) Empty),
    deleteRoot (Node 1 Empty Empty) == Empty,
    deleteRoot (Node 1 (Node 0 Empty Empty) Empty) == Node 0 Empty Empty,
    deleteRoot (Node 1 Empty (Node 2 Empty Empty)) == Node 2 Empty Empty,
    deleteRoot (Node 1 (Node 0 Empty Empty) (Node 2 Empty Empty)) == Node 2 (Node 0 Empty Empty) Empty
    ]

testDelete :: [Bool]
testDelete = [
    delete 0 example == example,
    let x = delete 8 example in valid x && not (belongs 8 x),
    delete 8 (delete 3 (delete 10(delete 1(delete 14 (delete 6 (delete 4 (delete 13 (delete 7 example)))))))) == Empty
    ]

test :: [Bool] -> Bool
test [] = True
test (x : xs) = x && test xs

testAll :: [Char]
testAll
    | test [ 
        test testBelongs, 
        test testToList,
        test testInsert,
        test testValid,
        test testMin,
        test testDeleteRoot,
        test testDelete
         ] == True = "Success!"
    | otherwise = "Fail!"