$onText
Workshop 1 - MOS

Made by:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Table t(i, j) 'Properties of each food'

         C     A     L    P   
  Calo   287   204   146  245
  Prote  26    4.2   8    6     
  Sugar  0     0.01  13   35 
  Fats   19.3  0.5   8    0.8
  Carbo  0     44.1  11   55  
  Price  3000  1000  600  700;
  
Table t(i, j) 'Limit per property'

         Limit   
  Calo   1500
  Prote  63
  Sugar  25
  Fats   50
  Carbo  200;


Variables z    'Target function'
          x(i) 'Amount of a food';
    
Positive Variable x;
    
Equations targetFunc    'Target function'
          limit         'Properties Restriction';

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
