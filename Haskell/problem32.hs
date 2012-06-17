{- (**) Determine the greatest common divisor of two positive integer numbers.
         Use Euclid's algorithm. -}

gcd' x 0 = x
gcd' x y = gcd' y $ x `mod` y
