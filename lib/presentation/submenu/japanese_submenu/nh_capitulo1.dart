import 'package:flutter/material.dart';

class NhCapitulo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capitulo 1'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.indigo],
            stops: [0.3, 0.7], // Adjust the stops as needed
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Dedicación y esfuerzo',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 16),
            ListTile(
              subtitle: Text(
                '¡Hola! Hoy quiero hablarte sobre una forma interesante de aprender un idioma, especialmente uno con un sistema de escritura completamente diferente al nuestro, como es el japonés. Nuestro equipo ha desarrollado un método que creemos que es el más efectivo para dominar un nuevo idioma. Aprender japonés requiere tiempo, disciplina y constancia, pero con el enfoque correcto, el éxito está al alcance de tu mano.\n\nPrimero, es importante entender que dominar el japonés no sucederá de la noche a la mañana. Este proceso exige dedicación y esfuerzo constante. Sin embargo, si estás comprometido y dispuesto a mantener una rutina de aprendizaje, te propongo un método simple pero poderoso.\n\nLa clave está en la regularidad y la consistencia. Te recomiendo programar sesiones cortas de estudio, de entre 30 minutos y 1 hora, todos los días. Aunque puedas sentirte motivado para empezar con maratones de estudio de 4 horas, no es lo más efectivo. Nuestro objetivo es convertir el aprendizaje en un hábito diario, de manera que incluso en los días en los que te sientas menos motivado, sigas adelante con tu estudio.\n\nEste es un camino largo, y te tomará tiempo llegar a leer, escribir, escuchar y hablar japonés con fluidez. Sin embargo, cada pequeño paso te acercará a tu meta. Recuerda que cada esfuerzo que hagas será recompensado, y cada sesión de estudio te llevará un paso más cerca de dominar este fascinante idioma.\n\nAsí que, ¿estás listo para empezar este emocionante viaje? Con perseverancia y dedicación, aprender japonés puede ser una experiencia increíblemente gratificante. ¡Vamos juntos en esta aventura!',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
