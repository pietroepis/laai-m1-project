include "globals.mzn";

array[1..4] of var 0..9: digits;
var int: number;

constraint number = 
  digits[1] * 1000  + 
  digits[2] * 100   +
  digits[3] * 10    + 
  digits[4];  
constraint digits[1] != 0;
constraint exists(i in 1..4)(digits[i] = 0);
constraint (digits[2] = 0 /\ (digits[1] * 100   +
  digits[3] * 10    + 
  digits[4]) = number / 9) \/
  (digits[3] = 0 /\ (digits[1] * 100   +
  digits[2] * 10    + 
  digits[4]) = number / 9) \/
  (digits[4] = 0 /\ (digits[1] * 100   +
  digits[2] * 10    + 
  digits[3]) = number / 9);
  
solve minimize number;