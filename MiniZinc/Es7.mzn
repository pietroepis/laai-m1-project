include "globals.mzn";

array [1..11, 1..4] of var 0..9: numbers;
var int: initial;

constraint initial = 
  numbers[1, 1] * 1000  + 
  numbers[1, 2] * 100   +
  numbers[1, 3] * 10    + 
  numbers[1, 4];
  
constraint forall (i in 1..11) (
  (numbers[i, 1] * 1000 + 
  numbers[i, 2] * 100   + 
  numbers[i, 3] * 10    + 
  numbers[i, 4]) = initial * i
);

constraint forall (i in 1..11) (
  numbers[i, 1] = 9 \/
  numbers[i, 2] = 9 \/
  numbers[i, 3] = 9 \/
  numbers[i, 4] = 9
);

solve satisfy