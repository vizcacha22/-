import 'package:flutter/material.dart';

class LearningJapaneseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Japonés'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Pasos para Empezar a Aprender Japonés',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('1. Aprender Hiragana y Katakana'),
              subtitle: Text(
                'Empieza con lo básico: Hiragana y Katakana, los dos alfabetos fonéticos.',
              ),
            ),
            Text(
              'Recursos Recomendados',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Libros de Texto'),
              subtitle: Text('Genki, Minna no Nihongo'),
            )
          ],
        ),
      ),
    );
  }
}
