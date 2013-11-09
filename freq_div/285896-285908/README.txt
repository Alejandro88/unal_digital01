*****************                                                                          ***********************
***************************** GUIA DE INSTRUCCIONES PARA USO DEL DIVISOR DE FRECUENCIA****************************
********************************************                                   ***********************************


El divisor de frecuencia que se presenta está diseñado, para comodidad de todos, para trabajar con periodos
Que como todos sabemos es el inverso de la frecuencia.



EXPLICACION DEL CODIGO Y SUS PARAMETROS:

**las primeras líneas del código son las encargadas de definir 
  Las entradas y salidas, clk, clk¬_out, respectivamente se crea 
  un registro denominado reg bitcounter de tamaño suficientemente
  grande como para guardar la variable, el cual es el encargado
  de almacenar el contador que cuenta los  flancos de subida, para 
  Determinar el momento en que se debe crear la señal de salida, este
  registro, además, se inicia en cero.

**los parámetros siguientes como Te y Ts , son los periodos de las señales
  de entrada y salida respectivamente

*NOTA = en el código los periodos no se muestran en las unidades reales
 en este caso nano segundos , debido a que estos parámetros al estar en las
 misma escala al dividirlos y calcular el siguiente parámetro no representa 
 ninguna diferencia en el funcionamiento del modulo

**el parámetro n sirve para determinar el valor en el que el contador cambiara de
  estado el reloj de salida , es decir de cero a uno o viceversa y se calcula como n =((Ts/(2*Te))-1).

*** con el inicio del ciclo always , se comienza el proceso de conteo, y se prueba 
    en cada iteración si el valor del contador es igual a bitcounter-1 , si es así el contador 
    se inicializa en cero debido a que esto indicaría que es hora de cambiar el estado
    de la variable, sino se suma uno al contador hasta que se cumpla lo anterior mencionado.



####LIMITACIONES DEL CODIGO

    la división de los dos parámetros de entrada debe ser un numero entero mayor que uno,
    si la división no es entera deberá aproximarse manualmente y asignarla a n, para que
    el modulo funcione correctamente


