{- (*) Find the last element of a list. -}

lst :: [a] -> a
lst [x] = x
lst (_:xs) = lst xs

lst' :: [a] -> a
lst' = head . reverse

lst'' :: [a] -> a
lst'' = foldl1 (\x y -> y)

lst''' :: [a] -> a
lst''' = foldr1 (\x y -> y)

lst'''' :: [a] -> a
lst'''' = foldr1 (flip const)

lst''''' :: [a] -> a
lst''''' = foldr1 (const id)

lst'''''' :: [a] -> a
lst'''''' = foldr1 (curry snd)
