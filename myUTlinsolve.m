function [res] = myUTlinsolve(A, b)
% Projekt 2, zadanie 10
% Adam Żyliński, 320755
%
% Funkcja służąca do rozwiązywania układu równań liniowych postaci Ax = b,
% gdzie A jest macierzą górnotrójkątną.
%
% Wejście:
%   A - Wejściowa macierz musi górnotrójkątna.
%   b - Wejściowy wektor wyrazów wolnych.
% Wyjście:
%   res - Wynikowy wektor rozwiązań układu równań.

n = size(A, 1);
% iterujemy od końca 
for i = n : -1 : 1
    % sprowadzamy wyraz wiodący do jedynki
    b(i) = b(i) / A(i,i);
    A(i, i) = 1;
    % przeprowadzamy eliminacje elementów w rzędach powyżej
    for j = i-1:-1:1
        % aktualizujemy wartości w macierzy i wektorze wyrazów wolnych
        cancelConst = A(j,i);
        b(j) = b(j) - cancelConst * b(i);
        A(j, i) = A(j, i) - cancelConst * A(i, i);
    end
    % x(i) = (b(i) - sum(A(i, :) .* x)) ./ A(i, i);
end
% rozwiązanie układu równań znajduje się w wektorze wyrazów wolnych
res = b;
end% function

