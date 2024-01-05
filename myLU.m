function [P, L, U] = myLU(A)
% Projekt 2, zadanie 10
% Adam Żyliński, 320755
%
% Funkcja służąca do rozkładu PA = LU.
%
% Wejście:
%   A - Macierz wejściowa na której będzie stosowany rozkład,
% Wyjście:
%   L - Wynikowa macierz dolnotrójkątna.
%   U - Wynikowa macierz górnotrójkątna.
%   P - Wynikowy wektor permutacji .

% deklaracja potrzebnych zmiennych
m = size(A, 1);

P = 1:m;
L = eye(m);
U = A;

for x = 1:m
    pivotRow = x;
    
    % znalezienie elementu wiodącego
    for y = x + 1:m
        if abs(U(y, x)) > abs(U(pivotRow, x))
            pivotRow = y;
        end
    end
    
    % jeżeli wszystkie rzędy mają 0 w x-tej kolumnie to idziemy dalej
    if U(pivotRow, x) == 0
        continue;
    end
    
    % jeżeli element maksymalny leży na diagonali to nie ma potrzeby robić
    % pivotingu
    if pivotRow ~= x
        % zamieniamy rząd x-ty z rzędem który posiada maksymalny element
        U([x, pivotRow], :) = U([pivotRow, x], :);
         P([x, pivotRow]) = P([pivotRow, x]);

        % zamieniamy rzędy w macierzy L ale ponieważ macierz jest 
        % dolno-trójkątna to interesują nas elementy poniżej diagonali 
        L([x, pivotRow], 1:x - 1) = L([pivotRow, x], 1:x - 1);
    end
    
    % po wykonaniu potrzebnych zamian przechodzimy do eliminacji
    y = (x + 1):m;
    currentValues = U(y, x);
    pivot = U(x, x);
    % obliczmy współczynnik eliminacji
    pivotFactors = currentValues / pivot;
    % eliminujemy elementy
    U(y, x) = 0;
    % aktualizujemy pozostałe
    U(y, x + 1:m) = U(y, x + 1:m) - (pivotFactors * U(x, x + 1:m));
    % wpisujemy współczynniki do macierzy L
    L(y, x) = pivotFactors;
end

end % function

