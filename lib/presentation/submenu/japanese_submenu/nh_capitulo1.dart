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
                  'Si crees que esta app te proporcionará todo de manera instantánea y mágicamente te implantará el japonés en la mente, entonces esto no es para ti. Aprender un idioma, especialmente uno con un sistema de escritura completamente diferente como el japonés, requiere tiempo y disciplina. El éxito dependerá de tu dedicación y esfuerzo.\n\nDicho esto, si estás decidido y sientes que puedes mantenerte constante durante este proceso de aprendizaje, te propongo un método simple pero efectivo. Programa sesiones cortas de estudio, de 30 minutos a 1 hora, y mantén esta rutina diariamente. Aunque pueda parecer poco y quizás estés muy motivado para empezar con sesiones de 4 horas, no lo recomiendo. Nuestro objetivo es convertir el aprendizaje en un hábito, para que lo hagas incluso en los días en los que no tengas ganas.\n\nEste es un camino largo y te tomará tiempo llegar a leer, escribir, escuchar y hablar japonés con fluidez, pero te aseguro que cada esfuerzo valdrá la pena.',
                  style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
