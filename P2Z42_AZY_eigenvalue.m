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

if(~exist("tol", "var"))
    tol = 1e-9;
end

% utworzenie maicerzy A - miuI
A2 = A - miu*eye(size(A));
% rozkład macierzy
[P, L, U] = myLU(A2);
% wylosowanie wektora startowego
x = rand(size(A,1),1);
% deklaracja potrzebnych zmiennych
it = 0;
err = tol+1;
% utworzenie opcji do optymalizacji linsolve
LT.LT = true;
UT.UT = true;

% pętla iteracyjna
while it <= maxIt && err > tol
    xp = x;
    % rozwiązanie układu równań linowych i wyliczenie x(k+1)
    y = linsolve(L,x(P), LT);
    x = linsolve(U,y, UT);
    % unormowanie wektora x(k)
    x = x/norm(x, 2);
    % obliczenie błędu
    [~, ind] = max(abs(xp));
    err = norm((1/x(ind))*abs(x(ind))*x - (1/xp(ind))*abs(xp(ind))*xp);
    % zwiększenie licznika iteracji
    it = it+1;
end

% wyliczenie wyniku przybliżenia wartości własnej
    res = x'*A*x;
end % function

