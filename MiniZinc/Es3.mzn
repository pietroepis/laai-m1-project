include "globals.mzn";
int: h = 5;
int: w = 9;
array[1..h, 1..w] of 0..1: map = array2d(1..h, 1..w, [
  0, 0, 0, 0, 0, 0, 1, 1, 1,
  0, 0, 0, 0, 0, 0, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1,
  0, 0, 0, 0, 1, 1, 1, 1, 0,
  0, 0, 0, 0, 1, 1, 1, 1, 1
]);
array[1..(h * w), 1..2] of var 1..h: rectangles_i;
array[1..(h * w), 1..2] of var 1..w: rectangles_j;

var 1..(h*w): n_rectangles;


constraint forall(i in 1..n_rectangles)(
  rectangles_i[i, 1] <= rectangles_i[i, 2] /\ rectangles_j[i, 1] <= rectangles_j[i, 2]
);
constraint forall(i in 1..h)(
  forall(j in 1..w)(
    map[i, j] = 1 -> exists(k in 1..n_rectangles)(
      rectangles_i[k, 1] <= i /\ i <= rectangles_i[k, 2] /\ rectangles_j[k, 1] <= j /\ j <= rectangles_j[k, 2]
    )
  )
);
constraint forall(i in 1..n_rectangles)(
  forall(j in 1..n_rectangles)(
    i < j -> (rectangles_i[i, 2] < rectangles_i[j, 1] \/ rectangles_j[i, 2] < rectangles_j[j, 1])
  )
);

constraint forall(i in 1..n_rectangles)(
  forall(j in rectangles_i[i, 1]..rectangles_i[i, 2])(
    forall(k in rectangles_j[i, 1]..rectangles_j[i, 2])(
      map[j, k] = 1
    )
  )
);
solve minimize n_rectangles;

%  Settings:
%    1) Optimization level: -O5
%    2) Number of threads: 10
%    3) Random Seed: 5