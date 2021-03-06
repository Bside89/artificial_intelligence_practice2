% Lig4 Game

Board = zeros(6, 7); % Create a new Connect Four Board

computer = 1; % Computer's player id
depth = 4; %5 - hard; 3 - medium; 1 - easy

player = 1; % Starting player
over = 0;

while over == 0
    
    if player == computer
        
        fprintf('Computer 1\n');
        [ ~, best_pos ] = agent(Board, depth, player, -Inf, Inf);
        [Board, ~ ] = do_move(Board, best_pos, player);
        
    else
        % Your player
        fprintf('Computer 2\n');
        valid_move = 0;
        while valid_move == 0 % Repeat until read a valid move
            
            % col = read_number();
            [ ~, col ] = minimax_alpha_beta(Board, depth, player);
            [Board, valid_move] = do_move(Board, col, player);
            if valid_move == 0
                fprintf('Invalid move\n');
            end
        end
        
    end
    
    disp(Board); % Show move
    
    over = is_game_over(Board);
    player = opposite_player(player);
end

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

