import 'package:flutter/material.dart';

class ZhCapitulo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capitulo 4 📚'),
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
              'Vocabulario Básico',
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
                'Saludos y Frases Comunes:\n'
                '- Hola, adiós, gracias, por favor.\n'
                '- ¿Cómo estás?, bien, mal.\n\n'
                'Números y Fechas:\n'
                '- Números del 1 al 100.\n'
                '- Días de la semana y meses del año.\n\n'
                'Familia y Amigos:\n'
                '- Términos para miembros de la familia.\n'
                '- Palabras para describir amigos y relaciones.\n\n'
                'Consejos:\n'
                '- Crear tarjetas de memoria para vocabulario.\n'
                '- Practicar palabras nuevas en contextos reales, como saludar a amigos.',
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

