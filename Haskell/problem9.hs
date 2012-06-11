{- (**) Pack consecutive duplicates of list elements into sublists.
        If a list contains repeated elements they should be placed
	in separate sublists. -}

pack :: (Eq a) => [a] -> [[a]]
pack = foldr ff [[]]
    where
        ff x [[]] = [[x]]
        ff x acc@(l:ls) 
	    | head l == x = (x:l):ls
	    | otherwise = [x]:acc
