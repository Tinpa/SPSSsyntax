* Encoding: UTF-8.
DEFINE !repeater().
!DO !i=1 !TO 100.

DATASET ACTIVATE DataSet1.
USE ALL.
do if $casenum=1.
compute #s_$_1=50.
compute #s_$_2=474.
end if.
do if  #s_$_2 > 0.
compute filter_$=uniform(1)* #s_$_2 < #s_$_1.
compute #s_$_1=#s_$_1 - filter_$.
compute #s_$_2=#s_$_2 - 1.
else.
compute filter_$=0.
end if.
VARIABLE LABELS filter_$ '50 from the first 474 cases (SAMPLE)'.
FORMATS filter_$ (f1.0).
FILTER  BY filter_$.


DESCRIPTIVES VARIABLES=salary
  /STATISTICS=MEAN STDDEV MIN MAX.
EXECUTE.

!DOEND.
!ENDDEFINE.
!repeater.
