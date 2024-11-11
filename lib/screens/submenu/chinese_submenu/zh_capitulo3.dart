import 'package:flutter/material.dart';

class ZhCapitulo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capitulo 3 📚'),
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
              'Pronunciación y Tonos',
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
    'Práctica de Pinyin:\n'
    '- Repaso de las iniciales y finales.\n'
    '- Ejercicios de combinación de sílabas.\n\n'
    'Practicar Tonos:\n'
    '- Ejercicios de audición y repetición para cada tono.\n'
    '- Usar palabras simples para practicar tonos (ej. mā, má, mǎ, mà).\n\n'
    'Consejos:\n'
    '- Graba tu voz y compárala con hablantes nativos.\n'
    '- Usa recursos en línea como Forvo para escuchar pronunciaciones nativas.',
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

