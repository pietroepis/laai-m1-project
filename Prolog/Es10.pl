% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

% Your program goes here
program(Vars) :-
    length(Vars, 4),
    Vars = [Perimeter, L1, L2, GreyTiles],
    Vars ins 1..1000,
    L1 * 2 + L2 * 2 - 4 #= Perimeter,
    GreyTiles #= L1 * L2 - Perimeter .

% ?- program([18, L1, L2, GreyTiles]), once(labeling([max(GreyTiles)], [L1, L2, GreyTiles]))