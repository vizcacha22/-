import 'package:flutter/material.dart';

class ZhCapitulo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capitulo 1 📚'),
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
              'No todo es motivación',
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
                'Pese a que la motivación es esencial para poder empezar algo, esta misma no nos va a acompañar durante todo el proceso de aprendizaje; por ello es esencial que mientras tengamos esos ánimos mantengamos una rutina puesto que solo así podemos forjar la disciplina. La disciplina va a ser tu mejor aliado al aprender idiomas ya que solo el estudio constante nos permitirá conquistar este idioma tan complicado pero a su vez tan exquisito.',
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

