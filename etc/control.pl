% Control Systems

:- dynamic('https://eyereasoner.github.io/etc#control1'/2).

% measurements
'https://eyereasoner.github.io/etc#measurement1'('https://eyereasoner.github.io/etc#input1', [6, 11]).
'https://eyereasoner.github.io/etc#measurement1'('https://eyereasoner.github.io/etc#disturbance2', [45, 39]).
'https://eyereasoner.github.io/etc#measurement2'('https://eyereasoner.github.io/etc#input2', true).
'https://eyereasoner.github.io/etc#measurement3'('https://eyereasoner.github.io/etc#input3', 56967).
'https://eyereasoner.github.io/etc#measurement3'('https://eyereasoner.github.io/etc#disturbance1', 35766).
'https://eyereasoner.github.io/etc#measurement4'('https://eyereasoner.github.io/etc#output2', 24).

% observations
'https://eyereasoner.github.io/etc#observation1'('https://eyereasoner.github.io/etc#state1', 80).
'https://eyereasoner.github.io/etc#observation2'('https://eyereasoner.github.io/etc#state2', false).
'https://eyereasoner.github.io/etc#observation3'('https://eyereasoner.github.io/etc#state3', 22).

% targets
'https://eyereasoner.github.io/etc#target2'('https://eyereasoner.github.io/etc#output2', 29).

% rules
'https://eyereasoner.github.io/etc#control1'('https://eyereasoner.github.io/etc#actuator1', C) :-
    'https://eyereasoner.github.io/etc#measurement10'('https://eyereasoner.github.io/etc#input1', M1),
    'https://eyereasoner.github.io/etc#measurement2'('https://eyereasoner.github.io/etc#input2', true),
    'https://eyereasoner.github.io/etc#measurement3'('https://eyereasoner.github.io/etc#disturbance1', D1),
    C1 is M1*19.6,          % proportial part
    C2 is log(D1)/log(10),  % compensation part
    C is C1-C2.             % simple feedforward control

'https://eyereasoner.github.io/etc#control1'('https://eyereasoner.github.io/etc#actuator2', C) :-
    'https://eyereasoner.github.io/etc#observation3'('https://eyereasoner.github.io/etc#state3', P3),
    'https://eyereasoner.github.io/etc#measurement4'('https://eyereasoner.github.io/etc#output2', M4),
    'https://eyereasoner.github.io/etc#target2'('https://eyereasoner.github.io/etc#output2', T2),
    E is T2-M4,             % error
    D is P3-M4,             % differential error
    C1 is 5.8*E,            % proportial part
    N is 7.3/E,             % nonlinear factor
    C2 is N*D,              % nonlinear differential part
    C is C1+C2.             % PND feedback control

'https://eyereasoner.github.io/etc#measurement10'(I, M) :-
    'https://eyereasoner.github.io/etc#measurement1'(I, [M1, M2]),
    M1 < M2,
    M3 is M2-M1,
    M is sqrt(M3).

'https://eyereasoner.github.io/etc#measurement10'(I, M1) :-
    'https://eyereasoner.github.io/etc#measurement1'(I, [M1, M2]),
    M1 >= M2.

% query
'https://eyereasoner.github.io/etc#control1'(_O, _C) :+ true.
