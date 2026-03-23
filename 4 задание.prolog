
% Команды: спартак, цска, динамо, ротор
% Места: 1, 2, 3, 4

% Предикат: все места разные
all_different([A,B,C,D]) :-
    A \= B, A \= C, A \= D,
    B \= C, B \= D,
    C \= D.

% Прогнозы болельщиков
% Иван: Спартак - 1 место, ЦСКА - 4 место
ivan(S, C, _, _) :-
    (S = 1, C \= 4); (S \= 1, C = 4).

% Сергей: Спартак - не выше 3, ЦСКА - 2 место
sergey(S, C, _, _) :-
    (S >= 3, C \= 2); (S < 3, C = 2).

% Петр: Динамо - 1 место, ЦСКА - в тройке (1,2,3)
petr(_, C, D, _) :-
    (D = 1, (C = 4)); (D \= 1, (C = 1; C = 2; C = 3)).

% Алексей: Динамо - 2 место, Ротор - 4 место
alexey(_, _, D, R) :-
    (D = 2, R \= 4); (D \= 2, R = 4).

solve(S, C, D, R) :-
    member(S, [1,2,3,4]),
    member(C, [1,2,3,4]),
    member(D, [1,2,3,4]),
    member(R, [1,2,3,4]),
    all_different([S,C,D,R]),
    ivan(S, C, D, R),
    sergey(S, C, D, R),
    petr(S, C, D, R),
    alexey(S, C, D, R).

print_result(S, C, D, R) :-
    write('Результаты турнира:'), nl,
    write('Спартак: '), write(S), write(' место'), nl,
    write('ЦСКА: '), write(C), write(' место'), nl,
    write('Динамо: '), write(D), write(' место'), nl,
    write('Ротор: '), write(R), write(' место'), nl.

go :-
    write('Логическая задача: Турнир четырех'), nl,
    solve(S, C, D, R),
    print_result(S, C, D, R).
:- go.
