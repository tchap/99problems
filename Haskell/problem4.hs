{- (*) Find the number of elements of a list. -}

import Control.Applicative

len :: [a] -> Int
len = len_ 0

len_ :: Int -> [a] -> Int
len_ acc [] = acc
len_ acc (_:xs) = len_ (acc + 1) xs

len' :: [a] -> Int
len' = foldr (const succ) 0

len'' :: [a] -> Int
len'' xs = sum $ const 1 <$> xs
