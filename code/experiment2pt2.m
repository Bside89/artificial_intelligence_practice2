%% =========================== EXPERIMENTO 2, PARTE II ===========================
% 
% CPU 1 e CPU 2 se enfrentam com profundidades iguais, variando de 1 a 10.
% O player a iniciar jogando � CPU 2.
% Mais detalhes est�o contidos na descri��o do relat�rio.
%

clear; clc;

%% INSTRU��ES DE USO 
%
% Par�metros da fun��o experiment2, em ordem: 
% initial_player, max_depth, experiment_id, save_data, load_from_file,
% show_results
%
% Caso queira salvar os dados do experimento no arquivo de dados,
% configure save_data = 1 e load_from_file = 0, caso contr�rio, configure
% save_data = 0.
%
% Caso queira carregar os dados de algum experimento salvo no arquivo de
% dados, configure load_from_file = 1, caso contr�rio, 0.
%
% Caso queira ver os resultados de cada jogo sendo executado, configure
% show_results = true, caso contr�rio, false.
%
% N�O ALTERE O PREFIXO '2pt2' ABAIXO!

experiment2(2, 10, '2pt2', 0, 1, false);

% ===============================================================================