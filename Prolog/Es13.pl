% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

% Your program goes here
program(Vars) :-
    length(Vars, 3),
    Vars = [C1, C2, N],
    [C1, C2] ins 0..30,
    N in 0..100000,
    N * (C1 ^ 3) #=< (C2 ^ 3).

% ?- program([10, 20, N]), once(labeling([max(N)], [N]))