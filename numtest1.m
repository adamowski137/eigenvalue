function [] = numtest1()

start = "Test numeryczny 1\n" + ...
    "Test ten sprawdza zależność pomiędzy liczbą iteracji\n" + ...
    "a odległością miu od wartości własnej macierzy A.\n" + ...
    "Wielkość macierzy A = %d \n" + ...
    "Maksymalna liczba iteracji = %d\n" + ...
    "Maksymalny dopuszczalny błąd = %d\n" + ...
    "Wielkość macierzy = %d\n";
n = 20;
l = 3;
A = cell(l,1);
A{1} = 2*rand(n);
A{2} = 4*rand(n);
A{3} = 8*rand(n);
miu = 100;
tol = 1e-5;
maxIt = 500;
k = 1000;
err = zeros(l, k);
it = zeros(l,k);
res = zeros(l,k);
dist = zeros(l,k);

fprintf(start, n, maxIt, tol, n);
fprintf("trwa liczenie :) \n");

for i = 1 : k
    [res(1,i), it(1,i), err(1,i)] = P2Z10_AZY_eigenvalue(A{1}, miu, tol, maxIt);
    [res(2,i), it(2,i), err(2,i)] = P2Z10_AZY_eigenvalue(A{2}, miu, tol, maxIt);
    [res(3,i), it(3,i), err(3,i)] = P2Z10_AZY_eigenvalue(A{3}, miu, tol, maxIt);
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
xlabel("Odległość współczynnika miu od znalezionej wartości własnej");
ylabel("Ilość iteracji");
legend("macierz o elementach z zakresu od 0 do 2", ...
    "macierz o elementach z zakresu od 0 do 4", ...
    "macierz o elementach z zakresu od 0 do 8");
end% function