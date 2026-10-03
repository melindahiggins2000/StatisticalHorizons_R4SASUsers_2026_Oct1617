* ================================================
  load the helpmkh.sas7bdat
  last updated 05/16/2026

  HELP Dataset from the BOOK
  - SAS and R: Data Management, Statistical Analysis, 
    and Graphics (second edition)
    by Ken Kleinman and Nicholas J. Horton
  - https://nhorton.people.amherst.edu/sasr2/ 

  HELP Dataset 
  - https://nhorton.people.amherst.edu/sasr2/datasets.php

  HELP Documentation
  - https://nhorton.people.amherst.edu/help/
  - https://nhorton.people.amherst.edu/help/HELP-baseline.pdf
* ================================================;

* ================================================
  Section 1. Get Started with H.E.L.P. Dataset

  Create Library - Link to
  folder where your project files are

  Folder on My Computer C:\R4SASUsers
  your folder may be different
  ================================================;

libname rforsas 'C:\R4SASUsers';

* proc options option=encoding; *run;

* make a copy to WORK library;
data help;
  set rforsas.help;
  run;

* ================================================
  check data read in ok
  default output is alphabetical
  ================================================;

proc contents data=help; run;
proc contents data=rforsas.help; run;

* list by variable order number;
proc contents data=help order=varnum; run;

* ================================================
  Create and apply "codebook" to data
  include variable labels
  and value labels for numeric coding
  ================================================;

* create formats for value labels;
proc format;
   value TREAT
      0 = 'usual care'  
      1 = 'HELP clinic' ;
   value FEMALE
      0 = 'Male'  
      1 = 'Female' ;
   value HOMELESS
      0 = 'no'  
      1 = 'yes' ;
   value G1B
      0 = 'no'  
      1 = 'yes' ;
   value F1A
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1B
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1C
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1D
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1E
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1F
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1G
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1H
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1I
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1J
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1K
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1L
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1M
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1N
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1O
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1P
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1Q
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1R
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1S
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value F1T
      0 = 'Not at all or less than 1 day'  
      1 = '1-2 days'  
      2 = '3-4 days'  
      3 = '5-7 days or nearly every day for 2 weeks' ;
   value SATREAT
      0 = 'no'  
      1 = 'yes' ;
   value DRINKSTATUS
      0 = 'no'  
      1 = 'yes' ;
   value ANYSUBSTATUS
      0 = 'no'  
      1 = 'yes' ;
   value LINKSTATUS
      0 = 'no'  
      1 = 'yes' ;
run;

* add variable labels and 
  apply formats for value labels;
