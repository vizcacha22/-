import 'package:flutter/material.dart';

class LearningJapaneseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Japonés',

        ),
        backgroundColor: Colors.indigoAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.indigo],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Pasos para Empezar a Aprender Japonés',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.book, color: Colors.white),
              title: Text(
                '1. Aprender Hiragana y Katakana',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Empieza con lo básico: Hiragana y Katakana, los dos alfabetos fonéticos.',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Recursos Recomendados',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.book, color: Colors.white),
              title: Text(
                'Libros de Texto',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Genki, Minna no Nihongo',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
