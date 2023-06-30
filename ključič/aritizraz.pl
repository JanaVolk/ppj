?- use_module(library(clpfd)).

eval([N], N).

eval([+|E], A) :-
    append(E1, E2, E),
    eval(E1, A1),
    eval(E2, A2),
    A #= A1 + A2.

eval([-|E], A) :-
    append(E1, E2, E),
    eval(E1, A1),
    eval(E2, A2),
    A #= A1 - A2.

eval([*|E], A) :-
    append(E1, E2, E),
    eval(E1, A1),
    eval(E2, A2),
    A #= A1 * A2.