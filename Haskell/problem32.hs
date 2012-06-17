{- (**) Determine the greatest common divisor of two positive integer numbers.
         Use Euclid's algorithm. -}

gcd' :: Int -> Int -> Int
gcd' x y
    | x >= y = gcd'' x y
    | otherwise = gcd'' y x

gcd'' :: Int -> Int -> Int
gcd'' x 0 = x
gcd'' x y = gcd'' y $ x `mod` y
