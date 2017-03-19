% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Intelig�ncia Artificial - 2016/2
%
% Script Octave/MATLAB que deve ser utilizado para testar a implementa��o
% do exerc�cio.
% Este arquivo n�o deve ser alterado.
%
% author: raonifst at gmail dot com

% computer: player 1
% you:      player 2

Board = zeros(6,7); % Create a new Connect Four Board

computer = 1; % computer's player id
depth = 4;
player = 1;
over = 0;

while over == 0
    
    if player == computer
        
        fprintf('Computer\n');
        [~, best_pos ] = minimax_alpha_beta(Board, depth, player);
        [Board, ~] = do_move(Board, best_pos, player);
        
    else
        % human player
        
        valid_move = 0;
        while valid_move == 0 % repeat until read a valid move
            
            col = read_number();
            [Board, valid_move] = do_move(Board, col, player);
            if valid_move == 0
                fprintf('Invalid move\n');
            end
        end
        
    end
    
    disp(Board); % show move
    
    over = is_game_over(Board);
    player = opposite_player(player);
end

fprintf('********************\nFinish!\n');
if over == 3
    fprintf('Tie!\n');
else
    if over == computer
        fprintf('You loose!\n');
    else
        fprintf('You win!\n');
    end
end
