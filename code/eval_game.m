% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Função Octave/MATLAB que implementa a função heurística do algoritmo
% minimax utilizando técnicas de corte de profundidade.
%
% author: raonifst at gmail dot com


function [ score ] = eval_game( Board, player )

s1 = weighted_sum_streaks(Board, player);
s2 = weighted_sum_streaks(Board, opposite_player(player));

score = s1 - s2;

end

