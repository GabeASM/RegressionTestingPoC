# regression poc
***Ejemplo de pruebas de regresión Gabriel Aillapán***


Este proyecto consiste en la implementación de pruebas de regresión con la herramienta Flutter. Toma como base el ejercicio anterior y lo adapta a las pruebas de regresión. El objetivo principal de este tipo de pruebas es detectar y abordar efectos secundarios no deseados o errores introducidos durante la implementación de nuevas funciones o modificaciones. 
La prueba de regresión ayuda a mantener la estabilidad del software al verificar que el sistema en general aún se comporte correctamente después de cada cambio de código.


¿Cómo se realizan las pruebas de humo?  
1. Selección de pruebas de regresión: Elige los casos de prueba que deben volver a probarse, dividiéndolos en reutilizables (funcionalidad crítica, propensos a errores, o que fallaron anteriormente) y obsoletos (ya no relevantes).

2. Determinación del tiempo de ejecución: Estima el tiempo necesario para ejecutar los casos de prueba seleccionados, considerando factores como la creación de datos de prueba y la planificación del equipo.

3. Identificación de casos de prueba automatizables: Clasifica los casos de prueba en manuales y automatizables. Las pruebas automatizadas son más rápidas y reutilizables, por lo que se priorizan cuando es posible.

4. Priorización de los casos de prueba: Ordena los casos de prueba por prioridad:

    -  Prioridad 0: Funcionalidades principales.
    - Prioridad 1: Funciones esenciales no críticas.
    - Prioridad 2: Casos relacionados con deuda técnica.
5. Ejecución de los casos de prueba: Ejecuta los casos de prueba manual o automáticamente, verificando si el producto sigue funcionando como se espera.

Estos pasos aseguran una gestión eficiente de las pruebas de regresión, minimizando riesgos y asegurando la calidad del software.

*Esencialmente, la prueba de regresión proporciona una manera de realizar un chequeo de salud periódico de tu aplicación*

**La Prueba de Regresión es un método más que una herramienta específica. Cualquier prueba desarrollada durante el lanzamiento inicial de una función y reejecutada en versiones posteriores califica como una prueba de regresión.**



### Caso de prueba
El cliente nos solicita una nueva feature totalmente innovadora para nuestro login. Nosotros codificamos la nueva  [feature totalmente innovadora nunca antes vista](new_feature.txt)  

y lo colocamos en el widget de [contraseña](lib/login/widgets/password_field.dart). No debería pasar nada extraño, ya que tenemos nuestro [chequeo de salud periódico](test/widget_test.dart) de la aplicación llamado pruebas de regresión. 

¿La nueva feature se integra correctamente en la aplicación?

Si llegamos a encontrar algún error al aplicar esta nueva feature, las pruebas de regresión deberían alertarnos que algo dejo de funcionar, por lo que toca [corregir](new_feature_real.txt) lo antes posible.




# Diferencia entre pruebas de humo y pruebas de regresión

La diferencia entre **pruebas de humo** y **pruebas de regresión** radica en su propósito y alcance dentro del proceso de pruebas de software:

## 1. Pruebas de humo:
- **Propósito**: Verificar que los componentes más importantes de una aplicación funcionen correctamente después de una nueva versión o implementación. Son pruebas rápidas y de alto nivel que aseguran que la aplicación no está rota antes de proceder con pruebas más exhaustivas.
- **Alcance**: Limitado. Se enfoca solo en validar funciones críticas o flujos principales (como que la aplicación se inicie correctamente o que se pueda navegar entre las pantallas principales).
- **Frecuencia**: Se ejecutan cada vez que se introduce un cambio significativo o cuando se integra un nuevo build. Es una especie de "chequeo rápido" para ver si vale la pena seguir probando más a fondo.
- **Tiempo de ejecución**: Corto, ya que se enfoca solo en aspectos esenciales.
- **Ejemplo**: Verificar que la aplicación pueda arrancar, que los botones principales funcionen, y que no haya errores fatales al cargar las pantallas clave.

## 2. Pruebas de regresión:
- **Propósito**: Asegurar que los cambios en el código (nuevas funcionalidades, correcciones de errores, etc.) no han introducido fallos en funcionalidades que previamente funcionaban. Estas pruebas garantizan que la aplicación sigue siendo estable después de modificaciones.
- **Alcance**: Amplio. Incluye la verificación de todo el sistema o componentes clave que puedan verse afectados por el cambio. Puede abarcar tanto pruebas automatizadas como manuales y se extiende a áreas no directamente relacionadas con los cambios.
- **Frecuencia**: Se ejecutan cada vez que se realizan cambios en el código, especialmente cuando se lanzan nuevas versiones, corrigen bugs o añaden características. Son pruebas más detalladas y exhaustivas.
- **Tiempo de ejecución**: Medio a largo, dependiendo del tamaño del proyecto, ya que se deben verificar muchas funcionalidades.



| Aspecto              | Pruebas de humo                                | Pruebas de regresión                          |
|----------------------|------------------------------------------------|----------------------------------------------|
| **Propósito**         | Verificar rápidamente que el sistema no está roto | Verificar que no haya nuevos fallos tras cambios |
| **Alcance**           | Limitado a funciones clave                     | Amplio, cubre áreas críticas y adyacentes    |
| **Frecuencia**        | Cada nuevo build o versión                     | Tras cada cambio o adición de funcionalidades |
| **Tiempo de ejecución** | Corto                                        | Medio a largo                               |
| **Profundidad**       | Superficial                                    | Profunda y detallada                        |