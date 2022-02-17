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
    Vars = [NDeck1, NDeck2, NRed1, NRed2, NBlack1, NBlack2],
    Vars ins 0..100,
    NRed1 + NRed2 + NBlack1 + NBlack2 #= NDeck1 + NDeck2,
    NRed1 + NRed2 #= (NDeck1 + NDeck2) // 2,
    NBlack1 + NBlack2 #= (NDeck1 + NDeck2) // 2,
    NRed1 + NBlack1 #= NDeck1,
   	NRed2 + NBlack2 #= NDeck2.

% ?- program([25, 27, 12, NRed2, NBlack1, NBlack2]), label([NRed2, NBlack1, NBlack2])