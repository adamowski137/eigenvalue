function [] = test2()
start = "Test 2\n" + ...
    "Test ten sprawdza poprawność\n" + ...
    "działania metody myUTlinsolve.\n" + ...
    "Metoda ta znajduje rozwiązania układu równań\n" + ...
    "Ax = b gdzie A jest macierzą dolnotrójkątną\n";
fprintf("==========================================================" + ...
        "===============\n");
fprintf(start);
fprintf("==========================================================" + ...
        "===============\n");
pause;
k = 3;
A = cell(k,3);
s = 100;
a = rand(s);
a = a + abs(eye(s)*1000);
A{1,1} = tril(a);
A{1,2} = rand(s, 1);
A{1,3} = sprintf("Losowy wektor i macierz rzeczywista\n" + ...
    "(diagonalnie dominująca) %d x %d\n", s, s);
A{2,1} = tril(rand(s) + rand(s)*1i);
A{2,2} = rand(s, 1) + rand(s, 1)*1i;
A{2,3} = sprintf("Losowy wektor i macierz zespolona %d x %d\n", s, s);
A{3,1} = eye(s);
A{3,2} = rand(s, 1);
A{3,3} = sprintf("Losowy wektor i macierz jednostkowa %d x %d\n", s, s);

for i = 1:k
   fprintf(A{i,3});
    fprintf("uwarunkowanie macierzy: %f\n", cond(A{i,1}));
    fprintf("norma różnicy wektora oczekiwanego i otrzymanego:");
    L = A{i,1}; 
    b = A{i,1} * A{i,2};
    resMy = myLTlinsolve(L, b);
    resLin = A{i,2};
    disp(norm(resMy - resLin));
    pause;
end
end %function

