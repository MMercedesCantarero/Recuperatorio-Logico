% Punto 1
% Vivienda
viveEn(juan, casa(120)).
viveEn(nico, departamento(3, 2)).
viveEn(alf, departamento(3, 1)).
viveEn(julian, loft(2000)).
viveEn(vale, departamento(4, 1)).
viveEn(fer, casa(110)).
viveEn(felipe, desconocido).
quiereMudarse(rocio, casa(90)).

% Ubicación
viveEnBarrio(juan, almagro).
viveEnBarrio(nico, almagro).
viveEnBarrio(alf, almagro).
viveEnBarrio(julian, almagro).
viveEnBarrio(vale, flores).
viveEnBarrio(fer, flores).


% Punto 2 
esPropiedadCopada(casa(Metros)) :-
     Metros > 100.
esPropiedadCopada(departamento(Ambientes, _)) :-
     Ambientes > 3.
esPropiedadCopada(departamento(_, Banos)) :- 
    Banos > 1.
esPropiedadCopada(loft(AnioConstruccion)) :- 
    AnioConstruccion > 2015.

esBarrioCopado(Barrio) :-
    findall(Persona, viveEnBarrio(Persona, Barrio), Personas),
    forall(member(Persona, Personas), (
        viveEn(Persona, Propiedad),
        esPropiedadCopada(Propiedad)
    )).

% Punto 3
esPropiedadBarata(loft(AnioConstruccion)) :- 
    AnioConstruccion < 2005.
esPropiedadBarata(casa(Metros)) :- 
    Metros < 90.
esPropiedadBarata(departamento(Ambientes, _)) :- 
    Ambientes == 1.
esPropiedadBarata(departamento(Ambientes, _)) :- 
    Ambientes == 2.

esBarrioCaro(Barrio) :-
    forall(
        (viveEnBarrio(Persona, Barrio), viveEn(Persona, Propiedad)),
        esPropiedadCara(Propiedad)
    ).

% Punto 4 
% Tasaciones de las propiedades
valorPropiedad(vivienda(juan), 150000).
valorPropiedad(vivienda(nico), 80000).
valorPropiedad(vivienda(alf), 75000).
valorPropiedad(vivienda(julian), 140000).
valorPropiedad(vivienda(vale), 95000).
valorPropiedad(vivienda(fer), 60000).

comprarPropiedades(Plata, PropiedadesCompradas, DineroRestante) :-
    sublista([vivienda(juan), vivienda(nico), vivienda(alf), vivienda(julian), vivienda(vale), vivienda(fer)], Propiedades),
    sumaValores(Propiedades, SumaTotal),
    SumaTotal =< Plata, 
    DineroRestante is Plata - SumaTotal,
    PropiedadesCompradas = Propiedades.