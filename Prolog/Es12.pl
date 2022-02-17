% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

% Your program goes here
program(Vars) :-
    length(Vars, 2),
    Vars = [C1, C2],
    Vars ins 0..9,
    (C1 * 10 + C2) * 4 - 3 #= (C2 * 10 + C1).    

% ?- program([C1, C2]), label([C1, C2])