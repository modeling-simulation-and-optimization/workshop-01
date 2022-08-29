$onText
Taller 1 - MOS

Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets i 'Alimentos' /C, A, L, P/;

Parameter C(i) 'Calorías de cada Alimento' /C 287, A 204, L 146, P 245/;
Parameter P(i) 'Proteínas de cada Alimento' /C 26, A 4.2, L 8, P 6/;
Parameter A(i) 'Azúcares de cada Alimento' /C 0, A 0.01, L 13, P 35/;
Parameter G(i) 'Grasas de cada Alimento' /C 19.3, A 0.5, L 8, P 0.8/;
Parameter Carb(i) 'Carbohidratos de cada Alimento' /C 0, A 44.1, L 11, P 55/;
Parameter Precio(i) 'Precios de cada Alimento' /C 3000, A 1000, L 600, P 700/;

Variables
    z 'Función Objetivo'
    x(i) 'Cantidad del alimento';
    
Scalar calLimit 'Límite de calorías' /1500/;
Scalar proteinLimit 'Límite de proteínas' /63/;
Scalar sugarLimit 'Límite de azúcares' /25/;
Scalar fatLimit 'Límite de grasas' /50/;
Scalar carbsLimit 'Límite de Carbohidratos' /200/;
    
Positive Variable
    x;
    
Equations
    targetFunc 'Función Objetivo'
    calorias 'Restricción de Calorías'
    proteinas 'Restricción de Proteínas'
    azucares 'Restricción de azúcares'
    grasas 'Restricción de grasas'
    carbohidratos 'Restricción de carbohidratos';

targetFunc .. z =e= sum((i), Precio(i)*x(i));
calorias .. sum((i), C(i)*x(i)) =g= calLimit;
proteinas .. sum((i), P(i)*x(i)) =g= proteinLimit;
azucares .. sum((i), A(i)*x(i)) =l= sugarLimit;
grasas .. sum((i), G(i)*x(i)) =l= fatLimit;
carbohidratos .. sum((i), Carb(i)*x(i)) =l= carbsLimit;

Model Taller1 /all/;
option lp=CPLEX;
Solve Taller1 using lp minimizing z;
Display x.l;
Display z.l;
