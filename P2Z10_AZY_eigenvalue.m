function [res, it, err] = P2Z10_AZY_eigenvalue(A, miu, tol, maxIt)
% Projekt 2, zadanie 10
% Adam Żyliński, 320755
%
% Funkcja znajdująca wartość własną danej macierzy A leżąca najbliżej
% danej liczby miu. Funkcja wykorzystuje odwrotną metodę potęgową z
% normowaniem. Do rozwiązywania układu równań funkcja wykorzystuje
% rozkład macierzy A - I*miu metodą GEPP. Warunkiem zakończenia obliczeń
% funkcji jest przekroczenie ilości zadanych iteracji lub wyliczenie błędu
% mniejszego niż zadana tolerancja. W przypadku gdy przekroczona zostanie
% liczba dozwolonych iteracji wynik może być błędny.
%
% Wejście:
%   A       - macierz wejściowa której wartości własnych poszukujemy
%   miu     - liczba dla której szukamy najbliższej wartości własnej
%   tol     - tolerancja na błąd przybliżenia (domyślnie 1e-9)
%   maxIT   - maksymalna liczba dozwolonych iteracji (domyślnie 1000)
% Wyjście:
%   res     - wynik działania algorytmu.
%   it      - liczba wykonanych iteracji jeżeli it > maxIt  to
%             znaczy że metoda nie jest zbieżna w zadanej liczbie iteracji,
%             co oznacza że wynik może być nie poprawny.
%   err     - błąd przybliżenia
if(~exist("tol", "var"))
    tol = 1e-9;
end

if(~exist("maxIt", "var"))
    maxIt = 1000;
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
    % rozwcdiązanie układu równań linowych i wyliczenie x(k+1)
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
end% function