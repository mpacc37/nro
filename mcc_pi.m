function [krog, kvadrat] = mcc_pi(stTock)
    % Generiraj naključne točke znotraj enotskega kvadrata
    randomPoints = rand(2, stTock);
    
    % Prenesite naključne točke na območje [-1, 1]
    randomPoints = 2 * randomPoints - 1;
    
    % Preverite, katere točke so znotraj kroga
    isInsideCircle = sum(randomPoints.^2) <= 1;
    
    % Razdelite točke v krog in kvadrat
    krog = randomPoints(:, isInsideCircle);
    kvadrat = randomPoints;
    
end
