function [P, L, U] = myLU(A)
% Projekt 2, zadanie 42
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
n = size(A,1);
U = A;
P = (1:n)';
L = eye(size(A)) + 0i;

% pętla iteracyjna
for i = 1:n-1
    % znalezienie indeksu najwiekszego elementu
    [~,ind] = max(abs(U(i,i:end)));
    % pivoting
    if ind ~= 1
        % zamiana elementu wiodącego poprzez zamiane rzędów
        buf = U(:, i);
        U(:,i) = U(:, i+ind-1);
        U(:,i+ind-1) = buf;
        % wpisanie permutacji do wektora permutacji
        temp = P(i);
        P(i) = ind;
        P(ind) = temp;
        % zamiana elementu wiodącego poprzez zamiane rzędów
        buf = L(i+ind:n, i);
        L(i+ind:n,i) = L(i+ind:n, i+ind-1);
        L(i+ind:n,i+ind-1) = buf;
    end
    % wyznaczenie wektora współczynników do macierzy L
    alpha = (U(i+1:end,i)./U(i,i));
    L(i+1:end,i) = alpha;
    x = alpha*U(i,i:end);
    t = U(i+1:end, i:end);
    % eliminacja elementów w i-tej kolumnie
    U(i+1:end, i:end) = t - x;
end


end % function

