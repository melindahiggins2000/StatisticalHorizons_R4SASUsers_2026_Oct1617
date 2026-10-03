* helpfmt already loaded in WORK;

* find duplicates - save first case;
* example first ID for each race group;

proc sort data=helpfmt out=helpsortrace;
    by racegrp id;
run;

data firstrace;
    set helpsortrace;
    by racegrp;
    if first.racegrp; /* Subset: keeps row if first.racegrp = 1 */
run;

* find duplicates by age, female, racegrp, and homeless
  output "unique" rows into new dataset;

proc sort data=helpfmt out=unique_rows dupout=duplicate_rows nodupkey;
    by age female racegrp homeless;
run;



