

rotiraj(A, B) :- 
    length(A, 4),
    length(B, 4),
    length(Front, 2),
    append(Front, Back, A),
    append(Back, Front, B),
    B=A.
