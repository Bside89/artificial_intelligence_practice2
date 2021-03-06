% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Intelig�ncia Artificial - 2016/2
%
% Fun��o Octave/MATLAB que implementa o modelo de transi��o do jogo.
%
% author: raonifst at gmail dot com

function [ new_Board, valid ] = do_move( Board, col, player )

new_Board = Board;
valid = 1;
if col <= 7 && col >= 1
    
    i = 6;
    while i >= 1 && Board(i, col) ~= 0
        i = i - 1;
    end
    
    if i >= 1
        new_Board(i, col) = player;
    else
        valid = 0;
    end
else
    valid = 0;
end

end

