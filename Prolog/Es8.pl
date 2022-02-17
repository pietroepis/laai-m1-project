% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

% Your program goes here
program(Vars) :-
    length(Vars, 6),
    Vars = [C1, C2, C3, C4, Sum, BirthYear],
    [C1, C2, C3, C4] ins 0..9,
    Sum in 0..36,
    BirthYear in 0..3000,
    Sum #= C1 + C2 + C3 + C4,
    Sum * 5 #= ((C1 * 1000 + C2 * 100 + C3 * 10 + C4) - BirthYear).

% ?- program([PC1, C2, C3, C4, Sum, 2000]), label([PC1, C2, C3, C4, Sum])