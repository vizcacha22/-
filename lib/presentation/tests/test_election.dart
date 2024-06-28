import 'package:flutter/material.dart';
import 'package:LongLaoshi/presentation/tests/test_japanese_hiragana.dart';
import 'package:LongLaoshi/presentation/tests/test_japanese_vocabulary.dart';
import 'package:LongLaoshi/presentation/flashcards/vocabulary_japanese.dart';

class TestSelectionScreen extends StatelessWidget {
  final List<Flashcard> flashcards;

  const TestSelectionScreen({Key? key, required this.flashcards})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Tipo de Test'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HiraganaTestScreenJP(flashcards: flashcards),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Test de Hiragana y Katakana',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VocabularyTestScreenJP(flashcards: flashcards),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Test de Vocabulario',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
