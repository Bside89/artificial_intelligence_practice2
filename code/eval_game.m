% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Intelig�ncia Artificial - 2016/2
%
% Fun��o Octave/MATLAB que implementa a fun��o heur�stica do algoritmo
% minimax utilizando t�cnicas de corte de profundidade.
%
% author: raonifst at gmail dot com


function [ score ] = eval_game( Board, player )

s1 = weighted_sum_streaks(Board, player);
s2 = weighted_sum_streaks(Board, opposite_player(player));

score = s1 - s2;

end

