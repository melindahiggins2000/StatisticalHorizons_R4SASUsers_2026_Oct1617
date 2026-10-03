* =============================================;
* get details on SAS components and 
  products installed;
* =============================================;

proc setinit; run;

* =============================================;
* returns a list of the SAS Foundation products 
  that are installed on your system, along with 
  the version numbers of those products. It 
  provides a quick method to determine whether 
  a SAS product is available for your use;
* =============================================;

proc product_status; run;

* =============================================;
* example plot using builtin dataset;
* =============================================;

proc sgplot data=sashelp.cars;
    title "Horsepower vs. Weight";
    scatter x=weight y=horsepower / group=origin;
    reg x=weight y=horsepower;
run;

