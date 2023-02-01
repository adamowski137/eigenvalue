function [] = numtest2()
start = "Test numeryczny 2\n" + ...
    "Test ten sprawdza zależność pomiędzy czasem wykonywania\n" + ...
    "programu a wielkością macierzy A.\n" + ...
    "elementy są postaci a + bi\n" + ...
    "a jest od -100 do 100, b jest od -100 do 100 \n" + ...
    "Maksymalna liczba iteracji = %d\n" + ...
    "Maksymalny dopuszczalny błąd = %d\n" +...
    "wartość miu = %d \n" + ...
    "Maksymalna wielkość macierzy = %d\n\n";

miu = 1;
tol = 1e-5;
maxIt = 100;
k = 300;
err = zeros(1, k);
it = zeros(1,k);
res = zeros(1,k);
time = zeros(1,k);
fprintf(start, maxIt, tol, miu, k);
fprintf("trwa liczenie :)\n");
for i = 1:k
    A = (randi(200,1)*rand(i)-100) + randi(200,1)*rand(i)*1i - 100i;
    tic;
    [res(1,i), it(1,i), err(1,i)] = P2Z42_AZY_eigenvalue(A, miu, tol, maxIt);
    time(i) = toc;
end
figure(1);
hold on;
plot(1:k, time);
xlabel("Wielkość macierzy");
ylabel("czas trwania programu [s]");


end% function

