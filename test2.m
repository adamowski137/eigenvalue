function [] = test2()
n = 3;
maxIt = 1000;
tol = 1e-10;
miu = -10;

start = "Test 2\n" + ...
    "Test ten sprawdza poprawność metody dla kilku\n" + ...
    "wybranych macierzy o małej róznicy\n" + ...
    "między wartościami własnymi.\n\n" + ...
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
A{1} = [1, 0, 0; 0, 1.001, 0; 0, 0, 1.002];
A{2} = [2, 0, 0; 0, 2.001, 0; 0, 0, 2.002];
A{3} = [1 + 2i, 0, 0; 0, 1.001 + 2i, 0; 0, 0, 1.002 + 2i];
trueRes = [1, 2, 1 + 2i];
for i = 1:k
    fprintf("Macierz:\n");
    disp(A{i});
    fprintf("Oczekiwana wartość: ");
    disp(trueRes(i));

    B = A{i};
    [res, it, err] = P2Z10_AZY_eigenvalue(B,miu,tol,maxIt);
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

