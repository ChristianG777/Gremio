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