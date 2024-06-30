import 'package:flutter/material.dart';

class NhCapitulo6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capítulo 6'),
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
              'Uso de Partículas en Japonés',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              subtitle: Text(
                'Las partículas son elementos esenciales en el japonés que nos permiten indicar las relaciones entre palabras en una oración. En este capítulo, aprenderemos algunas de las partículas más comunes y su uso.\n\n'
                'Partículas Principales\n\n'
                '1. Partícula は (wa)\n'
                '   - Indica el tema de la oración.\n'
                '   - Ejemplo: 私は学生です。\n'
                '     (Watashi wa gakusei desu) - Yo soy estudiante.\n\n'
                '2. Partícula が (ga)\n'
                '   - Indica el sujeto de la oración.\n'
                '   - Ejemplo: 猫が好きです。\n'
                '     (Neko ga suki desu) - Me gustan los gatos.\n\n'
                '3. Partícula を (wo/o)\n'
                '   - Indica el objeto directo de la acción.\n'
                '   - Ejemplo: パンを食べます。\n'
                '     (Pan o tabemasu) - Como pan.\n\n'
                '4. Partícula に (ni)\n'
                '   - Indica dirección, lugar, tiempo, o propósito.\n'
                '   - Ejemplo: 学校に行きます。\n'
                '     (Gakkou ni ikimasu) - Voy a la escuela.\n\n'
                '5. Partícula で (de)\n'
                '   - Indica el lugar donde se realiza una acción o el medio por el cual se hace algo.\n'
                '   - Ejemplo: バスで行きます。\n'
                '     (Basu de ikimasu) - Voy en autobús.\n\n'
                'Ejemplos en Oraciones\n\n'
                '    - 私は毎日図書館で勉強します。\n'
                '      (Watashi wa mainichi toshokan de benkyou shimasu) - Estudio en la biblioteca todos los días.\n\n'
                '    - 友達が映画を見ます。\n'
                '      (Tomodachi ga eiga o mimasu) - Mi amigo ve una película.\n\n'
                '    - 彼は明日東京に行きます。\n'
                '      (Kare wa ashita Toukyou ni ikimasu) - Él va a Tokio mañana.\n\n'
                'Práctica de Partículas\n\n'
                'Intenta formar oraciones usando estas partículas para describir tus actividades diarias. Practicar su uso en contextos variados te ayudará a familiarizarte con ellas y a mejorar tu fluidez.\n\n',
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
