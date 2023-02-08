module BST where

    -- Exercice 1
    data BST a = Empty | Node a (BST a) (BST a) deriving (Show, Eq)

    -- Exercice 2
    example :: BST Int
    example = Node 8 
                (Node 3 
                    (Node 1 Empty Empty) 
                    (Node 6 (Node 4 Empty Empty) (Node 7 Empty Empty) )
                ) 
                (Node 10 
                    Empty 
                    (Node 14 (Node 13 Empty Empty) Empty )
                )

    -- Exercice 3
    belongs :: (Eq a,Ord a) => a -> BST a -> Bool
    belongs _ Empty = False
    belongs x (Node y fg fd)
        | x == y = True
        | x < y = belongs x fg
        | otherwise = belongs x fd
    
    -- Exercice 4
    toList :: BST a -> [a]
    toList Empty = []
    toList (Node x fg fd) = toList fg ++ [x] ++ toList fd

    -- Exercice 5
    insert :: (Eq a,Ord a) => a -> BST a -> BST a
    insert x Empty = Node x Empty Empty
    insert x (Node y fg fd)
        | x == y = Node y fg fd
        | x < y = Node y (insert x fg) fd
        | otherwise = Node y fg (insert x fd)

    -- Exercice 6
    valid :: (Bounded a, Eq a, Ord a) => BST a -> Bool
    valid Empty = True
    valid (Node x fg fd) = 
        (x > minBound) && (x < maxBound) && 
        (valid fg) && (valid fd) && 
        (not (belongs x fg)) && (not (belongs x fd))

    -- Exercice 7
    -- On a besoin de la plus petite valeur de l'arbre pour supprimer la racine
    min :: BST a -> a
    min Empty = error "Empty tree"
    min (Node x Empty _) = x
    min (Node _ fg _) = BST.min fg

    -- On supprime la racine de l'arbre
    -- Si elle a un fd et fg, on remplace la racine par la plus petite valeur du fd
    deleteRoot :: (Eq a,Ord a) => BST a -> BST a
    deleteRoot Empty = Empty
    deleteRoot (Node _ Empty Empty) = Empty
    deleteRoot (Node _ fg Empty) = fg
    deleteRoot (Node _ Empty fd) = fd
    deleteRoot (Node _ fg fd) = Node x fg fd'
        where
            x = BST.min fd
            fd' = delete x fd

    delete :: (Eq a,Ord a) => a -> BST a -> BST a
    delete _ Empty = Empty
    delete x (Node y fg fd)
        | x == y = deleteRoot (Node y fg fd)
        | x < y = Node y (delete x fg) fd
        | otherwise = Node y fg (delete x fd)
