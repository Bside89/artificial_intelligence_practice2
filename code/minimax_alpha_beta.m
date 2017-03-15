function [ best_val, best_pos ] = minimax_alpha_beta( Board, depth, player )

% Minimax helper function: Return the minimax value of a particular
% board, given a particular depth to estimate to.

[best_val, best_pos] = minimax_alpha_beta_r(Board, depth, player, -Inf, Inf, true);

% Descomente para testar minimax sem a poda
%[best_val, best_pos] = minimax(Board, depth, player);

end

