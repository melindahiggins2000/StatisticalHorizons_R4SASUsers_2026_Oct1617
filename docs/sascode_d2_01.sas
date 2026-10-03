* ================================================
  load the helpmkh.sas7bdat
  last updated 05/16/2026, 09/13/2026

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

* SAS CODE I used to create data subsets
  and saved them to project folder;

data rforsas.dat1;
  set helpfmt;
  keep id age cesd;
run;

data rforsas.dat2;
  set helpfmt;
  keep id female cesd2;
  where not missing(cesd2);  /* cases with non-missing cesd2*/
run;

data rforsas.treat1;
  set helpfmt;
  where treat=0;
  keep id treat age cesd pcs;
run;

data rforsas.treat2;
  set helpfmt;
  where treat=1;
  keep id treat age cesd mcs;
run;

* ================================================
  Section 1. Statistical Tests and Models
  ================================================;

* t-test;
proc ttest data=help;
  class treat;
  var cesd1;
  run;

* non-parametric two-group test;
proc npar1way data=help wilcoxon;
  class treat;
  var cesd1;
  run;

* compute cesd1 > 16;
data help;
  set help;
  if not missing(cesd1) then cesd1_gt16 = cesd1>16;
  else cesd1_gt16 = .;
  run;

* chi-square test;
proc freq data=help;
  table cesd1_gt16 * treat / chisq fisher norow nopercent;
  run;

* ANOVA
  compare mcs between 4 race groups
  run bonferroni adjusted pairwise comparisons
  run homogenity of variance
  and get welch's adjusted test if needed;

proc ANOVA data=help;
	class racegrp;
	model mcs = racegrp;
	means racegrp / bon hovtest welch;
	run;

* Regression ========================================;

proc reg data=help;
  model mcs = age female cesd / STB CLB;
  run;

* Compare "main" vs "adj" models
  "main" for mcs = cesd
  "adj"  for mcs = cesd + age + female;

proc reg data=help 
         plots=none outest=rsq_data rsquare;
  var mcs cesd age female;
  model mcs=cesd;
  run ;
  model mcs=cesd age female;
  run ;
quit;

* get change in r2 between the 2 models;

data rsq_extended;
  set rsq_data;
  delta_rsq=dif(_rsq_);
  delta_indvars=dif(_in_);
run;

proc print data=rsq_extended; run;

* Test coefficients for age and female = 0
  which is a test of covariates
  significant or not, "main" vs "adj";

proc reg data=help;
  model mcs=cesd age female;
  test age=0, female=0;
  run;
  quit;

* logistic regression =============================;
* compute mcs > 50;
data help;
  set help;
  if not missing(mcs) then mcs_gt50 = mcs > 16;
  else mcs = .;
  run;

proc logistic data=help plots=roc descending;
  model mcs_gt50 = age female cesd / ctable lackfit;
  run;

* ================================================
  Section 2. Merging Datasets 
  ================================================;

* perform inner join;
proc sql;
	create table dat12_inner as
	select * from rforsas.dat1 as x join rforsas.dat2 as y
	on x.id = y.id;
quit;

* view contents of inner join
  and view in data viewer;
proc contents data=dat12_inner;
run;

* perform outer join;
proc sql;
	create table dat12_outer as
	select * from rforsas.dat1 as x full join rforsas.dat2 as y
	on x.id = y.id;
quit;

* view contents of outer join
  and view in data viewer;
proc contents data=dat12_outer;
run;

* stack 2 datasets
  using concatenation;
data stack12;
   set rforsas.treat1 rforsas.treat2;
run;

* view contents of stacked dataset
  and view in data viewer;
proc contents data=stack12;
run;

proc contents data=help;
run;

* ================================================
  Section 3. Restructuring Datasets
  ================================================;

* Currently the help dataset is in a WIDE format.
  Let's pull out the cesd scores at all 5 time points
  also pull out baseline variables age and female and id
  and keep treatment group assignment;

data cesd5times;
  set help;
  keep id age female treat cesd cesd1 cesd2 cesd3 cesd4;
run;

* cesd5times has 453 rows and 9 columns

# this is currently a "WIDE" data format
# where the measurements for different
# time points are in different columns
# Let's create a LONG formatted dataset
# where each ID will have a separate row
# for each time point - although for now
# we just have the original variable names

# Restructure from WIDE to LONG ===========================
# To do this, we will use proc transpose;

* use proc sort by id FIRST;
proc sort data=cesd5times out=cesd5times_sortid;
    by id;
run;

* use proc transpose on data sorted by id;
proc transpose data=cesd5times_sortid out=cesd5times_long(rename=(col1=cesdscore));
   by id age female treat;
run;

* The result cesd5times_long is now
  453*5 = 2265 rows with 6 columns;

proc contents data=cesd5times_long; run;

* add timeindex using IF THEN statments;
data cesd5times_long;
  set cesd5times_long;
  if _NAME_ = "CESD" then timeindex = 1;
  if _NAME_ = "CESD1" then timeindex = 2;
  if _NAME_ = "CESD2" then timeindex = 3;
  if _NAME_ = "CESD3" then timeindex = 4;
  if _NAME_ = "CESD4" then timeindex = 5;
  run;

* Restructure from LONG to WIDE ===========================
# What if we need to go back the other way
# from LONG to WIDE we can still use proc transpose;

* It would be good to resort by id and timeindex first
  to put the columns back into a logical order;

proc sort data=cesd5times_long out=cesd5times_longsort;
  by id timeindex;
  run;

proc transpose data=cesd5times_longsort out=cesd5times_wide prefix=cesd_;
    by id age female treat;
    id timeindex;
    var cesdscore;
run;
