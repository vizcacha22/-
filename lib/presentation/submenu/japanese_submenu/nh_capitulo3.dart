import 'package:flutter/material.dart';

class NhCapitulo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capítulo 3'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.indigo],
            stops: [0.3, 0.7], // Ajusta los stops según sea necesario
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Un poquito de palabras',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              subtitle: Text(
                '¡Ahora empieza lo emocionante! Suponiendo que ya puedes leer hiragana y katakana (y con un poco de suerte, también escribirlos), podemos avanzar a aprender reglas gramaticales y vocabulario. '
                'Es recomendable estudiar ambos simultáneamente y, si tienes tiempo, sumergirte en el idioma consumiendo medios en japonés. En YouTube, puedes encontrar varios canales interesantes buscando "input comprensible japonés".\n\n'
                'En la sección de vocabulario, hemos clasificado todo en niveles, desde el más básico "N5" hasta el más difícil "N1".',
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
