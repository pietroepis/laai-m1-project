% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

% Your program goes here
program(Vars) :-
    length(Vars, 10),
    Vars = [P1, P2, P3, P4, P5, P6, P7, P8, P9, Sum],
    [P1, P2, P3, P4, P5, P6, P7, P8, P9] ins 0..9,
    Sum in 0..100,
    P1 + P2 + P3 + P4 #= Sum,
    P4 + P5 + P6 + P7 #= Sum,
    P7 + P8 + P9 + P1 #= Sum,
    all_different([P1, P2, P3, P4, P5, P6, P7, P8, P9]).

% ?- program([1, 8, P3, 5, P5, 4, P7, P8, 7, 20]), label([P3, P5, P7, P8])