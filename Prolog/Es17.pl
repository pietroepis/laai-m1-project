% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

weighted_sum([], 0, 0).
weighted_sum([A | As], P, S) :-
    P1 is P - 1,
    weighted_sum(As, P1, S1),
    S is S1 + (A * (10 ^ P1)).

all_different_except_0([]).
all_different_except_0([_, []]).
all_different_except_0([H | T]) :- 
    H =\= 0,
    not(member(H, T)),
    all_different_except_0(T).
all_different_except_0([0 | T]) :- 
    all_different_except_0(T).

% Your program goes here
program(Vars) :-
    length(Vars, 5),
    Vars = [N, N3, N4, N3Digits, N4Digits],
    N in 0..20,
    N3 in 0..10000000,
    N4 in 0..10000000,
    length(N3Digits, 10),
    length(N4Digits, 10),
    N3Digits ins 0..9,
    N4Digits ins 0..9,
    N3 #= (N^3),
    N4 #= (N^4),
    weighted_sum(N3Digits, 10, N3),
    weighted_sum(N4Digits, 10, N4),
    append(N3Digits, N4Digits, AllDigits),
    all_different_except_0(AllDigits),
    member(0, AllDigits),
    member(1, AllDigits),
    member(2, AllDigits),
    member(3, AllDigits),
    member(4, AllDigits),
    member(5, AllDigits),
    member(6, AllDigits),
    member(7, AllDigits),
    member(8, AllDigits),
    member(9, AllDigits). 

% ?- program(Vars), label(Vars)