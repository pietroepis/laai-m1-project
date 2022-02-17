include "globals.mzn";

int: c1;
int: c2;
var int: n;

constraint n * (c1 ^ 3) <= (c2 ^ 3);

solve maximize n;