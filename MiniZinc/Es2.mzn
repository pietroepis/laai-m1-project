include "globals.mzn";

int: h = 4;
int: w = 5;
int: unit_distance = 10;
array[1..h, 1..w] of 0..1: map = array2d(1..h, 1..w, [
  0, 1, 1, 1, 0,
  1, 1, 1, 1, 1,
  1, 1, 1, 1, 1,
  0, 1, 1, 1, 0
]);
array[1..2] of int: start = [1, 2];
array[1..2] of int: end = [3, 5];
array[1..(h * w), 1..2] of var int: path;
var int: dist;
var int: n_steps;

constraint n_steps >= 0 /\ n_steps <= (h * w);
constraint path[1, 1] = start[1] /\ path[1, 2] = start[2];
constraint path[n_steps, 1] = end[1] /\ path[n_steps, 2] = end[2];
constraint forall(i in 1..n_steps)
  (path[i, 1] >= 1 /\ path[i, 1] <= h /\ path[i, 2] >= 1 /\ path[i, 2] <= w);
constraint forall(i in 2..n_steps)
  (abs(path[i, 1] - path[i - 1, 1]) + abs(path[i, 2] - path[i - 1, 2]) = 1);
constraint forall(i in 1..n_steps)
  (map[path[i, 1], path[i, 2]] = 1);
constraint forall(i in 1..n_steps)
  (forall(j in 1..n_steps)(i != j -> (path[i, 1] != path[j, 1] \/ path[i, 2] != path[j, 2])));
constraint dist = (n_steps - 1) * unit_distance;
  
solve maximize dist;