polje(X/Y) :-
    between(1,8, X),
    between(1,8, Y).


delta(-2, -1).
delta(-2, 1).
delta(-1, -2).
delta(-1, 2).
delta(1, -2).
delta(1, 2).
delta(2, -1).
delta(2, 1).

premik(X/Y, Q) :-
    polje(X/Y),
    delta(DX, DY),
    NX is X + DX,
    NY is Y + DY,
    polje(NX/NY),
    Q = NX/NY.

sprehod([]).
sprehod([X]):-
    polje(X).
sprehod([P, Q|T]) :-
    premik(P, Q),
    sprehod([Q|T]).


length(L, 64), L = [1/1 | _], append(_, [8/8], L), sprehod(L).
length(L, 64), sprehod([1/1 | L]), last(L, 8/8).