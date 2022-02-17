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
    Vars = [PathWidth, Area, ActualArea, B, H],
    Vars ins 0..100000,
    B #> 10,
    H #> 10,
    B #> H,
    B * H #= Area,
    ActualArea #= Area - PathWidth * H.

% ?- program([5, 2021, ActualArea, B, H]), label([ActualArea, B, H])