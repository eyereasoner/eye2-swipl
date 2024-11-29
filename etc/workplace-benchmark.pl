% Deontic Logic example

:- dynamic('https://eyereasoner.github.io/etc#does'/2).
:- dynamic('https://eyereasoner.github.io/etc#complies'/2).

% Facts about what employees are doing
'https://eyereasoner.github.io/etc#prepare'(X, Y) :-
    Z is Y//3,
    between(X, Z, N),
    number_codes(N, J),
    atom_codes(I, J),
    atom_concat('https://eyereasoner.github.io/etc#alice', I, A),
    assertz('https://eyereasoner.github.io/etc#does'(A, 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift')),
    atom_concat('https://eyereasoner.github.io/etc#bob', I, B),
    assertz('https://eyereasoner.github.io/etc#does'(B, 'https://eyereasoner.github.io/etc#work_related_task')),
    assertz('https://eyereasoner.github.io/etc#does'(B, 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift')),
    atom_concat('https://eyereasoner.github.io/etc#carol', I, C),
    assertz('https://eyereasoner.github.io/etc#does'(C, 'https://eyereasoner.github.io/etc#access_social_media')),
    fail;
    true.

% Rules to check if an action complies with deontic logic
'https://eyereasoner.github.io/etc#does'(Person, 'https://eyereasoner.github.io/etc#work_related_task'), 'https://eyereasoner.github.io/etc#does'(Person, 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift') :+ 'https://eyereasoner.github.io/etc#complies'(Person, true).
'https://eyereasoner.github.io/etc#does'(Person, 'https://eyereasoner.github.io/etc#work_related_task'), \+'https://eyereasoner.github.io/etc#does'(Person, 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift') :+ 'https://eyereasoner.github.io/etc#complies'(Person, false).
'https://eyereasoner.github.io/etc#does'(Person, 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift') :+ 'https://eyereasoner.github.io/etc#complies'(Person, true).
'https://eyereasoner.github.io/etc#does'(Person, 'https://eyereasoner.github.io/etc#access_social_media') :+ 'https://eyereasoner.github.io/etc#complies'(Person, false).

% Query to test if everyone complies with deontic logic
'https://eyereasoner.github.io/etc#prepare'(1, 30000) :+ true.
'https://eyereasoner.github.io/etc#complies'(_Person, _Check) :+ true.
