function [] = test1()
n = 3;
maxIt = 1000;
tol = 1e-5;
miu = -70+1i;

start = "Test 1\n" + ...
    "Test ten sprawdza poprawność metody dla kilku wybranych\n" + ...
    "nieosobliwych macierzy.\n\n" + ...
    "Maksymalna liczba iteracji = %d\n" + ...
    "Maksymalny dopuszczalny błąd = %d\n" + ...
    "Miu = %d %+di\n" + ...
    "Jeżeli liczba iteracji jest większa niż maxIt wynik może\n" + ...
    "być błędny\n";

fprintf(start, maxIt, tol, real(miu), imag(miu));
pause;


k = 3;
A = cell(k,1);
A{1} = eye(n)*7;
A{2} = [1i, 1i, 12i;
    -1i, -1i, 1;
    -12i, -1, 1i];
A{3} = [1, 0 , 0;
    0, 10, 0;
    0, 0, 20];
trueRes = [7, -12+1i, 1];
for i = 1:k
    fprintf("Macierz:\n");
    disp(A{i});
    [res, it, err] = P2Z42_AZY_eigenvalue(A{i},miu,tol,maxIt);
    t =  sprintf("%d",abs(res - trueRes(i)));
    fprintf("==========================================================" + ...
        "===============\n");
    fprintf("│wyznaczona wartość%*s│błąd wyniku%*s│błąd przybliżeń%*s" + ...
        "│liczba iteracji%*s│\n", 4,"", 2,"", 0,"", 0, "");
    fprintf("===========================================================" + ...
        "==============\n");
    fprintf("│%-+10f%-+10fi │%-13s│%-15d│%-15d│\n", real(res), imag(res), t, err, it);
    fprintf("===========================================================" + ...
        "==============\n\n");
    pause;

end
end% function
