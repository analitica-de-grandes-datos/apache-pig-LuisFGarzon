/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS (numero: INT);
orden = order data BY numero asc;
unicos = DISTINCT orden;
limite = unicos unicos 5;

STORE limite INTO 'output' USING PigStorage(',');