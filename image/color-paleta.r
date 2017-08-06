###############################################
## Nombre: paleta-degradado.R
## color(RGB), color(RGB), Número -&gt; Paleta
##
## Definición de variables:
##
## degradados es un número natural mayor a 2
## colori es un color en RGB 
## 
## Esta función construye una paleta de N colores 
## degradados entre los colores, que puede ser
## luego utilizada por otras funciones y plots
##
## Ejemplo de uso:
##
## source("paleta-degradado.R")
##
#################################################

library(grDevices)

################################################
## Defino aquí mis variables libres
# Lo hago mediante preguntas al usuario
################################################

## color(1...4) es una String
## color(1...4) es una string que representa un color
## en hexadecimal, o bien una string que representa
## un color predefinido, por ejemplo "red"

print("Los colores han de tener forma hexadecimal, p.ej. #DD0000, o bien nombre, p.ej: red")
color1 =  readline("Define el primero de los colores ") 
while (color1 =="") color1 =  readline("Por favor, define el primer color ") 

color2 =  readline("Define el segundo color ") 
while (color2 =="") color2 =  readline("Por favor, define el segundo color ") 

color3 =  readline("Define el siguiente color (dejar en blanco si no se quiere utilizar) ") 
if (color3 =="") color3=NULL

color4 =  readline("Define el siguiente color (dejar en blanco si no se quiere utilizar) ") 
if (color4 =="") color4=NULL


## Construyo la paleta original con los colores proporcionados
colores.paleta= c(color1, color2, color3, color4)

## Consigo el número de colores de la paleta original
numcolors =  length(colores.paleta)

## degradados es un "Number"
## Es el número de degradados que necesito

degradados =  readline("¿Cuántos colores quieres que tenga la paleta? ")
degradados = as.numeric(unlist(strsplit(degradados, ",")))
while (degradados < 2 | degradados > 50) degradados =  readline("La respuesta ha de ser un número mayor o igual a 2 y menor a 50, ¿cuántos colores quieres que tenga la paleta? ")

#################################
## Ejecución de la función
#################################

## Creo una nueva paleta genérica basada en la original
pal = colorRampPalette(colores.paleta)

## Hago aparecer en la consola los colores que obtengo ##
print ("Paleta completa de colores")
print (pal(degradados))

## Dibujo un plot en blanco para incluir los degradados ##
plot(1:degradados,seq(1,10,length=degradados),type="n",xlab="",ylab="",main="Gráfica de degradados", axes=F)

## Hago aparecer los colores degradados de uno en uno en el plot ##
for (i in 1:degradados) rect(i-0.5,0,i+0.4999,11, col=pal(degradados)[i])

## Incluyo una leyenda para hacer aparecer en el plot
## los colores utilizados de forma comprensible
legend("topleft", legend=pal(i), fill=pal(i), text.col=pal(i), bg="#FFFFFF")