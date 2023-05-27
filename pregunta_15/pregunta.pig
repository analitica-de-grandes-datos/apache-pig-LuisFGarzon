/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

data = LOAD 'data.csv' USING PigStorage(',') AS (id:INT, nombre:CHARARRAY, apellido:CHARARRAY, fecha:CHARARRAY, color:CHARARRAY, numero:INT);

consulta = FOREACH data GENERATE nombre,color;
filtro_1 = FILTER consulta BY (color MATCHES 'blue' AND );
filtro_2 = FILTER filtro_1 BY (nombre MATCHES '.*[Z].*');

STORE filtro_2 INTO 'output' USING PigStorage(',');
