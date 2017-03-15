function [ tot ] = weighted_sum_streaks( B, p )

%WEIGHTED_SUM_STREAK calcula a soma ponderada de streaks.
%   Recebe um tabuleiro B e um jogador p, e devolve a soma ponderada de
%   streaks feitos por este jogador.

w = [0 1 10 100]; % Vetor de pesos p/ streaks de 1, 2, 3 e 4, respectivamente.

% Descomente uma das linhas abaixo para testar um vetor w diferente como
% parâmetro da função heurística:
%w = [1 25 50 100];
%w = [1 50 100 200];
%w = [1 100 10^3 10^4];
%w = [0 1 100 10^4];
%w = [0 1 10 20];
%w = [0 1 10 100];
%w = [0 1 5 10];
%w = [10^(-4) 1 50 10^3];
%w = [10^(-2) 1 100 10^4];
%w = [10^(-3) 1 100 10^4];

f = vectorial_find_streak(B, p); % Vetor de streaks

tot = dot(w, f);

end

