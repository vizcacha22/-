import 'package:flutter/material.dart';

class NhCapitulo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capítulo 4'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.indigo],
            stops: [0.3, 0.7], // Adjust the stops as needed
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Introducción a la Gramática Básica',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              subtitle: Text(
                'En este capítulo, vamos a comenzar con las bases de la gramática japonesa. Aprenderemos a formar oraciones simples, la estructura básica de las frases y cómo utilizar partículas esenciales. Estos conceptos son fundamentales para construir una base sólida en tu aprendizaje del japonés.\n\n'
                'Primero, hablemos de la estructura básica de una oración en japonés. A diferencia del español, la estructura típica de una oración en japonés es Sujeto + Objeto + Verbo. Por ejemplo:\n\n'
                '    私はりんごを食べます。\n'
                '    (Watashi wa ringo o tabemasu)\n'
                '    Yo como una manzana.\n\n'
                'Observa que el verbo "tabemasu" (comer) viene al final de la oración. Además, las partículas "wa" y "o" son cruciales para entender la función de cada palabra en la oración. "Wa" marca el tema de la oración, mientras que "o" indica el objeto directo.\n\n'
                'Pasemos a algunas partículas esenciales:\n\n'
                '    - は (wa): Marca el tema de la oración.\n'
                '    - を (o): Marca el objeto directo.\n'
                '    - に (ni): Indica destino o dirección.\n'
                '    - で (de): Indica el lugar donde ocurre una acción.\n\n'
                'Ejemplos:\n\n'
                '    学校に行きます。\n'
                '    (Gakkou ni ikimasu)\n'
                '    Voy a la escuela.\n\n'
                '    レストランで食べます。\n'
                '    (Resutoran de tabemasu)\n'
                '    Como en el restaurante.\n\n'
                'Recuerda, practicar es clave. Intenta crear tus propias oraciones usando estas estructuras y partículas. Con el tiempo, te sentirás más cómodo y tu comprensión mejorará.\n\n'
                'En el próximo capítulo, profundizaremos más en verbos y sus conjugaciones. ¡Sigue adelante y diviértete aprendiendo!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
