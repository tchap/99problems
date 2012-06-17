{- (**) Calculate Euler's totient function phi(m). -}

phi :: Int -> Int
phi m = length $ filter (\x -> gcd m x == 1) [1,2..m]

{- or you can use the well-known formula for computing phi,
   which includes finding m's factors first -}
