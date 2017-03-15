function [ result, err ] = tournament( depth1, depth2, init_player, show_results )

%TOURNAMENT Summary of this function goes here
%   Detailed explanation goes here

assert(init_player == 1 || init_player == 2, 'init_player must be 1 or 2.');
assert(depth1 > 0 && depth2 > 0, 'depths must be integers greater than zero.');
assert(islogical(show_results), 'show_results must be logical.');

addpath(genpath(fileparts(pwd))); % Carrega os arquivos do diretório pai

Board = zeros(6, 7); % Create a new Connect Four Board

err = false;

computer = 1; % Computer's player id

player = init_player;
over = 0;

while over == 0
    
    if player == computer
        
        if show_results,
            fprintf('Computer 1\n');
        end;
        [ ~, best_pos ] = agent(Board, depth1, player, -Inf, Inf);
        [Board, ~ ] = do_move(Board, best_pos, player);
        
    else
        % Your player
        if show_results,
            fprintf('Computer 2\n');
        end
        valid_move = 0;
        while valid_move == 0 % Repeat until read a valid move
            
            % col = read_number();
            [ ~, col ] = minimax_alpha_beta(Board, depth2, player);
            [Board, valid_move] = do_move(Board, col, player);
            if valid_move == 0
                if show_results,
                    fprintf('Invalid move\n');
                else
                    err = true;
                    return;
                end
            end
        end
        
    end
    if show_results,
        disp(Board); % Show move
    end
    
    over = is_game_over(Board);
    player = opposite_player(player);
end

result = over;

if show_results,
    fprintf('********************\nFinish!\n');
    if over == 3
        fprintf('Tie!\n');
    else
        if over == computer
            fprintf('Computer 1 won!\n');
        else
            fprintf('Computer 2 won!\n');
        end
    end
end

end

