import 'package:flutter/material.dart';

class NhCapitulo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capitulo 2'),
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
              'La escritura japonesa',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 16),
            ListTile(
              subtitle: Text(
                'El primer paso para aprender japonés es familiarizarte con su escritura, que se compone de tres sistemas: Hiragana, Katakana y Kanji.\n\nPara comenzar, aprenderás estos sistemas de escritura a través del romaji, la transcripción de los caracteres japoneses usando el alfabeto romano. Por ejemplo, "arigatou" es el romaji de "ありがとう", que está escrito en hiragana y significa "gracias".\n\n¿Por qué tantas formas de escribir japonés?\nCada sistema de escritura tiene su propio propósito y uso en el idioma japonés. Aquí te explico brevemente cómo se utiliza cada uno:\n\nHiragana\nEste silabario se utiliza principalmente para palabras de origen japonés. Ya has visto un ejemplo con "ありがとう".\n\nKatakana\nEste silabario se emplea para escribir palabras extranjeras que se han incorporado al japonés. Algunos ejemplos son:\n\n"パン" (pan), que significa "pan".\n\n"テーブル" (teeburu), que significa "mesa" y proviene de la palabra inglesa "table".\n\nKanji\nLos kanjis son caracteres chinos adoptados por los japoneses para "simplificar" la escritura. Aunque puede parecer contradictorio, los kanjis facilitan la lectura al permitir que los lectores identifiquen palabras en un texto, ya que en japonés no hay espacios entre las palabras. Por ejemplo:\n\n"あしたはあめがふるだろう" es más difícil de leer que...\n"明日は雨が降るだろう", donde los kanjis ayudan a diferenciar las palabras. Este ejemplo se lee "ashita wa ame ga furudarou" y significa "mañana lloverá".\n\nAprenderás los kanjis junto con el vocabulario, ya que el significado de un kanji puede variar según el hiragana que lo acompañe. Aprender palabras completas te ayudará no solo a leer kanjis, sino también a acelerar tu proceso de aprendizaje del idioma.\n\nSobre nuestras herramientas:\nEn nuestra plataforma, encontrarás recursos para aprender los silabarios Hiragana y Katakana. Te recomiendo dedicar aproximadamente dos semanas, o el tiempo que necesites, para aprenderlos a fondo, tanto en lectura como en escritura. Si bien la práctica de la escritura la dejo a tu curiosidad y espíritu investigador, es esencial que te sientas cómodo con estos silabarios, ya que los verás frecuentemente.\n\nDeslizando un poco más a la derecha, encontrarás la sección de vocabulario. Para hacer el aprendizaje más entretenido, hemos creado un test donde puedes practicar la escritura de palabras reales usando los silabarios. Si aciertas, verás cómo se escribe en kanji y su significado.\n\nSin más que agregar, te deseo mucha diversión en este emocionante viaje de aprender japonés. ¡Ánimo y disfruta del proceso!',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
