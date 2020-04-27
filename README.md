
# Ejemplo de Testing con Stubs y Mocks - Ruleta


[![Build Status](https://travis-ci.com/uqbar-project/eg-ruleta-xtend.svg?branch=01-initial-flaky-tests)](https://travis-ci.com/uqbar-project/eg-ruleta-xtend) [![Coverage Status](https://coveralls.io/repos/github/uqbar-project/eg-ruleta-xtend/badge.svg?branch=master)](https://coveralls.io/github/uqbar-project/eg-ruleta-xtend?branch=01-initial-flaky-tests)


## Objetivo

Muestra cómo testear con mocks y stubs cuando tenemos valores aleatorios o tenemos que evitar que manden mails cada vez que ejecutamos los tests.

## Conceptos a ver

* Testeo unitario
* Flaky tests
* Generación de stubs 
* Generación de tests de expectativa mediante el uso de mocks que provee [Mockito](http://site.mockito.org/)

## Dominio

Recordemos el diagrama de clases:

![diagrama-clases](./images/Ruleta-Diagrama-Clases.png)

Otra opción en lugar de definir un Stub propio es aprovechar el framework **Mockito** que nos provee una forma de construir un objeto stub sin necesidad de definir una clase concreta:

```xtend
class StubRuleta {
	def static mockearRuleta(int numeroGanador) {
		val ruleta = mock(IRuleta)
		doNothing.when(ruleta).elegirNumero()
		doAnswer([ invocation |
			val apuesta = invocation.arguments.get(0) as Apuesta
			return apuesta.numeroApostado === numeroGanador
		]).when(ruleta).apuestaGanadora(any(Apuesta))
		return ruleta
	}
}
```

Fíjense que

- el método void que elige el número no hace nada
- se "decora" la respuesta recibida tomando como parámetro la apuesta recibida en la invocación al método `apuestaGanadora`

Configuramos en el test la ruleta:

```xtend
		casino = new Casino() => [
			ruleta = mockearRuleta(apuestaGanadora.numeroApostado)
			apostar(apuestaGanadora)
```

Y nuestro test sigue siendo predecible: la apuesta ganadora siempre es ganadora y la perdedora siempre es perdedora y cada vez que ejecutemos los tests siempre tendremos la misma respuesta. 

## Tests de estado

El test no cambia, sigue siendo un test de estado:

```xtend
def void apuestaGanadora() {
	val ganadoras = casino.realizarRondaApuestasRuleta()

	assertTrue(ganadoras.contains(apuestaGanadora))
	assertFalse(ganadoras.contains(apuestaPerdedora))
}
```

