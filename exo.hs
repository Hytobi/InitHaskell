{-
@Author: Patrice PLOUVIN - L3 Info
@Date: 03-01-2023
@Description: Exercices de programmation fonctionnelle

Dans le terminal : ghci + :load exo.hs + la fonction
-}

{- Écrivez une fonction qui, étant donné quatre nombres,
retourne vrai si tous les nombres sont égaux
faux sinon.-}

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
longueur (ax,ay,bx,by) = sqrt ( dist(ax,bx)*dist(ax,bx) + dist(ay,by)*dist(ay,by))

{- Écrivez une fonction qui détermine s’il est possible de créer une chaîne avec deux dominos donnés. -}

dominoCompatible (a,b,c,d) = a == c || a == d || b == c || b == d

chaineDomino::((Int,Int),(Int,Int)) -> Bool
chaineDomino (a, b) = fst(a) == fst(b) || fst(b) == snd(a) || snd(a) == snd(b) || fst(a) == snd(b)

{- Écrivez une fonction qui détermine s’il est possible de créer une chaîne avec trois dominos donnés. -} 

chaineDominoTrois::((Int,Int),(Int,Int),(Int,Int)) -> Bool
chaineDominoTrois (a, b, c) = chaineDomino (a, b) || chaineDomino (a, c) || chaineDomino (b, c)

{- Écrivez une fonction qui, étant donné une somme s en centimes d’euros et des nombres de
pièces a, b, c et d, respectivement de 2, 1, 0,5 et 0,10 euros, retourne vrai si l’on peut payer
exactement la somme en utilisant une partie ou la totalité des pièces et faux sinon.-}

compteEstBon (a, b, c, d, s)
    | a < 0 || b < 0 || c < 0 || d < 0 || s < 0 = False
    | s == 0 = True
    | a*200 + b*100 + c*50 + d*10 == s = True
    | a*200 + b*100 + c*50 + d*10 < s = False
    | otherwise = compteEstBon (a-1, b, c, d, s-200) || compteEstBon (a, b-1, c, d, s-100) || compteEstBon (a, b, c-1, d, s-50) || compteEstBon (a, b, c, d-1, s-10)
