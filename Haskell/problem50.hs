{- (***) Huffman codes. -}

import Data.List
import Data.Ratio

data Tree v p = Node (v, p) (Tree v p) (Tree v p) | Empty deriving (Show, Eq)

{- compare by priorities -}
instance (Eq v, Ord p) => Ord (Tree v p) where
    Empty `compare` Empty = EQ
    Empty `compare` _ = LT
    _ `compare` Empty = GT
    (Node (_, pr1) _ _) `compare` (Node (_, pr2) _ _) = pr1 `compare` pr2

{- insert probabilities and continue -}
huffman :: [(Char, Int)] -> [(Char, String)]
huffman ps = huffman' rs
    where
        (rs, acc, _) = 
	    let ff (rs, acc, w) (c, p) = ((c, p % w):rs, acc + p, w)
	    in foldl ff ([], 0, acc) ps

{- convert to a tree, insert codes, convert back -}
huffman' :: [(Char, Ratio Int)] -> [(Char, String)]
huffman' srs = flatten $ toCodeTree ht ""
    where
        ht = toProbTree $ sort [Node k Empty Empty | k <- srs]

{- build the probability tree from a list of (symbol, probability) -}
toProbTree :: [Tree Char (Ratio Int)] -> Tree Char (Ratio Int)
toProbTree [t] = t
toProbTree (t1:t2:ts) =
    let Node (_, p1) _ _ = t1
        Node (_, p2) _ _ = t2
        t = Node ('x', p1 + p2) t1 t2
    in toProbTree $ sort (t:ts)

{- convert a probability tree to the code tree -}
toCodeTree :: Tree Char (Ratio Int) -> String -> Tree Char String
toCodeTree Empty _ = Empty
toCodeTree (Node (v, _) t1 t2) c =
    let ct1 = toCodeTree t1 $ c ++ "0"
	ct2 = toCodeTree t2 $ c ++ "1"
    in Node (v, c) ct1 ct2

{- convert a tree back to a list -}
flatten :: Tree Char String -> [(Char, String)]
flatten (Node k Empty Empty) = [k]
flatten (Node _ t1 t2) = concatMap flatten [t1, t2]
