% --- Dados de exemplo (podes substituir pelos teus)
x = [74, 76, 78];

% --- Ordem do modelo AR
order = 2;

% --- Calcular coeficientes com o método de Burg
[a, e] = arburg(x, order);

% --- Mostrar os resultados
disp('Coeficientes AR (formato: x[n] + a1*x[n-1] + a2*x[n-2] = erro):');
fprintf('a1 = %.4f\n', -a(2));
fprintf('a2 = %.4f\n', -a(3));
fprintf('Erro de previsão (energia do resíduo) = %.4f\n', e);