include "globals.mzn";

var 0..9: c1;
var 0..9: c2;

constraint (c1 * 10 + c2) * 4 - 3 = (c2 * 10 + c1);