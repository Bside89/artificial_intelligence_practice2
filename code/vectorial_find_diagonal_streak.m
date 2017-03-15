function [ v ] = vectorial_find_diagonal_streak( Board, row, col, player )

% Search diagonal streak starting at index [row][col] in the grid
% It check positive and negative slope
% :param row: row the grid
% :param col: column of the grid
% :param Board: a grid of connect four
% :param player: number of consecutive "color" (for this player)
% :return v: number of streaks founded, in vector notation
% """

const_streak = 4;
consecutive_count = 0;
v = zeros(1, 4);

% check for diagonals with positive slope
if (row + const_streak - 1  <= 6) && (col + const_streak - 1 <= 7)
    for i = 0:(const_streak - 1)
        if Board(row + i, col + i) == player
            consecutive_count = consecutive_count + 1;
        elseif Board(row + i, col + i) == opposite_player(player)
            break;
        end
    end
end

if consecutive_count > 0
    v(consecutive_count) = v(consecutive_count) + 1;
end

consecutive_count = 0;

% check for diagonals with negative slope
if (row - const_streak  >= 0) &&  (col + const_streak - 1 <= 7)
    for i = 0:(const_streak - 1)
        if Board(row - i, col + i) == player
            consecutive_count = consecutive_count + 1;
        elseif Board(row - i, col + i) == opposite_player(player);
            return;
        end
    end
end

if consecutive_count > 0
    v(consecutive_count) = v(consecutive_count) + 1;
end

end

