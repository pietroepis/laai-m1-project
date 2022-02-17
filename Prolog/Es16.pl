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
    Vars = [H1, H2, M1, M2, S1, S2],
    Vars ins 0..9,
    H1 #=< 2, M1 #< 6, S1 #< 6,
    H1 #= 2 #==> H2 #< 4,
    all_different(Vars),
    H1 + H2 + M1 + M2 + S1 + S2 #= 15.

% ?- program(Vars), label(Vars)