## limpieza del archivo

sed 's#/#-#g' data.csv > out.1 #convierte / en -
sed 's/-\([0-9][0-9]\);/-20\1;/g' out.1>out.2 #convierte el año YY a YYYY
sed 's/\([0-9]\)-\([0-9]\)-/0\1-0\2-/g' out.2>out.3  #agregar 0 inicial a numeros de 1 digito
sed 's/\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9]*\);/\3-\2-\1;/g' out.3 > out.4 #invertir el año por el dìa
#sed 's/-\([0-9]\),/\1./g' out.4> out.5 #use el . para indicar decimales
sed 's/,/./g' out.4>out.5
sed 's/;/,/g' out.5>out.6 #reemplace los ; por , 

## Transformar datos nulos 
tr  '[:lower:]' '[:upper:]' < out.6 > out.7  #todas las letras en mayuscula
sed 's/,N/\,\\N/g' out.7>out.8 #cambia las N por \N
sed 's/,,/,\\N,/g' out.8>out.9 #cambia las ,, por  ,\N,
sed 's/,$/,\\N/g' out.9>out.10 #los nulos al final de la cadena se cambian por ,\N

cat out.10
rm out.*