include "globals.mzn";

int: n_deck_1 = 25;
int: n_deck_2 = 27;
int: n_red_1 = 12;
var int: n_red_2;
var int: n_black_1;
var int: n_black_2;

constraint n_red_1 + n_red_2 + n_black_1 + n_black_2 = n_deck_1 + n_deck_2;
constraint n_red_1 + n_red_2 = (n_deck_1 + n_deck_2) / 2;
constraint n_black_1 + n_black_2 = (n_deck_1 + n_deck_2) / 2;
constraint n_red_1 + n_black_1 = n_deck_1;
constraint n_red_2 + n_black_2 = n_deck_2;

solve satisfy