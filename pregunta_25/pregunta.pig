/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT  
       firstname,
       SUBSTRING_INDEX(firstname, 'a', 1)
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.csv' USING PigStorage(',') AS 
        ( id:int,
          nombre:charArray,
          apellido:charArray,
          fecha:charArray,
          color:charArray,
          numero:int);

consulta = FOREACH data GENERATE INDEXOF(nombre,'a',1);

STORE consulta INTO 'output' USING PigStorage(',');

