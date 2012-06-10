{- (*) Find the last but one element of a list. -}

lbo :: [a] -> a
lbo [x, _] = x
lbo (_:xs) = lbo xs

lbo' :: [a] -> a
lbo' = head . tail . reverse

lbo'' :: [a] -> a
lbo'' = head . drop 1 . reverse
