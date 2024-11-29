% inference fuse

:- op(1150, xfx, :+).

'https://eyereasoner.github.io/etc#color'('https://eyereasoner.github.io/etc#stone', 'https://eyereasoner.github.io/etc#black').
'https://eyereasoner.github.io/etc#color'('https://eyereasoner.github.io/etc#stone', 'https://eyereasoner.github.io/etc#white').

'https://eyereasoner.github.io/etc#color'(X, 'https://eyereasoner.github.io/etc#black'), 'https://eyereasoner.github.io/etc#color'(X, 'https://eyereasoner.github.io/etc#white') :+ false.
