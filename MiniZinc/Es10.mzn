include "globals.mzn";

int: perimeter;
var int: l1;
var int: l2;
var int: gray_tiles;

constraint l1 > 0 /\ l2 > 0;
constraint 2 * l1 + 2 * l2 - 4 = perimeter;
constraint gray_tiles = (l1 * l2) - perimeter;

solve maximize gray_tiles;