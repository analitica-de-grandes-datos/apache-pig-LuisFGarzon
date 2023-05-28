/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

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

consulta = FOREACH data GENERATE GetYear(fecha) AS ano;
agrupa = GROUP consulta BY ano;
conteo = FOREACH agrupa GENERATE group, COUNT(anos);

STORE conteo INTO 'output' USING PigStorage(',');
