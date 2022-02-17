include "globals.mzn";

int: n_faces = 6;
int: n_vertices = 8;
int: n_initial_cuts;
var int: n_initial_faces;
var int: n_initial_vertices;
var int: n_faces_after_cut;

constraint n_initial_faces = n_faces + n_initial_cuts;
constraint n_initial_vertices = n_vertices + 2 * n_initial_cuts;
constraint n_faces_after_cut = n_initial_faces + n_initial_vertices;
constraint n_initial_cuts <= n_vertices /\ n_initial_cuts >= 0;

solve satisfy;