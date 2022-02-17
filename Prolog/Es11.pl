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
    Vars = [D1, D2, D3, D4, N],
    [D1, D2, D3, D4] ins 0..9,
    N in 0..9999,
    N #= D1 * 1000 + D2 * 100 + D3 * 10 + D4,
    D1 #\= 0,
    D2 #= 0 #\/ D3 #= 0 #\/ D4 #= 0,
    (
        D1 #= 0 #/\ 
        (D2 * 100 + D3 * 10 + D4) * 9 #= N
    ) #\/
    (
        D2 #= 0 #/\ 
        (D1 * 100 + D3 * 10 +  D4) * 9 #= N
    ) #\/
    (
        D3 #= 0 #/\ 
        (D1 * 100 + D2 * 10 + D4) * 9 #= N
    ) #\/
    (
        D4 #= 0 #/\ 
        (D1 * 100 + D2 * 10 + D3) * 9 #= N
    ).

% ?- program([D1, D2, D3, D4, N]), once([min(N)], labeling([D1, D2, D3, D4]))