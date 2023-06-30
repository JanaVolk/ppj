seznam([X1, X2 | T], M) :-
    append(T, [X1, X2], M),
    length(M, 42).
    