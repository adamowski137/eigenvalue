function [P, L, U] = myLU(A)
% Projekt 2, zadanie 42
% Adam Żyliński, 320755
%
% Funkcja służąca do rozkładu PA =LU.
%
% Wejście:
%   A - Macierz wejściowa na której będzie stosowany rozkład,
% Wyjście:
%   L - Wynikowa macierz dolnotrójkątna.
%   U - Wynikowa macierz górnotrójkątna.
%   P - Wynikowa macierz transpozycji.

n = size(A,1);
U = A;
P = eye(size(A));
L = eye(size(A)) + 0i;

for i = 1:n-1
    [~,ind] = max(abs(U(i,i:end)));
    if ind ~= i
        buf = U(:, i);
        U(:,i) = U(:, i+ind-1);
        U(:,i+ind-1) = buf;
        buf = P(:, i);
        P(:,i) = P(:, i+ind-1);
        P(:,i+ind-1) = buf;
        buf = L(i+ind:n, i);
        L(i+ind:n,i) = L(i+ind:n, i+ind-1);
        L(i+ind:n,i+ind-1) = buf;
    end
    alpha = (U(i+1:end,i)./U(i,i));
    L(i+1:end,i) = alpha;
    x = alpha*U(i,i:end);
    t = U(i+1:end, i:end);
    U(i+1:end, i:end) = t - x;
end


end % function

