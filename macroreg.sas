* helpfmt already loaded in WORK;

* macro regression example;

/* 1. Define the macro */
%macro run_regressions(data=, dep_var=, indep_list=);
    /* Count the number of variables in the list */
    %let num_vars = %sysfunc(countw(&indep_list.));
    
    /* Loop from 1 to the total number of words */
    %do i = 1 %to &num_vars.;
        /* Extract the i-th variable name */
        %let current_var = %scan(&indep_list., &i.);
        
        /* Run simple linear regression */
        proc reg data=&data.;
            model &dep_var. = &current_var.;
            title "Simple Regression of &dep_var. on &current_var.";
        run;
    %end;
%mend run_regressions;

/* 2. Call the macro */
options mprint; /* Prints generated code to the log for debugging */
%run_regressions(
    data=helpfmt, 
    dep_var=cesd, 
    indep_list=mcs pcs pss_fr
);
quit;
