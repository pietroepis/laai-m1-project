include "globals.mzn";

array[1..6] of var 0..9: time;

constraint time[1] == 2 -> time[2] < 4;
constraint time[1] <= 2 /\ time[3] < 6 /\ time[5] < 6;
constraint all_different(time);
constraint sum(time) = 15;
  
solve satisfy;

% To get all solutions set geocode options
% Configuration Editor -> Solving (User defined behavior) -> Uncheck "Stop after this many solutions"
% Check "Output solving statistics"