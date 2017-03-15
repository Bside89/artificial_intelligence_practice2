function experiment3( initial_player, max_depth, experiment_id, ...
    save_data, load_from_file, show_results )

%EXPERIMENT3 Summary of this function goes here
%   Detailed explanation goes here

pref_file_path = 'results\gamedata';

if load_from_file == 1,
    
    try
        M1 = dlmread(strcat(pref_file_path, experiment_id, '_wins_cpu1.txt'));
        X1 = M1(:, 1); Y1 = M1(:, 2);
    catch
        X1 = []; Y1 = [];
    end
    try
        M2 = dlmread(strcat(pref_file_path, experiment_id, '_wins_cpu2.txt'));
        X2 = M2(:, 1); Y2 = M2(:, 2);
    catch
        X2 = []; Y2 = [];
    end
    try
        M3 = dlmread(strcat(pref_file_path, experiment_id, '_draws.txt'));
        X3 = M3(:, 1); Y3 = M3(:, 2);
    catch
        X3 = []; Y3 = [];
    end
    assert(~isempty(X1) || ~isempty(X2) || ~isempty(X3), 'Data files are empty.');
    assert(~isempty(Y1) || ~isempty(Y2) || ~isempty(Y3), 'Data files are empty.');
    clear M1; clear M2; clear M3;
    
else
    
    X1 = zeros(1, max_depth^2); Y1 = zeros(1, max_depth^2);
    X2 = zeros(1, max_depth^2); Y2 = zeros(1, max_depth^2);
    X3 = zeros(1, max_depth^2); Y3 = zeros(1, max_depth^2);

    k1 = 1; k2 = 1; k3 = 1;

    for i=1:max_depth,

        for j=1:max_depth,

            [r, err] = experiments.tournament(i, j, initial_player, show_results);
            assert(~err, 'An error occurred during agent move.');
            if r == 1,
                X1(k1) = i;
                Y1(k1) = j;
                k1 = k1 + 1;
            elseif r == 2,
                X2(k2) = i;
                Y2(k2) = j;
                k2 = k2 + 1;
            elseif r == 3,
                X3(k3) = i;
                Y3(k3) = j;
                k3 = k3 + 1;
            end
        end

    end

    X1 = X1(X1 ~= 0); Y1 = Y1(Y1 ~= 0);
    X2 = X2(X2 ~= 0); Y2 = Y2(Y2 ~= 0);
    X3 = X3(X3 ~= 0); Y3 = Y3(Y3 ~= 0);

    if save_data == 1,
        dlmwrite(strcat(pref_file_path, experiment_id, '_wins_cpu1.txt'), [X1' Y1']);
        dlmwrite(strcat(pref_file_path, experiment_id, '_wins_cpu2.txt'), [X2' Y2']);
        dlmwrite(strcat(pref_file_path, experiment_id, '_draws.txt'), [X3' Y3']);
    end
end

lim1 = max([max(X1) max(X2) max(X3)]) + 1;
lim2 = max([max(Y1) max(Y2) max(Y3)]) + 1;
plot_data(Y1, X1, Y2, X2, Y3, X3, [lim1 lim2]);

end

