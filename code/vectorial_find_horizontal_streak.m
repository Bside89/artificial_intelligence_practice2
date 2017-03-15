function [ v ] = vectorial_find_horizontal_streak( Board, row, col, player )

% Search horizontal streak starting at index [row][col] in the grid
% :param row: row the grid
% :param col: column of the grid
% :param Board: a grid of connect four
% :param player: number of consecutive "color" (for this player)
% :return v: number of streaks founded, in vector notation
% """

const_streak = 4;
consecutive_count = 0;
v = zeros(1, 4);

if col + const_streak - 1 <= 7
    for i = 0:(const_streak - 1)
        if Board(row, col + i) == player
            consecutive_count = consecutive_count + 1;
        elseif Board(row, col + i) == opposite_player(player)
            return;
        end
    end
end

if consecutive_count > 0
    v(consecutive_count) = v(consecutive_count) + 1;
end

end
