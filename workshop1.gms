$onText
Workshop 1 - MOS

Made by:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets i 'Foods'           /C, A, L, P/
     j 'Food Properties' /Cal, Prot, Sugar, Fat, Carbs/;

Parameter Price(i) /C 3000, A 1000, L 600, P 700/;
Parameter Limit(j) /Cal 1500, Prot 63, Sugar 25, Fat 50, Carbs 200/;

Table t(j, i) 'Properties of each food'

         C     A     L    P   
  Cal    287   204   146  245
  Prot   26    4.2   8    6     
  Sugar  0     0.01  13   35 
  Fat    19.3  0.5   8    0.8
  Carbs  0     44.1  11   55;
  

Variables z    'Target function'
          x(i) 'Amount of a food';
    
Positive Variable x;
    
Equations targetFunc   'Target function'
          gtConstraint 'Minimum properties restriction'
          ltConstraint 'Maximum properties restriction';

targetFunc..                                         z =e= sum((i), Price(i)*x(i));
gtConstraint(j)$(ord(j)=1 or ord(j) = 2)..           sum((i), t(j,i)*x(i)) =g= Limit(j);
ltConstraint(j)$(ord(j)=3 or ord(j)=4 or ord(j)=5).. sum((i), t(j,i)*x(i)) =l= Limit(j);  

Model workshop1 /all/;
option lp=CPLEX;
Solve workshop1 using lp minimizing z;
Display x.l;
Display z.l;
