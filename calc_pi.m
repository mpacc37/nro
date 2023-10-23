function calc_pi()

%število naključnih točk
numPoints = 1000; %začetno št točk

%pravilna vrednost števila π
truePi = pi;

%nastavimo približek pi
estimatedPi = 0;

%napaka
e = 0;

%anonimna funkcijo za izračun točk na krožnici
arcCircle = @(numPoints) [cos(linspace(0, 2*pi, numPoints)); sin(linspace(0, 2*pi, numPoints))];

%loop za povečevanje števila točk
for i = 1:5
    %klic mcc_pi funkcije za naključno generacijo točk
    [circlePoints, squarePoints] = mcc_pi(numPoints);

    %dodamo točke na lok 
    arcPoints = arcCircle(numPoints);

    % Izračunamo približno vrednost π z novo funkcijo area_pi
    [estimatedPi, e] = area_pi(circlePoints, squarePoints);

    %display rezultatov da preverimo
    disp(['Število točk: ', num2str(numPoints)]);
    disp(['Približna vrednost π: ', num2str(estimatedPi)]);
    disp(['Napaka: ', num2str(e)]);
    disp('------------------------------------------');

    %podvojimo št točk za nslednjo iteracijo
    numPoints = numPoints * 2;

    %graf - TUKAJ DODAJ NASLOV (v title) IN OZNAKE OSI (v xlabel in ylabel)
    figure;
    scatter(circlePoints(1, :), circlePoints(2, :), 'r', 'filled'); % Točke znotraj krožnice
    hold on;
    scatter(squarePoints(1, :), squarePoints(2, :), 'b', 'filled'); % Točke zunaj krožnice
    plot(arcPoints(1, :), arcPoints(2, :), 'k', 'LineWidth', 2); % Lok krožnice
    axis equal;
    title(['Aproksimacija pi ', num2str(numPoints)]);
    legend('Točke znotraj kroga', 'Točke v kvadratu - zunaj kroga', 'Krožnica');
    xlabel('X os');
    ylabel('Y os');
end

end

% Funkcija za oceno števila π iz razmerja točk v krogu, kvadratu in na loku krožnice
function [estimatedPi, e] = area_pi(circlePoints, squarePoints)
    
    %izračun približne vrednosti pi
    estimatedPi = 4 * (size(circlePoints, 2) / size(squarePoints, 2));
    
    %izračun napake
    e = abs(estimatedPi - pi);
end

