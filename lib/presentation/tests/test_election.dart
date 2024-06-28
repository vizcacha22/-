import 'package:LongLaoshi/presentation/tests/test_japanese_hiragana.dart';
import 'package:LongLaoshi/presentation/tests/test_japanese_vocabulary.dart';
import 'package:flutter/material.dart';
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
      body: Center(
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
              child: Text('Test de Hiragana y Katakana'),
            ),
            SizedBox(height: 16),
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
              child: Text('Test de Vocabulario'),
            ),
          ],
        ),
      ),
    );
  }
}
