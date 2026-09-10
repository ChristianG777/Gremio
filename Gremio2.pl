%--- personajes ---
personaje('Elara', 5, 100).
personaje('Kael', 3, 80).
personaje('Rin', 7, 120).
personaje('Christian', 4, 90).

%--- misiones ---
mision(m1, 'Bosque de Sombras', 2, 50).
mision(m2, 'Cueva del Dragón', 5, 120).
mision(m3, 'Torre Arcana', 7, 200).

% --- arma de Christian ---
arma('espada', 80, fuego).

% CORREGIDO: Debe llevar la estructura arma/3 adentro
tiene('Christian', arma('espada', 80, fuego)).

%--- inventario ---
inventario('Elara', [espada, escudo, pocion]).
inventario('Kael', [arco, flechas]).
inventario('Rin', [varita, grimorio, pocion, amuleto]).
inventario('Christian', [espada, escudo, pocion, arco, flechas, 'espada']).

%--- requisitos de misiones ---
requiere(m2, escudo). requiere(m2, pocion).
requiere(m3, grimorio). requiere(m3, pocion).

xp_para_subir(NivelActual, XP) :- XP is NivelActual * 30.

vida_restante(VidaMax, Danio, Final) :- Final is VidaMax - Danio.

xp_acumulado(0,0).
xp_acumulado(N, Total) :-
    N > 0,
    N1 is N - 1,
    xp_acumulado(N1, Prev),
    Total is Prev + (30 * N).

%--- daño acumulado ---
dano_acumulado(0, 0).
dano_acumulado(N, Total) :-
    N > 0,
    N1 is N - 1,
    dano_acumulado(N1, Prev),
    Total is Prev + (N * 10).

%--- Dos personaje distintos con el mismo nivel exacto? ---
mismo_nivel(P1, P2):-
    personaje(P1,N, _),
    personaje(P2,N, _),
    P1 \= P2.
%--- Un personaje con vida exactamente balanceada (100) ---
es_balanceado(P):-
    personaje(P, _, Vida),
    Vida =:= 100.

%--- comparar personajes del gremio ---

%--- Verdadero si el nivel de P1 es mayor que el de P2 ---
mas_fuerte(P1, P2) :-
    personaje(P1, Nivel1, _),
    personaje(P2, Nivel2, _),
    Nivel1 > Nivel2.

%--- Verdadero si ambos personajes tienen el mismo objeto en su inventario ---
mismo_objeto(P1, P2, Obj) :-
    inventario(P1, Inv1),
    inventario(P2, Inv2),
    P1 \= P2,
    member(Obj, Inv1),
    member(Obj, Inv2).