data helpfmt;
  set help;
  * add variable labels;
  label id = "Subject ID"
		treat = "Randomization Group"
		age = "Age at baseline (in years)"
		female = "Gender of respondent"
		pss_fr = "Perceived Social Support - friends"
		racegrp = "Racial Group of Respondent"
		homeless = "One or more nights on the street or shelter in past 6 months"
		a15a = "Number of nights in overnigh shelter in past 6 months"
		a15b ="Number of nights on the street in past 6 months"
		d1 = "How many times hospitalized for medical problems (lifetime)"
		e2b = "Number of times in past 6 months entered a detox program - Baseline"
		g1b = "Experienced serious thoughts of suicide (last 30 days) - Baseline"
		i1 = "Average number of drinks (standard units) consumed per day (in past 30 days) - Baseline"
		i2 = "Maximum number of drinks (standard units) consumed per day (in past 30 days)"
		pcs = "SF36 Physical Composite Score - Baseline"
		mcs = "SF36 Mental Composite Score - Baseline"
		f1a = "CESD 1 - I was bothered by things that usually dont bother me"
		f1b = "CESD 2 - I did not feel like eating; my appetite was poor"
		f1c = "CESD 3 - I felt that I could not shake off the blues even with help from my family or friends"
		f1d	= "CESD 4 - I felt that I was just as good as other people"
		f1e	= "CESD 5 - I had trouble keeping my mind on what I was doing"
		f1f	= "CESD 6 - I felt depressed"
		f1g	= "CESD 7 - I felt that everything I did was an effort"
		f1h	= "CESD 8 - I felt hopeful about the future"
		f1i	= "CESD 9 - I thought my life had been a failure"
		f1j	= "CESD 10 - I felt fearful"
		f1k	= "CESD 11 - My sleep was restless"
		f1l	= "CESD 12 - I was happy"
		f1m	= "CESD 13 - I talked less than usual"
		f1n	= "CESD 14 - I felt lonely"
		f1o	= "CESD 15 - People were unfriendly"
		f1p	= "CESD 16 - I enjoyed life"
		f1q	= "CESD 17 - I had crying spells"
		f1r	= "CESD 18 - I felt sad"
		f1s	= "CESD 19 - I felt that people dislike me"
		f1t	= "CESD 20 - I could not get going"
		cesd = "CESD total score - Baseline"
		indtot = "Inventory of Drug Use Consequences (InDue) total score - Baseline"
		drugrisk = "Risk Assessment Battery (RAB) drug risk score - Baseline"
		sexrisk	= "Risk Assessment Battery (RAB) sex risk score - Baseline"
		satreat	= "Any BSAS substance abuse treatment at baseline"
		substance = "Primary substance of abuse"
		drinkstatus = "Use of alcohol post-detox"
		daysdrink =	"Time (in days) to first alcoholic drink post-detox"
		anysubstatus = "Use of any substance post-detox"
		daysanysub = "Time (in days) to first use of any substance post-detox"
		linkstatus = "Post-detox linkage to primary care"
		dayslink = "Time (in days) to linkage to primary care"
		e2b1 = "Number of times in past 6 months entered a detox program - 6mo"
		g1b1 = "Experienced serious thoughts of suicide (last 30 days) - 6mo"
		i11	= "Average number of drinks (standard units) consumed per day (in past 30 days) - 6mo"
		pcs1 = "SF36 Physical Composite Score - 6mo"
		mcs1 = "SF36 Mental Composite Score - 6mo"
		cesd1 = "CESD total score - 6mo"
		indtot1	= "Inventory of Drug Use Consequences (InDue) total score - 6mo"
		drugrisk1 = "Risk Assessment Battery (RAB) drug risk score - 6mo"
		sexrisk1 = "Risk Assessment Battery (RAB) sex risk score - 6mo"
		pcrec1 = "Number of primary care visits in past 6 months - 6mo"
		e2b2 = "Number of times in past 6 months entered a detox program - 12mo"
		g1b2 = "Experienced serious thoughts of suicide (last 30 days) - 12mo"
		i12	="Average number of drinks (standard units) consumed per day (in past 30 days) - 12mo"
		pcs2 = "SF36 Physical Composite Score - 12mo"
		mcs2 = "SF36 Mental Composite Score - 12mo"
		cesd2 = "CESD total score - 12mo"
		indtot2	= "Inventory of Drug Use Consequences (InDue) total score - 12mo"
		drugrisk2 = "Risk Assessment Battery (RAB) drug risk score - 12mo"
		sexrisk2 = "Risk Assessment Battery (RAB) sex risk score - 12mo"
		pcrec2 = "Number of primary care visits in past 6 months - 12mo"
		e2b3 = "Number of times in past 6 months entered a detox program - 18mo"
		g1b3 = "Experienced serious thoughts of suicide (last 30 days) - 18mo"
		i13	= "Average number of drinks (standard units) consumed per day (in past 30 days) - 18mo"
		pcs3 = "SF36 Physical Composite Score - 18mo"
		mcs3 = "SF36 Mental Composite Score - 18mo"
		cesd3 = "CESD total score - 18mo"
		indtot3	= "Inventory of Drug Use Consequences (InDue) total score - 18mo"
		drugrisk3 = "Risk Assessment Battery (RAB) drug risk score - 18mo"
		sexrisk3 = "Risk Assessment Battery (RAB) sex risk score - 18mo"
		pcrec3 = "Number of primary care visits in past 6 months - 18mo"
		e2b4 = "Number of times in past 6 months entered a detox program - 24mo"
		g1b4 = "Experienced serious thoughts of suicide (last 30 days) - 24mo"
		i14	= "Average number of drinks (standard units) consumed per day (in past 30 days) - 24mo"
		pcs4 = "SF36 Physical Composite Score - 24mo"
		mcs4 = "SF36 Mental Composite Score - 24mo"
		cesd4 = "CESD total score - 24mo"
		indtot4	= "Inventory of Drug Use Consequences (InDue) total score - 24mo"
		drugrisk4 = "Risk Assessment Battery (RAB) drug risk score - 24mo"
		sexrisk4 = "Risk Assessment Battery (RAB) sex risk score - 24mo"
		pcrec4 = "Number of primary care visits in past 6 months - 24mo";

  * apply formats;
  format     treat TREAT.;
  format    female FEMALE.;
  format  homeless HOMELESS.;
  format       g1b G1B.;
  format       f1a F1A.;
  format       f1b F1B.;
  format       f1c F1C.;
  format       f1d F1D.;
  format       f1e F1E.;
  format       f1f F1F.;
  format       f1g F1G.;
  format       f1h F1H.;
  format       f1i F1I.;
  format       f1j F1J.;
  format       f1k F1K.;
  format       f1l F1L.;
  format       f1m F1M.;
  format       f1n F1N.;
  format       f1o F1O.;
  format       f1p F1P.;
  format       f1q F1Q.;
  format       f1r F1R.;
  format       f1s F1S.;
  format       f1t F1T.;
  format   satreat SATREAT.;
  format drinkstatus DRINKSTATUS.;
  format anysubstatus ANYSUBSTATUS.;
  format linkstatus LINKSTATUS.;
