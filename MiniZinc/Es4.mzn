include "globals.mzn";

array [1..4] of var 0..9: digits;
var int: sum;

constraint sum = (
  digits[1] * 1000  +
  digits[2] * 100   +
  digits[3] * 10    +
  digits[4]
);
constraint digits[1] != 0;
constraint forall(i in 1..4)(digits[i] mod 2 = 0);
constraint all_different(digits);
constraint sum mod 11 = 0;

solve minimize sum;