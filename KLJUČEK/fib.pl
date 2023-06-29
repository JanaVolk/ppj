
premakni([X, Y | T]) :-
    append(T, [X, Y], [X, Y | T]),
    length([X, Y | T], 4).
    
fib([]) :- !.
fib([0]) :- !.
fib([1, 0]) :- !.
fib([X1, X2, X3 | T]) :-
    X1 =:= X2 + X3,
    fib([X2, X3 | T]).