run;

* list by variable number
  check labels and formats;
proc contents data=helpfmt order=varnum; run;


* ================================================
  Section 2A. Selecting Data (variables and subsets) 
  ================================================;

data helpfmt_rows1_10;
    set helpfmt(firstobs=1 obs=10); /* keep rows 1-10*/
    keep age cesd;      /* Only keep age and cesd */
run;

* save ages for women;
data helpfmt_ageswomen;
    set helpfmt;
	where female = 1;   /* keep women */
    keep age;           /* Only keep age */
run;

* ================================================
  Section 2B. Exporting Data (variables and subsets) 
  ================================================;

* write these new datasets to your project folder ;

data rforsas.helpfmt_rows1_10;
    set work.helpfmt_rows1_10;
run;

data rforsas.helpfmt_ageswomen;
    set work.helpfmt_ageswomen;
run;

* Look at rforsas Library;

* look at WORK Library;

proc datasets lib=work nolist;
   delete helpfmt_rows1_10 helpfmt_ageswomen;
quit;

* read saved datasets back in to
  WORK library if wanted;

data work.helpfmt_ageswomen;
    set rforsas.helpfmt_ageswomen;
run;

* ================================================
  Section 3. Getting descriptive statistics 
  ================================================;

* get descriptive statistics of age;
proc univariate data=help plots;
  var age;
  run;

* another approach with proc means
  - get parametric statistics;
proc means data=help n min max mean std;
  var age;
  run;

* another approach with proc means
  - get non-parametric statistics;
proc means data=help n q1 median q3;
  var age;
  run;

* There are 5 options for quantile
  calculation in SAS, see SAS help for
  "Quantile and Related Statistics"
  QNTLDEF=5 is the default
  compare to QNTLDEF=4;

proc means data=help q1 median q3 QNTLDEF=4;
  var age;
  run;

* Get stats for a subset
  ages and cesd for women only;

proc means data=help;
  where female = 1;
  var age;
  run;

* Get stats for a subset
  ages and cesd BY racegrp;

proc means data=help;
  class racegrp;
  var age;
  run;

* sorting and displaying data =========================;
* sort data by age for women;

proc sort data=help out=womensortage;
   by age;
   where female = 1;
run;

* show ids and cesd scores
  for 5 youngest women;

proc print data=womensortage(obs=5);
  var id age cesd;
  run;

* show ids and cesd scores
  for 5 oldest women
  have to know number of rows=107
  set firstobs=102
  set last observation to obs=107;

proc print data=womensortage(firstobs=102 obs=107);
  var id age cesd;
  run;

* or sort descending and reuse code above;

proc sort data=help out=womensortdage;
   by descending age;
   where female = 1;
run;

proc print data=womensortdage(obs=5);
  var id age cesd;
  run;

* get frequency tables;

proc freq data=helpfmt;
  tables female racegrp;
  run;

* get race by gender
  chi-square test 
  and fisher's exact tests
  show column percents, counts, 
  and expected counts;

proc freq data=helpfmt;
  table racegrp*female / chisq fisher expected norow nopercent;
  run;


* =========================================================
  Section 4. Getting started with visualization 
  =========================================================;

* scatterplot of mcs and cesd;
proc sgplot data=helpfmt;
  scatter x=mcs y=cesd;
run;

* color by gender;
proc sgplot data=helpfmt;
  scatter x=mcs y=cesd / group=female;
run;

* add best fit lines by group;
proc sgplot data=helpfmt;
  reg x=mcs y=cesd / group=female;
run;

* add title, footnotes, 
  update xaxis and yaxis labels
  and legend title
  add confidence bands for best fit lines;

TITLE1 "CESD Scores by MCS Scores";
FOOTNOTE1 "CESD = Center for Epidemiological Studies-Depression";
FOOTNOTE2 "MCS = Mental Component Scale for SF36 Quality of Life";

proc sgplot data=helpfmt;
  reg x=mcs y=cesd / clm group=female;
  xaxis label="MCS Scores";
  yaxis label="CESD Scores";
  keylegend / title="Gender";
run;

TITLE; FOOTNOTE; /* Clears the titles and footnotes */
