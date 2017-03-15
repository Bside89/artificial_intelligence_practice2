function experiment2( initial_player, max_depth, experiment_id, ...
    save_data, load_from_file, show_results )

%EXPERIMENT2 Summary of this function goes here
%   Detailed explanation goes here

pref_file_path = 'results\gamedata';

if load_from_file == 1,
    
    try
        M1 = dlmread(strcat(pref_file_path, experiment_id, '_wins_cpu1.txt'));
        XY1 = M1(:, 1);
    catch
        XY1 = [];
    end
    try
        M2 = dlmread(strcat(pref_file_path, experiment_id, '_wins_cpu2.txt'));
        XY2 = M2(:, 1);
    catch
        XY2 = [];
    end
    try
        M3 = dlmread(strcat(pref_file_path, experiment_id, '_draws.txt'));
        XY3 = M3(:, 1);
    catch
        XY3 = [];
    end
    assert(~isempty(XY1) || ~isempty(XY2) || ~isempty(XY3), 'Data files are empty.');
    clear M1; clear M2; clear M3;
    
else
    
    XY1 = zeros(1, max_depth);
    XY2 = zeros(1, max_depth);
    XY3 = zeros(1, max_depth);

    k1 = 1; k2 = 1; k3 = 1;

    for i=1:max_depth,
        [r, err] = experiments.tournament(i, i, initial_player, show_results);
        assert(~err, 'An error occurred during agent move.');
        if r == 1,
            XY1(k1) = i;
            k1 = k1 + 1;
        elseif r == 2,
            XY2(k2) = i;
            k2 = k2 + 1;
        elseif r == 3,
            XY3(k3) = i;
            k3 = k3 + 1;
        end
    end

    XY1 = XY1(XY1 ~= 0);
    XY2 = XY2(XY2 ~= 0);
    XY3 = XY3(XY3 ~= 0);

    if save_data == 1,
        dlmwrite(strcat(pref_file_path, experiment_id, '_wins_cpu1.txt'), XY1');
        dlmwrite(strcat(pref_file_path, experiment_id, '_wins_cpu2.txt'), XY2');
        dlmwrite(strcat(pref_file_path, experiment_id, '_draws.txt'), XY3');
    end
end

lim = length(XY1) + length(XY2) + length(XY3) + 1;
plot_data(XY1, XY1, XY2, XY2, XY3, XY3, [lim lim]);


end

