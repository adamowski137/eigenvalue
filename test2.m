function [] = test2()
n = 3;
maxIt = 1000;
tol = 1e-10;
miu = -10;

start = "Test 2\n" + ...
    "Test ten sprawdza poprawność metody dla kilku\n" + ...
    "wybranych macierzy osobliwych.\n\n" + ...
    "Maksymalna liczba iteracji = %d\n" + ...
    "Maksymalny dopuszczalny błąd = %d\n" + ...
    "Wielkość macierzy = %d\n" + ...
    "Miu = %d %+di\n" + ...
    "Jeżeli liczba iteracji jest większa niż maxIt wynik może\n" + ...
    "być błędny\n";

fprintf(start, maxIt, tol, n, real(miu), imag(miu));
pause;


k = 3;
A = cell(k,1);
A{1} = ones(n);
A{2} = [10, 2, 12i;
    3,  8i, 7;
    13, 2+8i, 7+12i];
A{3} = [1, 2, 1;
    4, 3, 2;
    5, 5, 3];
trueRes = [0, 0, -1];
for i = 1:k
    fprintf("Macierz:\n");
    disp(A{i});
    B = A{i};
    [res, it, err] = P2Z42_AZY_eigenvalue(B,miu,tol,maxIt);
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

