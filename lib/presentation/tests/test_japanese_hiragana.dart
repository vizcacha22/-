import 'dart:math';
import 'package:flutter/material.dart';
import 'package:LongLaoshi/presentation/flashcards/vocabulary_japanese.dart';

class VocabularyTestScreenJP extends StatefulWidget {
  final List<Flashcard> flashcards;

  const VocabularyTestScreenJP({Key? key, required this.flashcards})
      : super(key: key);

  @override
  _VocabularyTestScreenJPState createState() => _VocabularyTestScreenJPState();
}

class _VocabularyTestScreenJPState extends State<VocabularyTestScreenJP> {
  late Flashcard _currentFlashcard;
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;

  @override
  void initState() {
    super.initState();
    _generateRandomFlashcard();
  }

  void _generateRandomFlashcard() {
    final random = Random();
    setState(() {
      _currentFlashcard =
          widget.flashcards[random.nextInt(widget.flashcards.length)];
      _isCorrect = false;
      _controller.clear();
    });
  }

  void _checkAnswer() {
    setState(() {
      _isCorrect = _controller.text.trim().toLowerCase() ==
          _currentFlashcard.romaji.toLowerCase();
    });

    if (_isCorrect) {
      Future.delayed(Duration(seconds: 4), _generateRandomFlashcard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba de Hiragana y Katakana'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        width: double.infinity, // Ocupa todo el ancho disponible
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _currentFlashcard.hiragana,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
            SizedBox(height: 16),
            if (_isCorrect) ...[
              Text(
                _currentFlashcard.kanji,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                _currentFlashcard.meaning,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 16),
            ] else ...[
              TextField(
                controller: _controller,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Escribe el romaji',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigoAccent),
                  ),
                ),
                onSubmitted: (_) => _checkAnswer(),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _checkAnswer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                ),
                child: Text('Verificar'),
              ),
              SizedBox(height: 16),
              if (_controller.text.isNotEmpty && !_isCorrect)
                Text(
                  'Incorrecto. Intenta de nuevo.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, color: Colors.redAccent),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
