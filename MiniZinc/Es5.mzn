include "globals.mzn";

int: sum = 20;
array[1..9] of var 1..9: pos;

constraint pos[1] = 1;
constraint pos[2] = 8;
constraint pos[4] = 5;
constraint pos[6] = 4;
constraint pos[9] = 7;
constraint sum(i in 1..4)(pos[i]) = sum;
constraint sum(i in 4..7)(pos[i]) = sum;
constraint sum(i in 7..9)(pos[i]) + pos[1] = sum;
constraint all_different(pos);

solve satisfy