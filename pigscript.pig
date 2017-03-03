<hi>REGISTER 's3://14182pig1/script/maxscore.jar'
rec = LOAD 's3://14182pig1/input/'
USING com.chaitanya.pig.CutLoadFunc('1-3,4-8,9-11')
AS (course:Int, std:Int, score:Int);
groupedrec = GROUP rec by course PARALLEL 1;
maxrec = FOREACH groupedrec GENERATE MAX(rec.score);
STORE maxrec INTO 's3://14182pig1/output/maxscore';


