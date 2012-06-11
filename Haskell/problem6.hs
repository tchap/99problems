{- (*) Find out whether a list is a palindrome.
       A palindrome can be read forward or backward; e.g. (x a m a x). -}

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == reverse xs

isPalindrome' :: (Eq a) => [a] -> Bool
isPalindrome' xs = isPalindrome_' xs xs []

isPalindrome_' :: (Eq a) => [a] -> [a] -> [a] -> Bool 
isPalindrome_' (x:xs) (_:_:ys) acc = isPalindrome_' xs ys (x:acc)
isPalindrome_' (_:xs) [_] acc = isPalindrome_' xs [] acc
isPalindrome_' xs [] acc = xs == acc
