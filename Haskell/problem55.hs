{- (**) Construct completely balanced binary trees -}

import Control.Applicative

data Tree a = Node a (Tree a) (Tree a) | Empty deriving (Show)

cbalTree :: Int -> [Tree Char]
cbalTree 0 = [Empty]
cbalTree n = let (q, r) = (n - 1) `quotRem` 2
    in [q .. q + r] >>= (\i -> Node 'x' <$> cbalTree i <*> cbalTree (n - i - 1))
