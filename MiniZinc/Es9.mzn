include "globals.mzn";

array[1..8] of var 0..9: date;

int: start_date = 20210919;

constraint date[7] <= 3;
constraint date[7] == 3 -> (date[8] == 0 \/ date[8] == 1);
constraint date[5] <= 1;
constraint date[5] == 1 -> date[6] <= 2;
constraint forall(i in 1..8)(count(date, date[i], 2));
constraint nvalue(4, date);
constraint sum(i in 1..8)(10^(8 - i) * date[i]) > start_date;

solve minimize sum(i in 1..8)(10^(8 - i) * date[i]);