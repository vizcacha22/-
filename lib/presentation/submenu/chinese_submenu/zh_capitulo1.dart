import 'package:flutter/material.dart';

class ZhCapitulo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capitulo 1'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'No todo es motivación',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              subtitle: Text(
                'Pese a que la motivación es esencial para poder empezar algo, esta misma no nos va a acompañar durante todo el proceso de aprendizaje; por ello es esencial que mientras tengamos esos animos mantengamos una rutina puesto que solo asi podemos forjar la disciplina. La disciplina va a ser tu mejor aliado al aprender idiomas ya que solo el estudio constante nos permitira en consquistar este idioma tan complicado pero a su vez tan exquisito',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
