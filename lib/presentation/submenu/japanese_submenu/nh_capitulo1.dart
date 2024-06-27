import 'package:flutter/material.dart';

class NhCapitulo1 extends StatelessWidget {
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
              'Sudor y lágrimas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              subtitle: Text(
                'Si piensas que esta app te dará todo a la mano y mágicamente te implantará el japonés en tu mente, entonces esto no es para ti. El aprendizaje de un idioma, en especial de uno con una escritura completamente diferente como el Japonés toma tiempo y disciplina.\nAhora sí, te propongo que te programes sesiones cortas (1 hora o incluso 30 minutos) y que practiques diario o interdiario. Si bien esto puede parecer poco y quizás estés altamente motivado para empezar con sesiones de 4 horas, no lo recomiendo. Lo que queremos es que el aprendizaje se vuelva un hábito y lo hagas aún si estás sin ganas. Esto es un camino largo, te tomará tiempo poder leer, escribir, escuchar y hablar japonés perfectamente pero te aseguro que todo valdrá la pena :).',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
