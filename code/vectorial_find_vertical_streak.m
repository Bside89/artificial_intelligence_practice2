function [ v ] = vectorial_find_vertical_streak( Board, row, col, player )

% Search vertical streak starting at index [row][col] in the grid
% :param row: row the grid
% :param col: column of the grid
% :param Board: a grid of connect four
% :param player: number of consecutive "color" (for this player)
% :return v: number of streaks founded, in vector notation
% """

const_streak = 4;
consecutive_count = 0;
v = zeros(1, 4);

if row + const_streak - 1  <= 6
    for i = 0:(const_streak - 1)
        if Board(row + i, col) == player
            consecutive_count = consecutive_count + 1;
        elseif Board(row + i, col) == opposite_player(player)
            return;
        end
    end
end

if consecutive_count > 0
    v(consecutive_count) = v(consecutive_count) + 1;
end

end

