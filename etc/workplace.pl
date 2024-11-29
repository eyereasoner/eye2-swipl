% Deontic Logic example

:- dynamic('https://eyereasoner.github.io/etc#does'/2).
:- dynamic('https://eyereasoner.github.io/etc#complies'/2).

% Facts about what an employee is doing
'https://eyereasoner.github.io/etc#does'('https://eyereasoner.github.io/etc#alice', 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift').
'https://eyereasoner.github.io/etc#does'('https://eyereasoner.github.io/etc#bob', 'https://eyereasoner.github.io/etc#work_related_task').
%'https://eyereasoner.github.io/etc#does'('https://eyereasoner.github.io/etc#bob', 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift').
'https://eyereasoner.github.io/etc#does'('https://eyereasoner.github.io/etc#carol', 'https://eyereasoner.github.io/etc#access_social_media').

% Rules to check if an action complies with deontic logic
'https://eyereasoner.github.io/etc#does'(Person, 'https://eyereasoner.github.io/etc#work_related_task'), 'https://eyereasoner.github.io/etc#does'(Person, 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift') :+ 'https://eyereasoner.github.io/etc#complies'(Person, true).
'https://eyereasoner.github.io/etc#does'(Person, 'https://eyereasoner.github.io/etc#work_related_task'), stable(1), \+'https://eyereasoner.github.io/etc#does'(Person, 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift') :+ 'https://eyereasoner.github.io/etc#complies'(Person, false).
'https://eyereasoner.github.io/etc#does'(Person, 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift') :+ 'https://eyereasoner.github.io/etc#complies'(Person, true).
'https://eyereasoner.github.io/etc#does'(Person, 'https://eyereasoner.github.io/etc#access_social_media') :+ 'https://eyereasoner.github.io/etc#complies'(Person, false).

% Query to test if everyone complies with deontic logic
'https://eyereasoner.github.io/etc#complies'(_Person, _Check) :+ true.
