%% =========================== EXPERIMENTO 2, PARTE II ===========================
% 
% CPU 1 e CPU 2 se enfrentam com profundidades iguais, variando de 1 a 10.
% O player a iniciar jogando é CPU 2.
% Mais detalhes estão contidos na descrição do relatório.
%

clear; clc;

%% INSTRUÇÕES DE USO 
%
% Parâmetros da função experiment2, em ordem: 
% initial_player, max_depth, experiment_id, save_data, load_from_file,
% show_results
%
% Caso queira salvar os dados do experimento no arquivo de dados,
% configure save_data = 1 e load_from_file = 0, caso contrário, configure
% save_data = 0.
%
% Caso queira carregar os dados de algum experimento salvo no arquivo de
% dados, configure load_from_file = 1, caso contrário, 0.
%
% Caso queira ver os resultados de cada jogo sendo executado, configure
% show_results = true, caso contrário, false.
%
% NÃO ALTERE O PREFIXO '2pt2' ABAIXO!

experiment2(2, 10, '2pt2', 0, 1, false);

% ===============================================================================