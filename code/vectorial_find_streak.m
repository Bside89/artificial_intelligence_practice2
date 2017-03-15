function [ v ] = vectorial_find_streak( Board, player )

% Search streaks of a color in the grid
% :param Board: a grid of connect four
% :param player: number of consecutive "color" (for this player)
% :return v: number of streaks founded, in vector notation
% """

v = zeros(1, 4);

% for each box in the board...
for i=1:6
    for j=1:7
        % check if a vertical streak starts at index [i][j] of the grid
        % game
        v = v + vectorial_find_vertical_streak(Board, i, j, player);

        % check if a horizontal streak starts at index [i][j] of the
        % grid game
        v = v + vectorial_find_horizontal_streak(Board, i, j, player);

        % check if a diagonal streak starts at index [i][j] of the grid
        % game
        v = v + vectorial_find_diagonal_streak(Board, i, j, player);
    end
end

end

