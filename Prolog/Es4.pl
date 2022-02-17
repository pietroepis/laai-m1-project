% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

% Your program goes here
program(Vars) :-
    length(Vars, 5),
    Vars = [D1, D2, D3, D4, Sum],
    D1 in 0..9,
    D2 in 0..9,
    D3 in 0..9,
    D4 in 0..9, 
    Sum in 0..10000,
    Sum #= D1 * 1000 + D2 * 100 + D3 * 10 + D4,
    D1 #\= 0,
    Sum mod 11 #= 0,
    all_different([D1, D2, D3, D4]),
    D1 mod 2 #= 0,
    D2 mod 2 #= 0,
    D3 mod 2 #= 0,
    D4 mod 2 #= 0.

% ?- program([D1, D2, D3, D4, Sum]), once(labeling([min(Sum)], [D1, D2, D3, D4, Sum]))