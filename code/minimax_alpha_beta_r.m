function [ v, i ] = minimax_alpha_beta_r( Board, depth, player, alpha, beta, is_max )

% Minimax helper function: Return the minimax value of a particular
% board, given a particular depth to estimate to.

i = 0;

if is_terminal(Board, depth)
    v = eval_game(Board, player);
    return;
end

if is_max, % Your player
    
    v = -Inf;
    for j=1:7
        [new_board, valid] = do_move(Board, j, player);
        if valid == 1
            val = minimax_alpha_beta_r(new_board, depth-1, player, alpha, beta, false);
            if val > v
                v = val;
                i = j;
            end
            alpha = max(alpha, v);
            if beta <= alpha, % Pruning
                return;
            end
        end
    end
    
else % Opposite player

    v = Inf;
    for j=1:7
        [new_board, valid] = do_move(Board, j, opposite_player(player));
        if valid == 1
            val = minimax_alpha_beta_r(new_board, depth-1, player, alpha, beta, true);
            if val < v
                v = val;
                i = j;
            end
            beta = min(beta, v);
            if beta <= alpha, % Pruning
                return;
            end
        end
    end
    
end 

end

