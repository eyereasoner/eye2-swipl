% Socrates is a mortal

:- dynamic('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'/2).

'http://www.w3.org/1999/02/22-rdf-syntax-ns#type'('https://eyereasoner.github.io/etc#Socrates', 'https://eyereasoner.github.io/etc#Man').

'http://www.w3.org/1999/02/22-rdf-syntax-ns#type'(X, 'https://eyereasoner.github.io/etc#Mortal') <=
    'http://www.w3.org/1999/02/22-rdf-syntax-ns#type'(X, 'https://eyereasoner.github.io/etc#Man').

% query
true <=
    'http://www.w3.org/1999/02/22-rdf-syntax-ns#type'(_, _).
