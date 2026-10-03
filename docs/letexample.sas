* helpfmt already loaded in WORK;

* example using %let macro variable ====================;

/* 1. Create the macro variable */
%let gender = Female;

/* 2. Use the macro variable in a title or step */
title "Report for the &gender Gender";

/* 3. Check the value in the log using %put */
%put The selected Gender is &gender;

* generate output and see title;
proc freq data=helpfmt;
  tables racegrp homeless;
  where female = 1;
  run;

* example use for modeling ===============================;

/* Define model parameters using %LET */
%let my_dep = cesd;
%let my_indep = mcs;
%let my_data = helpfmt;

/* Use the macro variables in a model procedure */
proc reg data=&my_data.;
    model &my_dep. = &my_indep.;
run;
quit;
