function [res, it, err] = P2Z42_AZY_eigenvalue(A, miu, tol, maxIt)
% Projekt 2, zadanie 42
% Adam Żyliński, 320755
%
% Funkcja znajdująca wartość własną danej macierzy A leżąca najbliżej 
% danej liczby miu. Funkcja wykorzystuje odwrotną metodę potęgową z
% normowaniem. Do rozwiązywania układu równań funkcja wykorzystuje 
% rozkład macierzy A - I*miu metodą GEPP.
%
% Wejście:
%   A       - macierz wejściowa której wartości własnych poszukujemy
%   miu     - liczba dla której szukamy najbliższej wartości własnej
%   tol     - tolerancja na błąd przybliżenia (domyślnie 1e-9)
%   maxIT   - maksymalna liczba dozwolonych iteracji
% Wyjście:
%   res     - wynik przybliżenia
%   it      - liczba wykonanych iteracji jeżeli it > maxIt  to
%             znaczy że metoda nie jest zbieżna w zadanej liczbie iteracji
%   err     - błąd przybliżenia

A2 = A - miu*eye(size(A));
[P, L, U] = myLU(A2);
x = rand(size(A,1),1);
res = 0;
it = 1;
err = 1;
while it <= maxIt && err > tol
    xp = x/norm(x,2);
    y = linsolve(L,P*xp);
    x = linsolve(U,y);
    resNew = x'*A2*x/(x'*x);
    resNew = resNew + miu;
    err = abs(resNew - res);
    res = resNew;
    it = it+1;
end

end % function

