hombre(isidoro).
hombre(klever).
hombre(manuel).
hombre(winter).

mujer(griselda).
mujer(mariuxi).
mujer(melani).
mujer(olga).

familia(isidoro,manuel).
familia(griselda,manuel).
familia(isidoro,mariuxi).
familia(griselda,mariuxi).

familia(klever,melani).
familia(mariuxi,melani).

familia(manuel,winter).
familia(olga,winter).

esposos(isidoro,griselda).
esposos(klever,mariuxi).
esposos(manuel,olga).
esposos(griselda,isidoro).
esposos(mariuxi,klever).
esposos(olga,manuel).


esposo(X, Y) :- esposos(X, Y), hombre(X).
esposa(X, Y) :- esposos(X, Y), mujer(X).
abuelo(X, Y) :- familia(P, Y), familia(X, P), hombre(X).
abuela(X, Y) :- familia(P, Y), familia(X, P), mujer(X).
padre(X, Y) :- familia(X, Y), hombre(X).
madre(X, Y) :- familia(X, Y), mujer(X).
hijo(X, Y) :- familia(X, Y), hombre(X).
hija(X, Y) :- familia(X, Y), mujer(X).
nieto(X, Y) :- familia(Y, M), familia(M, X), hombre(X).
nieta(X, Y) :- familia(Y, M), familia(M, X), mujer(X).
hermanos(X, Y) :- familia(Z, X), familia(Z, Y), not(X == Y).
hermano(X, Y) :- hermanos(X, Y), hombre(X).
hermana(X, Y) :- hermanos(X, Y), mujer(X).
cuñados(X, Y) :- ((esposos(X, Z), hermanos(Z, Y)); (esposos(Y,Z), hermanos(Z, Y))).
cuñado(X, Y) :- cuñados(X, Y), hombre(X).
cuñada(X, Y) :- cuñados(X, Y), mujer(X).
tio(X, Y) :- familia(Z, Y), (hermano(X, Z); cuñado(X, Z)).
tia(X, Y) :- familia(Z, Y), (hermana(X, Z); cuñada(X, Z)).
primo(X, Y) :- familia(Z, X), familia(W, Y), hermanos(Z, W), hombre(X).
prima(X, Y) :- familia(Z, X), familia(W, Y), hermanos(Z, W), mujer(X).
