function [] = test1()
maxIt = 1000;
tol = 1e-10;
miu = 10;

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


k = 5;
A = cell(k,1);
A{1} = [2, 1, 3;
        0, -3, 5; 
        0, 0, 5];
A{2} = [ 1i, 1i, 12i;
        -1i, -1i, 1;
        -12i, -1, 1i];
A{3} =[ 2, 1, 0;
        0, 3, 1;
        0, 0, 4];
 A{4} = [9, 3, 0;
         6, 12, 3;
         6, 3,  12];
 A{5} = [0, 0, 0, 1;
         0, 0, -9, 0;
         0, -4, 0, 0;
         49, 0, 0, 0];
trueRes = [5, 12+1i, 4, 9, 7];
for i = 1:k
    fprintf("Macierz:\n");
    disp(A{i});
    fprintf("Oczekiwana wartość: ");
    disp(trueRes(i));
    [res, it, err] = P2Z10_AZY_eigenvalue(A{i},miu,tol,maxIt);
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
