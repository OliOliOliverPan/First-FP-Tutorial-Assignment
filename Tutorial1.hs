module Tutorial1 where

import PicturesSVG -- needed for the optional chess part
import Test.QuickCheck

-- Exercise 2:

double :: Int -> Int
double x = x + x

square :: Int -> Int
square x = x * x

-- Exercise 3:

isTriple :: Int -> Int -> Int -> Bool
isTriple a b c = square a + square b == square c

-- Exercise 4:

leg1 :: Int -> Int -> Int
leg1 x y = square x - square y

leg2 :: Int -> Int -> Int
leg2 x y = 2*x*y

hyp :: Int -> Int -> Int
hyp x y = square x + square y

-- Exercise 5:

prop_triple :: Int -> Int -> Bool
prop_triple x y = isTriple (leg1 x y) (leg2 x y) (hyp x y)

-- Exercise 7:

pic1 :: Picture
pic1 = above (beside knight (invert knight)) (beside (invert knight) knight)

pic2 :: Picture
pic2 = above (beside knight (invert knight)) (beside (flipV (invert knight))  (flipV knight))

-- Functions --

twoBeside :: Picture -> Picture
twoBeside x = beside x (invert x)

-- Exercise 8:

twoAbove :: Picture -> Picture
twoAbove x = above x (invert x)

fourPictures :: Picture -> Picture
fourPictures x = twoAbove(twoBeside x) 

-- Exercise 9:
-- a)

emptyRow :: Picture
emptyRow = repeatH 4 (beside (invert blackSquare) blackSquare)

-- b)

otherEmptyRow :: Picture
otherEmptyRow = repeatH 4 (twoAbove blackSquare)

-- c)

middleBoard :: Picture
middleBoard = repeatV 2 (above emptyRow otherEmptyRow)

-- d)

whiteRow :: Picture
whiteRow = beside (beside (beside (over rook blackSquare) (over knight whiteSquare)) (beside (over bishop blackSquare) (over king whiteSquare))) (beside (beside (over queen blackSquare) (over bishop whiteSquare)) (beside (over knight blackSquare) (over rook whiteSquare)))

blackRow :: Picture
blackRow = invert whiteRow

-- e)

populatedBoard :: Picture
populatedBoard = above (above (above blackRow (repeatH 4 (beside (over (invert pawn) blackSquare) (over (invert pawn) whiteSquare)))) middleBoard) (above (repeatH 4 (beside (over pawn whiteSquare) (over pawn blackSquare))) whiteRow)


