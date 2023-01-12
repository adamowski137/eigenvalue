function [] = numtest3()
start = "Test numeryczny 1\n" + ...
    "Test ten sprawdza zależność pomiędzy liczbą iteracji\n" + ...
    "a odległością miu od wartości własnej macierzy A.\n" + ...
    "Macierz A jest macierzą o rozmiarze n losowych\n" + ...
    "elementów z zakresu od 0 do 1\n\n" + ...
    "Maksymalna liczba iteracji = %d\n" + ...
    "Maksymalny dopuszczalny błąd = %d\n";

miu = 1;
tol = 1e-5;
maxIt = 50000;
k = 10000;
err = zeros(1, k);
it = zeros(1,k);
res = zeros(1,k);
prop = zeros(1,k);
for i = 1:k
    A = rand(3);
    e = eig(A);
    e = abs(e);
    e = sort(e, 1, "descend");
    lambda1 = e(1);
    lambda2 = e(2);
    prop(i) = abs(lambda1 / lambda2);
    [res(1,i), it(1,i), err(1,i)] = P2Z42_AZY_eigenvalue(A, miu, tol, maxIt);
end
C = [prop(1,:)', it(1,:)'];
C = sortrows(C,1);
figure(1);
C(:,2) = movmean(C(:,2), 500);
hold on;
loglog(C(:,1), C(:, 2));

end

