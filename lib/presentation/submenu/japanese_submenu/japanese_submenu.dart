import 'package:LongLaoshi/presentation/submenu/japanese_submenu/nh_capitulo1.dart';
import 'package:LongLaoshi/presentation/submenu/japanese_submenu/nh_capitulo2.dart';
import 'package:LongLaoshi/presentation/submenu/japanese_submenu/nh_capitulo3.dart';
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
        iconTheme: IconThemeData(color: Colors.black),
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
              'Guía para ser un autodidacta en el Japonés',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.book, color: Colors.white),
              title: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NhCapitulo1()),
                  );
                },
                child: Text('1. Sudor y lágrimas',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.white),
              title: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NhCapitulo2()),
                  );
                },
                child: Text('2. La escritura Japonesa',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.white),
              title: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NhCapitulo3()),
                  );
                },
                child: Text('3. Un poquito de palabras',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Recursos Recomendados',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
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
