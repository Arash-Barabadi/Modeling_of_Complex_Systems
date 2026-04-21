clear; clc; close all;

% Parameter laden
params_schiefer_wurf;

% Name des Simulink-Modells
modellname = 'schiefer_wurf';

% Modell laden
load_system(modellname);

% Winkelbereich 0 ... 90 Grad
winkel_deg = 0:90;

% Speicher reservieren
wurfweite   = zeros(size(winkel_deg));
max_hoehe   = zeros(size(winkel_deg));

for i = 1:length(winkel_deg)

    % aktuellen Winkel setzen
    phi0_deg = winkel_deg(i);
    phi0 = deg2rad(phi0_deg);

    % Anfangsgeschwindigkeiten berechnen
    vx0 = v0 * cos(phi0);
    vy0 = v0 * sin(phi0);

    % Simulation starten
    simOut = sim('schiefer_wurf', 'StopTime', num2str(t_end));

    % Daten aus Workspace holen
    x = simOut.x_out;
    y = simOut.y_out;
    


    % maximale Hoehe
    max_höhe(i) = max(y);

    % Wurfweite:
    % letzter gueltiger x-Wert, bevor y negativ wird
    idx = find(y >= 0, 1, 'last');

    if ~isempty(idx)
        wurfweite(i) = x(idx);
    else
        wurfweite(i) = 0;
    end
end

% Maximum finden
[max_wurfweite, idx_w] = max(wurfweite);
[max_wurfhoehe, idx_h] = max(max_hoehe);

winkel_max_weite = winkel_deg(idx_w);
winkel_max_hoehe = winkel_deg(idx_h);

% Ausgabe in Command Window
fprintf('Optimaler Abwurfwinkel fuer maximale Wurfweite: %d Grad\n', winkel_max_weite);
fprintf('Maximale Wurfweite: %.4f m\n', max_wurfweite);

fprintf('Optimaler Abwurfwinkel fuer maximale Wurfhoehe: %d Grad\n', winkel_max_hoehe);
fprintf('Maximale Wurfhoehe: %.4f m\n', max_wurfhoehe);