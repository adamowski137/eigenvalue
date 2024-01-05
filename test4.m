function [] = test4()
maxIt = 1000;
tol = 1e-10;
miu = 0;
k = 7;

start = "Test 4\n" + ...
    "Test ten sprawdza wyniki metody dla\n" + ...
    "losowej wielkości macierzy o losowych elementach.\n\n" + ...
    "Maksymalna liczba iteracji = %d\n" + ...
    "Maksymalny dopuszczalny błąd = %d\n" + ...
    "Miu = %d %+di\n" + ...
    "Jeżeli liczba iteracji jest większa niż maxIt wynik może\n " + ...
    "być błędny\n";

fprintf(start, maxIt, tol, real(miu), imag(miu));
pause;
max = 100;
fprintf("==========================================================" + ...
    "===\n");
fprintf("│wyznaczona wartość%*s│błąd przybliżeń%*s" + ...
    "│liczba iteracji%*s│n │\n", 3,"", 0,"", 0, "");
fprintf("==========================================================" + ...
    "===\n");
for i = 1:k
    n = randi(max, 1);
    A  = (rand(n)*max - max/2) + (rand(n)*max - max/2)*1i;
    [res, it, err] = P2Z10_AZY_eigenvalue(A,miu,tol,maxIt);

    fprintf("│%-+10f%-+10fi│%-15d│%-15d│%-2d│\n", ...
        real(res), imag(res), err, it, n);
    fprintf("=============================================" + ...
        "================\n");
end
end% function

