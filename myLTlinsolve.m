function [res] = myLTlinsolve(A,b)
% Projekt 2, zadanie 10
% Adam Żyliński, 320755
%
% Funkcja służąca do rozwiązywania układu równań liniowych postaci Ax = b,
% gdzie A jest macierzą dolnotrójątną.
%
% Wejście:
%   A - Wejściowa macierz musi dolnotrójkątna.
%   b - Wejściowy wektor wyrazów wolnych.
% Wyjście:
%   res - Wynikowy wektor rozwiązań układu równań.

n = size(A, 1);
% iterujemy po rzędach macierzy
for i = 1 : n
    % sprowadzamy element wiodący do jedynki
    b(i) = b(i) / A(i,i);
    A(i, i) = 1;
    % przeprowadzamy eliminacje elementów w rzędach poniżej
    for j = i + 1 : n
        % aktualizujemy wartości w macierzy i wektorze wyrazów wolnych
        cancelConst = A(j, i)/A(i,i);
        b(j) = b(j) - cancelConst * b(i);
        A(j, i) = A(j, i) - cancelConst * A(i, i);
    end
end
% rozwiązanie układu równań znajduje się w wektorze wyrazów wolnych
res = b;
end% function

