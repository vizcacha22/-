import 'package:flutter/material.dart';

class NhCapitulo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capitulo 3'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Un poquito de palabras',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              subtitle: Text(
                'Bueno, se viene lo bueno diría yo, suponiendo que puedes leer hiragana y katakana (y con fe también puedes escribirlos) podemos pasar a aprender reglas gramaticales y vocabulario. Lo recomendable es que estudies ambos al mismo tiempo y si tienes tiempo vayas sumergiendote en el idioma consumiendo media en japonés, en youtube puedes encontrar varios canales interesante si buscas "input compresible japonés"\n\nSi te fijas en la sección de vocabulario, hemos clasificado todo en niveles, desde el más básico "N5" hasta el más dificil "N1".',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
