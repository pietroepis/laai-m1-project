include "globals.mzn";

int: path_width;
int: area;
var int: actual_area;
var int: b;
var int: h;

constraint b > 10;
constraint h > 10;
constraint b > h;
constraint b * h = area;
constraint actual_area = area - path_width * h;

solve satisfy;