import 'package:LongLaoshi/presentation/submenu/chinese_submenu/zh_capitulo1.dart';
import 'package:flutter/material.dart';

class LearningChineseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chino'),
        backgroundColor: Colors.red.shade700,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.redAccent.shade400], //
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'Guía para Aprender Chino 🇨🇳',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.book, color: Colors.white),
                title: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ZhCapitulo1()),
                    );
                  },
                  child: Text(
                    '1. No todo es motivación',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.language, color: Colors.white),
                title: Text(
                  '2. Vocabulario y Frases Básicas',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Aprende vocabulario y frases comunes para empezar a construir tu base de lenguaje.',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              Text(
                'Recursos Recomendados',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.book, color: Colors.white),
                title: Text(
                  'Libros de Texto',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Integrated Chinese, HSK Standard Course',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              ListTile(
                leading: Icon(Icons.web, color: Colors.white),
                title: Text(
                  'Sitios Web',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'ChineseClass101, Yoyo Chinese',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
