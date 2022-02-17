include "globals.mzn";

array[1..9] of var 1..9: pos;
var int: l1;
var int: l2;
var int: l3;
var int: sum;

constraint sum(i in 1..4)(pos[i]) = l1;
constraint sum(i in 4..7)(pos[i]) = l2;
constraint sum(i in 7..9)(pos[i]) + pos[1] = l3;
constraint all_different(pos);
constraint sum = l1 + l2 + l3;

solve maximize sum;