/*3. naloga (50 toˇck)
To nalogo rešujte v prologu. Cezarjeva šifra je starodavni sistem šifriranja sporoˇcil, pri
katerem vsako ˇcrko ˇcistopisa zamaknemo za k mest v abecedi (ˇcrke na koncu abecede
se krožno zamaknejo na zaˇcetek abecede). Na primer, ˇce je kljuˇc k = 3, se v angleški
abecedi beseda “zebra” šifrira kot “cheud”.
Dogovorimo se, da delamo z angleško abecedo in v ta namen definiramo predikat
abeceda/1, ki doloˇca vrstni red ˇcrk v angleški abecedi:
abeceda([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z]).
Besedo v prologu predstavimo s seznamom atomov, na primer [z,e,b,r,a].
Navodilo: ˇce vam kake podnaloge ne uspe rešiti, lahko v ostalih podnalogah predpostavite, 
da imate njeno rešitev in delo nadaljujete po najboljših moˇceh.

a) (15 toˇck) Sestavite predikat rotiraj/3, kjer rotiraj(K,A,B) pomeni, da dobimo
seznam B tako, da seznam A krožno zamaknemo za K mest. Primer:
?- rotiraj(2, [l,j,u,b,l,j,a,n,a], B).
B = [u,b,l,j,a,n,a,l,j]
?- abeceda(A), rotiraj(3, A, B).
A = [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z],
B = [d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,a,b,c].*/

abeceda([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z]).
/*rotira(0, A, A).
rotiraj(X, [_|T], [abeceda(X+1)|T]) :- rotiraj(X, [T], []).*/

rotiraj(K, A, B) :-
    length(Front, K),
    append(Front, Back, A),
    append(Back, Front, B).

/* PRIMER RAZLAGA
rotiraj(2 [l,j,u,b,l,j,a,n,a], B).
naredi seznam dolžine K torej dolžine 2 ta seznam je prazen
potem pa seznam A razdelimo na prvi del velikosti Front in ostali del. Sedaj bo front vseboval [l,j]
dodamo skupaj tako da bo back pred front in vse shranimo v B
*/

/*
b) (15 toˇck) Sestavite predikat preslikaj/4, kjer preslikaj(A,B,X,Y) pomeni, da
v seznamu A poišˇcemo element X in vrnemo istoležni element Y v seznamu B. Predpostavite lahko, da sta seznama A in B podana, 
enako dolga in sestavljena iz razliˇcnih atomov. 
Primer:
?- preslikaj([a,b,c], [c,a,b], c, Y).
Y = b.
?- preslikaj([a,b,c,d,e,f], [u,v,w,x,y,z], d, Y).
Y = x.
*/

%poiščemo indeks elementa = K
%nth1(Index, A, X).

preslikaj(A, B, X, Y) :- nth1(Index, A, X), nth1(Index, B, Y).

/*
c) (10 toˇck) Sestavite predikat cezar/3, kjer cezar(K,In,Out) pomeni, da dobimo
Out, ko In šifriramo s Cezarjevo šifro z zamikom K. Primer:
?- cezar(3, [z,e,b,r,a], Out).
Out = [c,h,e,u,d]
?- cezar(12, In, [x,v,g,n,x,v,m,z,m]).
In = [l,j,u,b,l,j,a,n,a] 
*/

cezar(K,In,Out) :- abeceda(A), rotiraj(K, A, B), maplist(preslikaj(A, B), In, Out).

/*
Ta predikat vzame seznam In, ki ga želimo prevesti. 
abeceda(A) vrne seznam vseh črk abecede, 
rotiraj(K, A, B) pa ta seznam rotira za K mest in vrne rezultat v B. 
Nato za vsak element v In uporabi funkcijo preslikaj(A, B), 
ki vrne pripadajoči element v rotirani abecedi, in vse te rezultate shrani v Out.
*/

/*
d) (10 toˇck) Peter je Timoteju poslal šifrirano sporoˇcilo “ypfyjzufhubqxua”. 
Dešifrirajte ga! Iz vaše rešitve naj bo razvidno, kako ste uporabili prolog pri postopku reševanja.
*/
desifriraj(Sporocilo) :-
    between(1, 26, K),  % preizkusi vse vrednosti ključa od 1 do 26
    cezar(K, Sporocilo, Desifrirano),
    writeln(Desifrirano).
