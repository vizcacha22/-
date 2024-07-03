import 'package:flutter/material.dart';

class ZhCapitulo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capitulo 2 📚'),
        backgroundColor: Colors.red.shade700,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black , Colors.deepOrange.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Introducción al Chino Mandarín',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
  tileColor: Colors.deepOrange.shade700.withOpacity(0.5),
  subtitle: Text(
    'Comprender el Mandarín:\n'
    '- Diferencias entre el mandarín y otros dialectos chinos.\n'
    '- Importancia del mandarín en China y el mundo.\n\n'
    'Sistema de Escritura:\n'
    '- Caracteres chinos: ideogramas vs alfabeto.\n'
    '- Simplificados vs tradicionales.\n\n'
    'Pinyin:\n'
    '- Introducción al sistema Pinyin (transcripción fonética).\n'
    '- Las iniciales, finales y tonos en Pinyin.\n\n'
    'Tonos:\n'
    '- Explicación de los cuatro tonos principales y el tono neutro.\n'
    '- Ejemplos y práctica de pronunciación.\n\n'
    'Consejos:\n'
    '- Dedica tiempo diario a la práctica de tonos y Pinyin.\n'
    '- Usa aplicaciones como Pleco o Anki para repasar caracteres y palabras.',
    style: TextStyle(
      fontSize: 16,
      color: Colors.white70,
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}

