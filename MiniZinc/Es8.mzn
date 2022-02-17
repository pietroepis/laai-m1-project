include "globals.mzn";

int: birth_year = 2000;
var 0..9: c1;
var 0..9: c2;
var 0..9: c3;
var 0..9: c4;
var int: sum;

constraint sum = c1 + c2 + c3 + c4;
constraint sum = ((c1 * 1000 + c2 * 100 + c3 * 10 + c4) - birth_year) / 5;

solve satisfy