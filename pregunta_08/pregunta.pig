/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' AS 
        ( letter:charArray,
          letter_bag:bag{},
          lista:map[]);

data = FOREACH data GENERATE letter_bag,FLATTEN(lista) as lista_1;
data = FOREACH data GENERATE letter_bag,FLATTEN(lista_1) as lista_2;
data = FOREACH data GENERATE lista_2,FLATTEN(letter_bag) as letra_1;
data = GROUP data BY (letra_1,lista_2) ;
data_2 = FOREACH data GENERATE group as col_1, COUNT(data) as col_2;

data_2 = ORDER data_2 BY col_1 ASC, col_2 ASC;
STORE data_2 INTO 'output' USING PigStorage(',');