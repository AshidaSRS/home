main = putStrLn "Hello, World!"

doubleMe x = x + x

doubleUs x y = x*2 + y*2

doubleUs' x y = doubleMe x + doubleMe y
  
doubleSmallNumber x = if x > 100
                        then x
                        else x * 2

doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1

factorialWey :: Integer -> Integer
factorialWey x = if x == 1
                    then 1
                 else x * factorialWey (x-1)
                   
sayMe :: (Integral a) => a -> String
sayMe 1 = "uan"
sayMe 2 = "Chu"
sayMe 3 = "zrui"
sayMe 4 = "for"
sayMe 5 = "faif"
sayMe 6 = "six"
sayMe 7 = "luki number"

tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " ++ show x  
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y


funsion :: (Show a) => [a] -> String
funsion [] = "vasia"
funsion (x:_) = "cabesa: " ++ show x
