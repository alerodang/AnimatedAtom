# AnimatedAtom
## Introducción
Este proyecto consiste en la creación de un sistema 3D que incluye figuras geométricas, texturas, iluminación y una cámara en movimiento.
En este caso se definen tres planos entre los cuales se encuentra una esfera con diversas esferas orbitando a su alrededor. Estas esferas que orbitan alrededor de la central están cambiando de color continuamente. Se permite movimiento de la cámara en posición y orientación.
## Código
### DrawCube()
Este método se encarga de pintar tres planos en el espacio 3D.
### DrawLights()
Este método se encarga de dibujar las distintas luces presentes en el dibujo.
En esta ocasión tenemos 2 luces. Una luz de tipo directionaLight que apunta hacia uno de los planos (el representado en azul), cuya posición cambia a medida que movemos el ratón por el eje x y una luz del tipo pointLight, la cual esta fija en altura y se desplaza por el eje x a medida que movemos el ratón del eje horizontalde la pantalla y por el eje y a medida que lo movemos por el eje vertical.
### Cámara
En el código encontramos que la posición de la cámara depende de 3 variables, centerX, centerY, centerZ,. El valor de estas variables se modifica con las teclas “UP”, “DOWN”, “LEFT”, “RIGHT”, “+” y “-”.
La orientación de la cámara se define por otras 3 variables, las cuales son posX, posY y posZ. Para modificar el valor de estas variables utilizamos las teclas “4”, “6”, “8”, “2” y “5”.
## Controles
Cuando ejecutamos el código podemos mover la cámara con los siguientes comandos
Movimiento y cambio en la orientación de cámara
Tenemos dos modos de cámara. El denominado modo libre y el modo enfocado. 
El modo libre permite apuntar a cualquier lado del espacio 3D, mientras que el modo enfocado apunta siempre Libre.
## Movimiento de las luces
### Tenemos dos luces:
DirectionalLight
Esta luz apunta hacia el plano azul y se desplaza en el eje x de acuerdo a la posición del ratón.
### PointLight
Está fija en altura y se desplaza por el eje x a medida que movemos el ratón del eje horizontal de la pantalla y por el eje y a medida que lo movemos por el eje vertical.
