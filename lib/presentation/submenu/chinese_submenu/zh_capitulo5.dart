import 'package:flutter/material.dart';

class ZhCapitulo5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capitulo 5 📚'),
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
              'Gramática Básica',
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
                'Estructura de Oraciones:\n'
                '- Orden de las palabras: Sujeto + Verbo + Objeto.\n'
                '- Uso de partículas como 吗 (ma) para preguntas.\n\n'
                'Partículas y Marcadores Temporales:\n'
                '- Partículas como 了 (le), 的 (de).\n'
                '- Expresar tiempo con palabras como 今天 (jīntiān), 昨天 (zuótiān).\n\n'
                'Consejos:\n'
                '- Practicar construyendo oraciones simples.\n'
                '- Leer y analizar textos básicos en mandarín.',
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

