* helpfmt already loaded in WORK;

* compute aggregate statistics;
proc sort data=helpfmt out=helpsortrace;
    by racegrp;
run;

* get average cesd scores by racegrp;
proc means data=helpsortrace mean std median min max n;
    by racegrp;
    var cesd;
    output out=summary_stats mean=avg_val std=std_val;
run;

* add aggregate stats back to original data;
/* 1. Calculate multiple aggregate statistics by group and 
      add suffix names automatically */
proc means data=helpfmt noprint;
    class racegrp; /* Grouping variable */
    var cesd;  /* Analysis variables */
    output out=agg_stats 
           mean= 
           std= / autoname; /* /autoname creates names like cesd_mean, cesd_std */
run;

/* 2. Sort original data and aggregate data before merging */
proc sort data=helpfmt; by racegrp; run;
proc sort data=agg_stats; by racegrp; run;

/* 3. Merge aggregate statistics back into the raw data */
data final_data;
    merge helpfmt (in=a) agg_stats (in=b drop=_type_ _freq_);
    by racegrp;
    if a; /* Keep all original rows */
run;


