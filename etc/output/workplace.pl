:- op(1150, xfx, <=).

true<='https://eyereasoner.github.io/etc#complies'('https://eyereasoner.github.io/etc#alice', true).
true<='https://eyereasoner.github.io/etc#complies'('https://eyereasoner.github.io/etc#carol', false).
true<='https://eyereasoner.github.io/etc#complies'('https://eyereasoner.github.io/etc#bob', false).

%
% Explain the reasoning
%

ether(('https://eyereasoner.github.io/etc#complies'(A, true)<='https://eyereasoner.github.io/etc#does'(A, 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift')), 'https://eyereasoner.github.io/etc#does'('https://eyereasoner.github.io/etc#alice', 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift'), 'https://eyereasoner.github.io/etc#complies'('https://eyereasoner.github.io/etc#alice', true)).
ether(('https://eyereasoner.github.io/etc#complies'(A, false)<='https://eyereasoner.github.io/etc#does'(A, 'https://eyereasoner.github.io/etc#access_social_media')), 'https://eyereasoner.github.io/etc#does'('https://eyereasoner.github.io/etc#carol', 'https://eyereasoner.github.io/etc#access_social_media'), 'https://eyereasoner.github.io/etc#complies'('https://eyereasoner.github.io/etc#carol', false)).
ether(('https://eyereasoner.github.io/etc#complies'(A, false)<='https://eyereasoner.github.io/etc#does'(A, 'https://eyereasoner.github.io/etc#work_related_task'), stable(1), \+'https://eyereasoner.github.io/etc#does'(A, 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift')), ('https://eyereasoner.github.io/etc#does'('https://eyereasoner.github.io/etc#bob', 'https://eyereasoner.github.io/etc#work_related_task'), stable(1), \+'https://eyereasoner.github.io/etc#does'('https://eyereasoner.github.io/etc#bob', 'https://eyereasoner.github.io/etc#log_off_at_end_of_shift')), 'https://eyereasoner.github.io/etc#complies'('https://eyereasoner.github.io/etc#bob', false)).
