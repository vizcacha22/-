import 'package:flutter/material.dart';

class NhCapitulo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capitulo 2'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'La escritura japonesa',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              subtitle: Text(
                'El primer paso que debes hacer para aprender japonés, es aprender su escritura. Existen tres tipos: Hiragana, Katakana y Kanji.\n\nLa forma en como vas a aprender estas formas de escritura es el romaji, que es la forma romana en como se leen estos caracteres. Por ejemplo, "arigatou" que es gracias es el romaji de "ありがとう" el cual está escrito en hiragana.\n\nSi quieres saber por qué tantas formas de escribir japonés, te daré una breve explicación de como se usa cada uno.\n\nEn primer lugar tenemos al hiragana, este silabario se usa para las palabras de mismo origen japonés, ya viste un ejemplo con "ありがとう".\n\nEl segundo silabario es el katakana, este se utiliza para la inclusión de palabras extranjeras en el japonés, ejemplos serían:\n\n    "パン" en romaji "pan" que bueno, significa pan.\n\n    "テーブル" en romaji "teeburu" que significa mesa y proviene de "table" en inglés.\n\nEn tercer lugar tenemos a los temidos kanjis, estos son caracteres chinos adoptados por los japoneses para "simplificar" la escritura, digo simplificar porque los kanjis nos permiten identificar palabras en un texto, ten en cuenta que cuando se escribe en japonés no hay espacios, por lo cual se vuelve un poco complicado si todo estuviera en hiragana. Por ejemplo:\n\n    あしたはあめがふるだろう es un poco más complicado de leer que...\n    明日は雨が降るだろう el cual usa kanjis que nos permite diferenciar ciertas palabras. Por cierto, este ejemplo se lee "ashita wa ame ga furudarou" que significa mañana lloverá.\n\nLos kanjis los aprenderás a la vez que aprendes vocabulario, pienso que es la mejor forma de aprenderlos ya que el significado de un kanji puede variar según el hiragana que le acompañe y el aprender palabras no solo te ayudará a leer kanjis, sino también a acelerar un poco el proceso de aprendizaje en el idioma.\n\nSobre nuestras herramientas:\nSaliendo de este apartado y deslizando a la derecha puedes encontrar los silabarios que estarás aprendiendo primero, el Hiragana y Katakana, te recomiendo que te tomes 2 semanas o lo que necesites para aprenderlos de al revés al derecho tanto leerlos como escribirlos (lo de la escritura lo dejo en tu espíritu investigador), ya que los verás a lo largo del camino para entender el Japonés. Si deslizas un poco más a la derecha verás la sección de vocabulario, donde, para que no sea tan aburrida la forma en como vas a aprender a leer los silabarios, creamos un test para escribirlos según una palabra real, si aciertas, se te muestra como se escribe en kanji y su significado. Sin más que decir en este capítulo, diviértete aprendiendo :)',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
