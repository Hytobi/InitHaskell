{-
Écrivez une fonction qui, étant donné quatre nombres,
retourne vrai si tous les nombres sont égaux
faux sinon.
-}

egaux (a, b, c, d) = a == b && a == c && a == d

{-Écrivez une fonction qui, étant donné quatre nombres, retourne le plus grand des quatre.-}


maxi (a, b, c, d) 
    | a >= b && a >= c && a >= d = a
    | b >= a && b >= c && b >= d = b
    | c >= a && c >= b && c >= d = c
    | otherwise = d


{-Écrivez une fonction qui, étant donné quatre nombres, retourne le plus éloigné des quatre.
(La distance entre deux nombres est la valeur absolue de leur différence. La distance entre
un nombre x et un ensemble de nombres est la somme des distances entre x et chacun des
nombres de l’ensemble.)-}

{- on peut le faire mais pas dans le fichier car deja def
abs x
    | x < 0 = (-x)
    | otherwise = x
-}

dist (x, y) = abs (x-y)

distQ (x, a, b, c) = dist(x,a) + dist(x,b) + dist(x,c)

plusEloigne (a, b, c, d)
    | maxi (distQ(a,b,c,d),distQ(b,a,c,d),distQ(c,b,a,d),distQ(d,b,c,a)) == distQ(a,b,c,d) = a
    | maxi (distQ(a,b,c,d),distQ(b,a,c,d),distQ(c,b,a,d),distQ(d,b,c,a)) == distQ(b,a,c,d) = b
    | maxi (distQ(a,b,c,d),distQ(b,a,c,d),distQ(c,b,a,d),distQ(d,b,c,a)) == distQ(c,b,a,d) = c
    | otherwise = d

plusEloigneOpti (a, b, c, d) =
    let da = distQ(a,b,c,d)
        db = distQ(b,a,c,d)
        dc = distQ(c,b,a,d)
        dd = distQ(d,b,c,a)
        m = maxi (da, db, dc, dd)
    in
        f (m,da,db,dc)
    where
        f (m,da,db,dc)
            | m == da = a
            | m == db = b
            | m == dc = c
            | otherwise = d


{-Écrivez une fonction qui, étant donné deux points A et B du plan, calcule la longueur du segment [AB].-}
longueur (xa,xb,ya,yb) = sqrt ( dist(xa,ya)*dist(xa,ya) + dist(xb,yb)*dist(xb,yb))


{- Écrivez une fonction qui détermine s’il est possible de créer une chaîne avec deux dominos donnés. -}

dominoCompatible (a,b,c,d) = a == c || a == d || b == c || b == d

chaineDomino::((Int,Int),(Int,Int)) -> Bool
chaineDomino (a, b) = fst(a) == fst(b) || fst(b) == snd(a) || snd(a) == snd(b) || fst(a) == snd(b)


{- Écrivez une fonction qui détermine s’il est possible de créer une chaîne avec trois dominos donnés. -} 


{- Écrivez une fonction qui, étant donné une somme s en centimes d’euros et des nombres de
pièces a, b, c et d, respectivement de 2, 1, 0,5 et 0,10 euros, retourne vrai si l’on peut payer
exactement la somme en utilisant une partie ou la totalité des pièces et faux sinon.
-}

