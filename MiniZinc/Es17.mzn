include "globals.mzn";

var int: N;
var int: N3;
var int: N4;
int: max_digits = 9;
array[1..max_digits] of var 0..9: N3_digits;
array[1..max_digits] of var 0..9: N4_digits;

constraint sum(i in 1..max_digits)(10^(max_digits - i) * N3_digits[i]) = N3;
constraint sum(i in 1..max_digits)(10^(max_digits - i) * N4_digits[i]) = N4;
constraint N3 = N^3;
constraint N4 = N^4;
constraint alldifferent_except_0(N3_digits ++ N4_digits);
constraint forall(i in 0..9)(exists(j in 1..max_digits)(N3_digits[j] = i \/ N4_digits[j] = i));

solve satisfy;