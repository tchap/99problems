{- (***) Huffman codes. -}

import Data.List
import Data.Ratio

data Tree v p = Node (v, p) (Tree v p) (Tree v p) | Empty
    deriving (Show, Eq)

{- Empty never compared -}
instance (Eq v, Ord p) => Ord (Tree v p) where
    (Node (_, p1) _ _) `compare` (Node (_, p2) _ _) = p1 `compare` p2

huffman :: (Eq a) => [(a, Int)] -> [(a, String)]
huffman ps = flatten $ encode "" $ toTree $ sort [Node k Empty Empty | k <- rs]
    where
        (rs, acc, _) = 
	    let ff (rs, acc, w) (c, p) = ((c, p % w):rs, acc + p, w)
	    in foldl ff ([], 0, acc) ps

toTree :: (Eq a) => [Tree a (Ratio Int)] -> Tree a (Ratio Int)
toTree [t] = t
toTree (t1:t2:ts) =
    let Node (v, p1) _ _ = t1
        Node (_, p2) _ _ = t2
        t = Node (v, p1 + p2) t1 t2
    in toTree $ sort (t:ts)

encode :: String -> Tree a (Ratio Int) -> Tree a String
encode _ Empty = Empty
encode c (Node (v, _) t1 t2) =
    let ct1 = encode (c ++ "0") t1
	ct2 = encode (c ++ "1") t2
    in Node (v, c) ct1 ct2

flatten :: Tree a String -> [(a, String)]
flatten (Node k Empty Empty) = [k]
flatten (Node _ t1 t2) = concatMap flatten [t1, t2]
