
# Ejemplo de Testing con Stubs y Mocks - Ruleta

## Objetivo

Muestra cómo testear con mocks y stubs cuando tenemos valores aleatorios o tenemos que evitar que manden mails cada vez que ejecutamos los tests.

## Conceptos a ver

* Testeo unitario
* Generación de stubs 
* Generación de tests de expectativa mediante el uso de mocks que provee [Mockito](http://site.mockito.org/)

## Branches

Cada branch tiene una introducción y una explicación detallada.

- `01-initial-flaky-tests`: los tests son _flaky_. Fallan (casi siempre) porque la ruleta devuelve números en forma aleatoria, y no es posible repetir las apuestas ganadoras.
- `02-stubbing-roulette`: arreglamos los _flaky tests_ implementando un _stub_ manual que permite configurar el número ganador de la ruleta virtual.
- `03-stubbing-roulette-mockito`: el mismo _stub_ del branch 02 pero implementado con el framework Mockito. Tanto este branch como el anterior muestran tests de estado.
- `04-mock-tests`: usamos un _mock_ con Mockito que simula el envío de mails para mostrar cómo es un test de comportamiento.


## Material adicional

- [Video explicativo](https://www.youtube.com/watch?v=V5D43EcZkQ0)
- [Diapositivas](https://docs.google.com/presentation/d/1hyY1zyKUrs1qlrMuN_KuagVCmOzjv_XpPsXI7RLnSHk/edit#slide=id.p)
