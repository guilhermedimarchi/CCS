/* Problema da coloracao dos paises */
imprima([]):- !.
imprima([Cabeca|Cauda]):- !, write(Cabeca), nl, imprima(Cauda).
imprima(Arg):- write(Arg),nl.

mapa :- cor_mapa([],Solucao), imprima(Solucao).

cor_mapa(Solucao,Solucao) :-
     \+ restando_mais_algum(_,Solucao).

cor_mapa(Lista,Solucao) :-
     restando_mais_algum(PAIS,Lista),
     cor(COR),
     \+ proibido(PAIS,COR,Lista),
     write(PAIS), nl ,
     cor_mapa([[PAIS,COR]|Lista],Solucao).

restando_mais_algum(PAIS,Lista) :- pais(PAIS),
                           \+ member([PAIS,_],Lista).

proibido(PAIS,COR,Lista) :-
     faz_fronteira(PAIS,Neighbor),
     member( [Neighbor,COR], Lista) .

/*faz_fronteira(PAIS,Neighbor) :- vizinho(PAIS,Neighbor).
faz_fronteira(PAIS,Neighbor) :- vizinho(Neighbor,PAIS).*/

faz_fronteira(PAIS,Vizinho) :- vizinho(PAIS,Lista_vizinhos),member(Vizinho,Lista_vizinhos).
faz_fronteira(PAIS,Vizinho) :- vizinho(Vizinho,Lista_vizinho),member(PAIS,Lista_vizinhos.



/* Apenas 04 cores são o suficiente */

cor(vermelho).
cor(azul).
cor(verde).
cor(amarelo).

/* Geographical data for South America. */

pais(antilles).       pais(argentina).
pais(bolivia).        pais(brazil).
pais(columbia).       pais(chile).
pais(ecuador).        pais(french_guiana).
pais(guyana).         pais(paraguay).
pais(peru).           pais(surinam).
pais(uruguay).        pais(venezuela).

vizinho(antilles,[venezuela]).
vizinho(argentina,[brazil,paraguay,bolivia,chile,uruguay]).
vizinho(bolivia,[brazil,paraguay,argentina,chile,peru]).
vizinho(brazil,[argentina,bolivia,columbia,guyana,peru,uruguay,french_guiana,paraguay,surinam,venezuela]).
vizinho(chile,[peru,argentina,bolivia]).
vizinho(columbia,[brazil,ecuador]).
vizinho(ecuador,[columbia]).
vizinho(french_guiana,[brazil]).
vizinho(guyana,[brazil]).
vizinho(paraguay,[argentina,bolivia,brasil]).
vizinho(peru,[brazil,chile,bolivia]).
vizinho(surinam,[brazil]).
vizinho(uruguay,[brazil,argentina]).
vizinho(venezuela,[brazil,antilles]).

/*vizinho(antilles,venezuela).   vizinho(argentina,bolivia).
vizinho(argentina,brazil).     vizinho(argentina,chile).
vizinho(argentina,paraguay).   vizinho(argentina,uruguay).
vizinho(bolivia,brazil).       vizinho(bolivia,chile).
vizinho(bolivia,paraguay).     vizinho(bolivia,peru).
vizinho(brazil,columbia).      vizinho(brazil,french_guiana).
vizinho(brazil,guyana).        vizinho(brazil,paraguay).
vizinho(brazil,peru).          vizinho(brazil,surinam).
vizinho(brazil,uruguay).       vizinho(brazil,venezuela).
vizinho(chile,peru).           vizinho(columbia,ecuador).*/



/***************/
