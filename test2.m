clear;
close all;

n = 3;
maxIt = 1000;
err = 1e-10;
miu = 0.1;

start = "Test 2\n" + ...
    "Test ten sprawdza poprawność metody dla macierzy\n" + ...
    "nieosobliwych.\n\n" + ...
    "Maksymalna liczba iteracji = %d\n" + ...
    "Maksymalny dopuszczalny błąd = %d\n" + ...
    "Wielkość macierzy = %d\n" + ...
    "Miu = %d %+di\n\n";

fprintf(start, maxIt, err, n, real(miu), imag(miu));
pause;


k = 2;
A = cell(k,1);
A{1} = ones(n);
A{2} = [1i, 1i, 12i;
        -i, -i, 1;
        -12i, -1, i];
trueRes = [7, -12+1i]; 
for i = 1:k
    fprintf("Macierz:\n");
    disp(A{i});
    [res, it, err] = P2Z42_AZY_eigenvalue(A{i},miu,err,maxIt);
    t =  sprintf("%d",abs(res - trueRes(i)));
    if it > maxIt
        t = "błąd";
    end
    fprintf("==========================================================" + ...
    "===============\n");
    fprintf("│wyznaczona wartość%*s│błąd wyniku%*s│błąd przybliżeń%*s" + ...
        "│liczba iteracji%*s│\n", 4,"", 2,"", 0,"", 0, "");
    fprintf("===========================================================" + ...
        "==============\n");
    fprintf("│%-+10f%-+10fi │%-13s│%-15d│%-15d│\n", real(res), imag(res), t, err, it);
        fprintf("===========================================================" + ...
        "==============\n\n");
    
end
