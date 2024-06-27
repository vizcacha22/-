import 'package:LongLaoshi/presentation/submenu/chinese_submenu/zh_capitulo1.dart';
import 'package:flutter/material.dart';

class LearningChineseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chino'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Guia para Aprender Chino',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.book),
              title: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ZhCapitulo1()),
                  );
                },
                child: Text('1. No todo es motivación'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('2. Vocabulario y Frases Básicas'),
              subtitle: Text(
                'Aprende vocabulario y frases comunes para empezar a construir tu base de lenguaje.',
              ),
            ),
            Text(
              'Recursos Recomendados',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Libros de Texto'),
              subtitle: Text('Integrated Chinese, HSK Standard Course'),
            ),
            ListTile(
              leading: Icon(Icons.web),
              title: Text('Sitios Web'),
              subtitle: Text('ChineseClass101, Yoyo Chinese'),
            ),
          ],
        ),
      ),
    );
  }
}
