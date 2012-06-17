{- (*) Determine whether two positive integer numbers are coprime.
       Two numbers are coprime if their greatest common divisor equals 1. -}

coprime :: Int -> Int -> Bool
coprime x y = gcd x y == 1
