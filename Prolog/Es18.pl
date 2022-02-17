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
    Vars = [H, M, S, HDegree, MDegree, SDegree],
    H in 0..11,
    M in 0..59,
    S in 0..59,
    HDegree in 0..360,
    MDegree in 0..360,
    SDegree in 0..360,
    HDegree #= (H * 30),
    MDegree #= (M * 6),
    SDegree #= (S * 6),
    abs(HDegree - MDegree) #= 120,
    abs(HDegree - SDegree) #= 120,
    abs(MDegree - SDegree) #= 120.    
    
% ?- program([H, M, S, HDegree, MDegree, SDegree]), label([H, M, S, HDegree, MDegree, SDegree])