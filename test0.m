function [] = test0()
start = "Test 0\n" + ...
    "Test ten sprawdza poprawność\n" + ...
    "działania metody myLU.\n" + ...
    "Metoda ta przeprowadza rozkład \n" + ...
    "macierzy PA = LU\n";
fprintf("==========================================================" + ...
        "===============\n");
fprintf(start);
fprintf("==========================================================" + ...
        "===============\n");
pause;
k = 5;
A = cell(k,2);
s = 100;
t = randi(100,1);
A{1,1} = rand(s);
A{1,2} = sprintf("Losowa macierz rzeczywista %d x %d\n", s, s);
A{2,1} = rand(s) + rand(s)*1i;
A{2,2} = sprintf("Losowa macierz zespolona %d x %d\n", s, s);
A{3,1} = eye(s);
A{3,2} = sprintf("Macierz jednostkowa %d x %d\n", s, s);
A{4,1} = rand(100,10) * rand(10, 100);
A{4,2} = sprintf("Macierz osobliwa powstała przez wymnożenie\n" + ...
    "losowych macierzy %d x 10 i 10 x %d\n", s, s);
A{5, 1} = rand(t, t);
A{5, 2} = sprintf("Macierz o wylosowanej wielości %d " + ...
    "i losowych elementach\n", t);

for i = 1:k
    fprintf(A{i,2});
    fprintf("norma(PA - LU):");
    tmp = A{i,1}; 
    [P,L,U] = myLU(tmp);
    disp(norm(tmp(P, :) - L * U));
    pause;
end
end %function

