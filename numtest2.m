function [] = numtest2()

start = "Test numeryczny 1\n" + ...
    "Test ten sprawdza zależność pomiędzy liczbą iteracji\n" + ...
    "a odległością miu od wartości własnej macierzy A.\n" + ...
    "Macierz A jest macierzą o rozmiarze n losowych\n" + ...
    "elementów z zakresu od 0 do 1\n\n" + ...
    "Maksymalna liczba iteracji = %d\n" + ...
    "Maksymalny dopuszczalny błąd = %d\n" + ...
    "Wielkość macierzy = %d\n";
n = 20;
l = 3;
A = cell(l,1);
A{1} = rand(n);
A{2} = rand(n);
A{3} = rand(n);
miu = 1;
tol = 1e-5;
maxIt = 500;
k = 1000;
err = zeros(l, k);
it = zeros(l,k);
res = zeros(l,k);
dist = zeros(l,k);

fprintf(start, maxIt, tol, n);

for i = 1 : k
    [res(1,i), it(1,i), err(1,i)] = P2Z42_AZY_eigenvalue(A{1}, miu, tol, maxIt);
    [res(2,i), it(2,i), err(2,i)] = P2Z42_AZY_eigenvalue(A{2}, miu, tol, maxIt);
    [res(3,i), it(3,i), err(3,i)] = P2Z42_AZY_eigenvalue(A{3}, miu, tol, maxIt);
    dist(1,i) = abs(miu - res(1,i));
    dist(2,i) = abs(miu - res(2,i));
    dist(3,i) = abs(miu - res(3,i));
    miu = miu + (1 + 1i);
end
figure(1);
hold on;
C = [dist(1,:)', it(1,:)'];
C = sortrows(C,1);
plot(C(:,1), C(:, 2));
C = [dist(2,:)', it(2,:)'];
C = sortrows(C,1);
plot(C(:,1), C(:, 2));
C = [dist(3,:)', it(3,:)'];
C = sortrows(C,1);
plot(C(:,1), C(:, 2));
hold off;
title("Zależność między ilością iteracji a odległością\n" + ...
    "współczynnika miu od znalezionej wartości własnej");
xlabel("Odległość współczynnika miu od znalezionej wartości własnej");
ylabel("Ilość iteracji");