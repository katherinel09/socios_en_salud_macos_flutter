import 'package:flutter/material.dart';
// import 'package:flutter_youtube_view/flutter_youtube_view.dart';

class Ejercicios {
  final String name;
  final String setsAndReps;

  Ejercicios({required this.name, required this.setsAndReps});
}

class EjercicioPagina extends StatelessWidget {
  EjercicioPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Page'),
      ),
      body: SingleChildScrollView(
        // Wrap the content with SingleChildScrollView
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Make containers full width
          children: [
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Day 1 Exercises'),
                  const Text('Description of exercises for Day 1'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Add navigation to the YouTube video for Day 1
                    },
                    child: const Text('Watch Day 1 Video'),
                  ),
                  const SizedBox(height: 16),
                  // Insert data from cells
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ejerciciosVerdes.length,
                    itemBuilder: (context, index) {
                      final exerciseName = ejerciciosVerdes[index].name;
                      final termsToBold = [
                        'EJERCICIOS RESPIRATORIOS',
                        'EJERCICIOS DE COORDINACIÓN Y EQUILIBRIO',
                        'EJERCICIOS DE FORTALECIMIENTO',
                        'EJERCICIOS DE CALENTAMIENTO Y AERÓBICOS',
                        'EJERCICIOS DE FLEXIBILIZACIÓN',
                      ];

                      List<TextSpan> textSpans = [];

                      // cells.add(
                      // Expanded(
                      //   flex: 3,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       border: Border.all(width: 1.0), // Add a border
                      //     ),
                      //     child: Text(
                      //       term,
                      //       style: TextStyle(fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // ),

                      for (final term in exerciseName.split(',')) {
                        if (termsToBold.contains(term)) {
                          textSpans.add(TextSpan(
                            text: term,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ));
                        } else {
                          textSpans.add(TextSpan(
                            text: term,
                            style: DefaultTextStyle.of(context)
                                .style, // Maintain the default style
                          ));
                        }
                      }

                      return Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: RichText(
                              text: TextSpan(children: textSpans),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(ejerciciosVerdes[index].setsAndReps),
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
            Container(
              color: Colors.orange,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Day 2 Exercises'),
                  const Text('Description of exercises for Day 2'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Add navigation to the YouTube video for Day 2
                    },
                    child: const Text('Watch Day 2 Video'),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ejerciciosAnaranjados.length,
                    itemBuilder: (context, index) {
                      //VARIACION DE EJERCICIOS EN CASA SESION
                      final exerciseName = ejerciciosAnaranjados[index].name;
                      final termsToBold = [
                        'EJERCICIOS DE ENFRIAMIENTO',
                        'VARIACION DE EJERCICIOS EN CASA SESION',
                      ];

                      List<TextSpan> textSpans = [];

                      for (final term in exerciseName.split(',')) {
                        if (termsToBold.contains(term)) {
                          textSpans.add(TextSpan(
                            text: term,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ));
                        } else {
                          textSpans.add(TextSpan(
                            text: term,
                            style: DefaultTextStyle.of(context)
                                .style, // Maintain the default style
                          ));
                        }
                      }

                      return Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: RichText(
                              text: TextSpan(children: textSpans),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(ejerciciosVerdes[index].setsAndReps),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.lightBlue,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Day 3 Exercises'),
                  const Text('Description of exercises for Day 3'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Add navigation to the YouTube video for Day 3
                    },
                    child: const Text('Watch Day 3 Video'),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ejerciciosAzules.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(ejerciciosAzules[index].name),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(ejerciciosAzules[index].setsAndReps),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* Green list */
  final List<Ejercicios> ejerciciosVerdes = [
    Ejercicios(name: 'EJERCICIOS RESPIRATORIOS', setsAndReps: 'SERIES'),
    Ejercicios(
        name:
            '1. Sentado, mano en el abdomen, tomar el aire por la nariz, inflando el abdomen',
        setsAndReps: '3 series de 5'),
    Ejercicios(
        name:
            '2. Sentado manos sueltas al lado, tomar aire, realizando movimientos circulares con el hombro',
        setsAndReps: '3 series de 5'),
    Ejercicios(name: 'EJERCICIOS DE FLEXIBILIZACIÓN', setsAndReps: 'SERIES'),
    Ejercicios(
        name:
            '1. Sentado, manos a los costados, levantar un brazo con codo recto hacia arriba tratando de tocar el techo, bajar el brazo y cambiar con brazo contrario',
        setsAndReps: '3 series de 10'),
    Ejercicios(
        name:
            '2. Sentado, brazos al lado, llevar el brazo en abducción hacia afuera y arriba, bajar luego y cambiar con el brazo contrario',
        setsAndReps: '3 series de 10'),
    Ejercicios(
        name:
            '3. Sentado, piernas en 90º, estiramos una pierna con el pie en dorsiflexión, regresamos a su sitio, cambiamos la otra',
        setsAndReps: '3 series de 10'),
    Ejercicios(
        name: 'EJERCICIOS DE CALENTAMIENTO Y AERÓBICOS', setsAndReps: 'SERIES'),
    Ejercicios(
        name:
            '4. De pie, con una vara (palo) o las manos entrelazadas, llevamos los brazos hacia arriba con los codos estirados',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '5. De pie ligeramente abierto, abrimos y cerramos los brazos con los codos estirados',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '6. De pie ligeramente abiertos, llevamos el brazo de la pierna derecha al lado contrario en forma diagonal, luego hacemos lo mismo con el brazo contrario',
        setsAndReps: 'Cada lado 3 series de 10 a 15'),
    Ejercicios(
        name:
            '7. De pie, con las manos planas, llevamos una rodilla hacia arriba realizando flexion de cadera',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '8. De pie llevamos un pie hacia adelante luego cambiamos con el otro pie',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '9. De pie llevamos un pie hacia un lado (lateral) luego cambiamos con el otro pie',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '10. De pie llevamos la pierna hacia arriba y alternamos con el pide contrario',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(name: 'EJERCICIOS DE FORTALECIMIENTO', setsAndReps: 'SERIES'),
    Ejercicios(
        name:
            '11. De pie o sentado, con una botella de agua(arena) o pesas de ½ kilo o 1 kilo. Realizamos flexión de brazos',
        setsAndReps: '3 series de 10'),
    Ejercicios(
        name:
            '12. De pie o sentado colocamos los brazos en abducción de 90ª y codos en 90ª, y llevamos los brazos hacia arriba, puede ser sin peso o con peso',
        setsAndReps: '3 series de 10'),
    Ejercicios(
        name:
            '13. De pie o sentado, colocamos lo brazos en flexión de hombros de 90 grados, abríamos y cerramos los brazos con peso si sin peso',
        setsAndReps: '3 series de 10'),
    Ejercicios(
        name:
            '14. Sentado realizamos estiramiento de pierna con dorsiflexión de pide manteniendo 10 segundos, luego cambiamos a otro',
        setsAndReps: '3 series de 10'),
    Ejercicios(
        name:
            '15. De pie, realizamos sentadillas con ligera flexión de caderas',
        setsAndReps: '3 series de 10'),
    Ejercicios(
        name: 'EJERCICIOS DE COORDINACIÓN Y EQUILIBRIO', setsAndReps: 'SERIES'),
    Ejercicios(
        name:
            '16. De pie llevamos un pie un brazo hacia adelante (puede ser sin peso o con pesa)',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '17. De pie llevamos un pie hacia atrás con los brazos hacia arriba (puede ser con o sin peso)',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '18. De pide realizamos flexiones de rodilla llevando los pies hacia atrás y las manos tratando de que toque los pies',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '19. De pie realiza flexión de cadera con rodilla hacia arriba, realizando una ligera sentadilla',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name: '20. Realiza trote en nuestro lugar por lo menos 2 a 3 minutos',
        setsAndReps: '3 series de 10 a 15'),
  ];

  /* Orange list */
  final List<Ejercicios> ejerciciosAnaranjados = [
    Ejercicios(name: 'EJERCICIOS DE ENFRIAMIENTO', setsAndReps: 'SERIES'),
    Ejercicios(
        name:
            '21. De pie tomamos el aire llevando los brazos en forma circular',
        setsAndReps: '3 series de 5'),
    Ejercicios(
        name:
            '22. De pie llevamos los brazos hacia arriba con elevando la punta de pie',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '23. De pie, llevamos el tronco de un lado al otro, con apoyo de los brazos',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '24. De pie realizamos movimientos circulares de hombro de un lado al otro',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name: 'VARIACION DE EJERCICIOS EN CASA SESION', setsAndReps: 'SERIES'),
    Ejercicios(
        name:
            '25. Sentado o de pie llevamos el brazo hacia adelante con o sin pesas',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '26. Sentado o de pie, llevamos el brazo hacia arriba intercambiamos con el otro brazo, con sin pesas',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '27. Sentado realizamos flexión de cadera, llevando una rodilla hacia arriba, luego cambiando por la otra',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '28. Sentado levantamos una pierna y llevamos los brazos hacia adelante al mismo tiempo (puede ser con o sin peso)',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '29. Sentado o de pide con una pelota llevamos hacia un lado y al otro realizando rotación de tronco',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '30. De pie con un balón, llevamos los brazos hacia arriba y atrás realizando flexión de hombros con flexión de codos',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '31. De pie con un balón hacemos que el balón toque la rodilla contraria, levantando al mismo tiempo la rodilla',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '32. De pie con un balón, realizamos sentadilla llevando el balón hacia adelante',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '33. De pie o sentado con un balón hacemos que el balón pase por debajo de un pierna, luego cambiamos por la otra',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '34. De pie levantamos una pierna con brazo contario, luego intercambiamos con el otro lado',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '35. De pie, levantamos la rodilla, realizando un movimiento de forma circular, luego cambiamos con otra',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '36. De pie llevamos levantamos la pierna de forma lateral de un lado, luego del otro',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '37. De pie nos desplazamos de forma lateral de un lado abduciendo los brazos luego cambiamos hacia el otro lado',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '38. De pie entrelazamos las manos y las piernas semiflexionadas llevamos los brazos hacia arriba, luego bajamos realizando sentadilla',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '39. De pie abrimos los brazos tomando aire profundo  y luego cerramos los brazos votando el aire',
        setsAndReps: '3 series de 5'),
    Ejercicios(
        name:
            '40. De pie llevamos la mano de un lado al otro en forma diagonal, tomando y votando el aire',
        setsAndReps: '3 series de 5')
  ];

  /* Blue list */
  final List<Ejercicios> ejerciciosAzules = [
    Ejercicios(
        name:
            '41. De pie con pesas llevamos los brazos hacia atrás en forma recta',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '42. De pie con pesas abríamos y cerramos los brazos de forma lateral',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '43. De pie con pesas, juntamos las pesas, con posición inicial hacia arriba, luego flexionamos los brazos hacia atrás',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '44. De pie con pesas, levantamos un brazo, luego cambiamos por otros',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '45. De pie con pesas, juntamos las manos (pesas) y lo llevamos de un lado en forma diagonal, luego cambiamos al otro lado',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '46. De pie con vara delante, vamos hacia adelante y hacia atrás, tratando de ir lo más rápido posible',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '47. De pie con una vara del lado, vamos de un lado al otro, tratando de ir lo más rápido posible',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '48. De pie llevamos el tronco un lado y mantenemos 5 segundos, luego cambiamos hacia el otro lado',
        setsAndReps: '2 series de 10'),
    Ejercicios(
        name:
            '49. De pie con las manos entrelazadas con la palma hacia afuera, llevamos hacia arriba con los codos estirados, mantenemos 5 segundos',
        setsAndReps: '2 series de 10'),
    Ejercicios(
        name:
            '50. De pie llevamos una pierna hacia adelante flexionando la misma en 90 grados, la otra la estiramos, mantenemos 5 segundos',
        setsAndReps: '2 series de 10'),
    Ejercicios(
        name:
            '51. De pie abrimos una pierna hacia un lado flexionando y llevando de lado el peso, estiramos la pierna contraria, mantenemos 5 segundos',
        setsAndReps: '2 series de 10'),
    Ejercicios(
        name:
            '52. De pie, con las pierna entre abiertas hacia un lado, hacemos una sentadilla abduciendo las piernas, mantenemos 5 segundos',
        setsAndReps: '2 series de 10'),
    Ejercicios(
        name:
            '53. De pie colocamos 1 cono delante, realizamos un trote en forma circular, rodeando hacia adelante y hacia atrás',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '54. De pie colocamos dos conos delante, con una distancia, realizamos movimientos en lateral entre conos.',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '55. De pie con dos conos delante de nosotros, vamos hacia adelante y atrás realizando un skipping',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '56. Sentado, colocamos los brazos detrás de la nuca, levantamos una rodilla con el codo contrario, luego cambiamos con el otro',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '57. Sentado, las manos al lado cogiendo la silla, llevamos las piernas hacia arriba, realizando flexión de cadera',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '58. Sentado, nos ponemos de pie y nos volvemos a sentar, repetimos el movimiento',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '59. De pie cogemos con las manos la silla, y estiramos una pierna hacia atrás, luego cambiamos con la otra',
        setsAndReps: '3 series de 10 a 15'),
    Ejercicios(
        name:
            '60. De pie cogiéndonos de la silla, llevamos una pierna hacia atrás y el brazo contrario hacia adelante, cambiando el lado contrario',
        setsAndReps: '3 series de 10 a 15')
  ];
}
