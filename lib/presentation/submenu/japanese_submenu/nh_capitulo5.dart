import 'package:flutter/material.dart';

class NhCapitulo5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capítulo 5'),
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
              'Conjugación de Verbos Básicos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              subtitle: Text(
                'En este capítulo, vamos a explorar la conjugación de verbos básicos en japonés. Aprenderemos las formas más comunes y cómo usarlas en oraciones. Los verbos son una parte esencial del idioma y entender sus conjugaciones te ayudará a comunicarte de manera más efectiva.\n\n'
                'Primero, hablemos de las tres formas verbales básicas que necesitas conocer:\n\n'
                '    1. Forma Masu (ます形): Esta es la forma cortés y se utiliza en situaciones formales.\n'
                '    2. Forma Diccionario (辞書形): Esta es la forma de diccionario o forma base del verbo.\n'
                '    3. Forma Te (て形): Esta forma se utiliza para conectar oraciones y formar comandos o peticiones.\n\n'
                'Ejemplos de Conjugación\n\n'
                '    - Verbo: 食べる (taberu) - Comer\n\n'
                '        - Forma Masu: 食べます (tabemasu)\n'
                '        - Forma Diccionario: 食べる (taberu)\n'
                '        - Forma Te: 食べて (tabete)\n\n'
                '    - Verbo: 行く (iku) - Ir\n\n'
                '        - Forma Masu: 行きます (ikimasu)\n'
                '        - Forma Diccionario: 行く (iku)\n'
                '        - Forma Te: 行って (itte)\n\n'
                'Usando las Formas Verbales en Oraciones\n\n'
                '    - Forma Masu: 私はパンを食べます。\n'
                '      (Watashi wa pan o tabemasu) - Yo como pan.\n\n'
                '    - Forma Diccionario: 明日、友達と映画を見に行く。\n'
                '      (Ashita, tomodachi to eiga o mi ni iku) - Mañana voy a ver una película con un amigo.\n\n'
                '    - Forma Te: ここで待ってください。\n'
                '      (Koko de matte kudasai) - Por favor, espera aquí.\n\n'
                'Recuerda, practicar las conjugaciones es clave para dominar el uso de los verbos. Intenta crear tus propias oraciones usando estas formas verbales y sigue practicando diariamente.\n\n',
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
