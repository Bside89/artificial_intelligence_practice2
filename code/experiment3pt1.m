%% =========================== EXPERIMENTO 3, PARTE I ===========================
% 
% CPU 1 e CPU 2 se enfrentam com profundidades variando de 1 a max_depth (7).
% O jogador a iniciar jogando � CPU 1.
% Em seguida, os dados s�o armazenados em vetores e exibidos na forma de
% gr�fico. Mais detalhes est�o contidos na descri��o do relat�rio.
%

clear; clc;

%% INSTRU��ES DE USO 
%
% Par�metros da fun��o experiment3, em ordem: 
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
% N�O ALTERE O PREFIXO '3pt1' ABAIXO.

experiment3(1, 7, '3pt1', 0, 1, false);

% ===============================================================================