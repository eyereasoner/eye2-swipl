% Traversing graph paths

:- dynamic('https://eyereasoner.github.io/etc#oneway'/2).
:- dynamic('https://eyereasoner.github.io/etc#path'/2).

'https://eyereasoner.github.io/etc#oneway'('https://eyereasoner.github.io/etc#paris', 'https://eyereasoner.github.io/etc#orleans').
'https://eyereasoner.github.io/etc#oneway'('https://eyereasoner.github.io/etc#paris', 'https://eyereasoner.github.io/etc#chartres').
'https://eyereasoner.github.io/etc#oneway'('https://eyereasoner.github.io/etc#paris', 'https://eyereasoner.github.io/etc#amiens').
'https://eyereasoner.github.io/etc#oneway'('https://eyereasoner.github.io/etc#orleans', 'https://eyereasoner.github.io/etc#blois').
'https://eyereasoner.github.io/etc#oneway'('https://eyereasoner.github.io/etc#orleans', 'https://eyereasoner.github.io/etc#bourges').
'https://eyereasoner.github.io/etc#oneway'('https://eyereasoner.github.io/etc#blois', 'https://eyereasoner.github.io/etc#tours').
'https://eyereasoner.github.io/etc#oneway'('https://eyereasoner.github.io/etc#chartres', 'https://eyereasoner.github.io/etc#lemans').
'https://eyereasoner.github.io/etc#oneway'('https://eyereasoner.github.io/etc#lemans', 'https://eyereasoner.github.io/etc#angers').
'https://eyereasoner.github.io/etc#oneway'('https://eyereasoner.github.io/etc#lemans', 'https://eyereasoner.github.io/etc#tours').
'https://eyereasoner.github.io/etc#oneway'('https://eyereasoner.github.io/etc#angers', 'https://eyereasoner.github.io/etc#nantes').

'https://eyereasoner.github.io/etc#path'(A, B) <=
    'https://eyereasoner.github.io/etc#oneway'(A, B).

'https://eyereasoner.github.io/etc#path'(A, C) <=
    'https://eyereasoner.github.io/etc#path'(A, B),
    'https://eyereasoner.github.io/etc#path'(B, C).

% query
true <=
    'https://eyereasoner.github.io/etc#path'(_, 'https://eyereasoner.github.io/etc#nantes').
