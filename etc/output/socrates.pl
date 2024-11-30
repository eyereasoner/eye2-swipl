:- op(1200, xfx, <=).

true<='http://www.w3.org/1999/02/22-rdf-syntax-ns#type'('https://eyereasoner.github.io/etc#Socrates', 'https://eyereasoner.github.io/etc#Man').
true<='http://www.w3.org/1999/02/22-rdf-syntax-ns#type'('https://eyereasoner.github.io/etc#Socrates', 'https://eyereasoner.github.io/etc#Mortal').

%
% Explain the reasoning
%

ether(('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'(A, 'https://eyereasoner.github.io/etc#Mortal')<='http://www.w3.org/1999/02/22-rdf-syntax-ns#type'(A, 'https://eyereasoner.github.io/etc#Man')), 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type'('https://eyereasoner.github.io/etc#Socrates', 'https://eyereasoner.github.io/etc#Man'), 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type'('https://eyereasoner.github.io/etc#Socrates', 'https://eyereasoner.github.io/etc#Mortal')).
