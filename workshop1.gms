$onText
Workshop 1 - MOS

Made by:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets i 'Foods' /C, A, L, P/;

Parameter C(i)  'Calories of each Food'         /C 287, A 204, L 146, P 245/;
Parameter P(i) 'Proteins of each Food'          /C 26, A 4.2, L 8, P 6/;
Parameter S(i) 'Sugars of each Food'            /C 0, A 0.01, L 13, P 35/;
Parameter F(i)  'Fats of each Food'             /C 19.3, A 0.5, L 8, P 0.8/;
Parameter Carb(i) 'Carbohydrates of each Food'  /C 0, A 44.1, L 11, P 55/;
Parameter Price(i) 'Prices of each Food'        /C 3000, A 1000, L 600, P 700/;

Variables z    'Target function'
          x(i) 'Amount of a food';
    
Scalar calLimit     'Minimum limit of calories'      /1500/;
Scalar proteinLimit 'Minimum limit of proteins'      /63/;
Scalar sugarLimit   'Maximum limit of sugars'        /25/;
Scalar fatLimit     'Maximum limit of fats'          /50/;
Scalar carbsLimit   'Maximum limit of carbohydrates' /200/;
    
Positive Variable x;
    
Equations targetFunc    'Target function'
          calories      'Calorie Restriction'
          proteins      'Protein Restriction'
          sugars        'Sugar restriction'
          fats          'Fat restriction'
          carbohydrates 'Carbohydrate restriction';

targetFunc..    z =e= sum((i), Price(i)*x(i));
calories..      sum((i), C(i)*x(i)) =g= calLimit;
proteins..      sum((i), P(i)*x(i)) =g= proteinLimit;
sugars..        sum((i), S(i)*x(i)) =l= sugarLimit;
fats..          sum((i), F(i)*x(i)) =l= fatLimit;
carbohydrates.. sum((i), Carb(i)*x(i)) =l= carbsLimit;

Model workshop1 /all/;
option lp=CPLEX;
Solve workshop1 using lp minimizing z;
Display x.l;
Display z.l;
