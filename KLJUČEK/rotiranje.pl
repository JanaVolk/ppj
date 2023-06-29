/*
Napišite poizvedbo v prologu, ki preveri, ali obstaja seznam [x1, x2, . . . , x42] dolžine 42, 
ki je enak seznamu [x3, . . . , x42, x1, x2], ki ga dobimo, ko prestavimo prva dva elementa
na konec. Priporoˇcamo uporabo predikatov length in append.
*/

rotiraj(A, B) :- 
    length(A, 4),
    length(B, 4),
    length(Front, 2),
    append(Front, Back, A),
    append(Back, Front, B),
    B=A.
