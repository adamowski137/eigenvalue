function [] = test3()
n = 10;
maxIt = 1000;
tol = 1e-10;
miu = 30;

start = "Test 3\n" + ...
    "Test ten sprawdza poprawność metody dla\n" + ...
    "macierzy o różnych rozmiarach.\n" + ...
    "Utworzona zostanie macierz A następnie będziemy\n" + ...
    "brać jej coraz większe wycinki idąc od elemntu A(1:1)\n" + ...
    "Maksymalna liczba iteracji = %d\n" + ...
    "Maksymalny dopuszczalny błąd = %d\n" + ...
    "Miu = %d %+di\n" + ...
    "Jeżeli liczba iteracji jest większa niż maxIt wynik może\n" + ...
    "być błędny\n";

fprintf(start, maxIt, tol, real(miu), imag(miu));
pause;

trueRes = [1, 10, 10, 41, 41, 21, 21, 26, 26, 26];

A = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0;
     0, 10, 0, 0, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 41, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 0, -8, 0, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 21, 0, 0, 0, 0;
     0, 0, 0, 0, 0, 0, 44, 0, 0, 0;
     0, 0, 0, 0, 0, 0, 0, 26, 0, 0;
     0, 0, 0, 0, 0, 0, 0, 0, 35, 0;
     0, 0, 0, 0, 0, 0, 0, 0, 0, -39];
fprintf("Macierz: ");
display(A);
fprintf("Oczekiwane wartości: \n");
disp(trueRes);
pause;
fprintf("==========================================================" + ...
    "==================\n");
fprintf("│wyznaczona wartość%*s│błąd wyniku%*s│błąd przybliżeń%*s" + ...
    "│liczba iteracji%*s│n │\n", 4,"", 2,"", 0,"", 0, "");
fprintf("===========================================================" + ...
    "=================\n");
for i = 1:n
    [res, it, err] = P2Z10_AZY_eigenvalue(A(1:i,1:i),miu,tol,maxIt);
    t =  sprintf("%d",abs(res - trueRes(i)));

    fprintf("│%-+10f%-+10fi │%-13s│%-15d│%-15d│%-2d│\n", ...
        real(res), imag(res), t, err, it, i);
    fprintf("=============================================" + ...
        "===============================\n");
    pause;
end

end% function

