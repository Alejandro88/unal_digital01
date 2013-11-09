*****************                                                                          ***********************
***************************** GUIA DE INSTRUCCIONES PARA USO DEL DIVISOR DE FRECUENCIA****************************
********************************************                                   ***********************************


El divisor de frecuencia que se presenta est� dise�ado, para comodidad de todos, para trabajar con periodos
Que como todos sabemos es el inverso de la frecuencia.



EXPLICACION DEL CODIGO Y SUS PARAMETROS:

**las primeras l�neas del c�digo son las encargadas de definir 
  Las entradas y salidas, clk, clk�_out, respectivamente se crea 
  un registro denominado reg bitcounter de tama�o suficientemente
  grande como para guardar la variable, el cual es el encargado
  de almacenar el contador que cuenta los  flancos de subida, para 
  Determinar el momento en que se debe crear la se�al de salida, este
  registro, adem�s, se inicia en cero.

**los par�metros siguientes como Te y Ts , son los periodos de las se�ales
  de entrada y salida respectivamente

*NOTA = en el c�digo los periodos no se muestran en las unidades reales
 en este caso nano segundos , debido a que estos par�metros al estar en las
 misma escala al dividirlos y calcular el siguiente par�metro no representa 
 ninguna diferencia en el funcionamiento del modulo

**el par�metro n sirve para determinar el valor en el que el contador cambiara de
  estado el reloj de salida , es decir de cero a uno o viceversa y se calcula como n =((Ts/(2*Te))-1).

*** con el inicio del ciclo always , se comienza el proceso de conteo, y se prueba 
    en cada iteraci�n si el valor del contador es igual a bitcounter-1 , si es as� el contador 
    se inicializa en cero debido a que esto indicar�a que es hora de cambiar el estado
    de la variable, sino se suma uno al contador hasta que se cumpla lo anterior mencionado.



####LIMITACIONES DEL CODIGO

    la divisi�n de los dos par�metros de entrada debe ser un numero entero mayor que uno,
    si la divisi�n no es entera deber� aproximarse manualmente y asignarla a n, para que
    el modulo funcione correctamente


