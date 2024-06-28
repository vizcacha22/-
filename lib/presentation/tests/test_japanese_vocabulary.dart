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
  final Random _random = Random();
  bool _isCorrect = false;
  bool _showAnswer = false;
  bool _answered = false;
  late List<String> _options;

  @override
  void initState() {
    super.initState();
    _generateRandomFlashcard();
  }

  void _generateRandomFlashcard() {
    setState(() {
      _currentFlashcard =
          widget.flashcards[_random.nextInt(widget.flashcards.length)];
      _isCorrect = false;
      _showAnswer = false;
      _answered = false;
      _options = _generateOptions();
    });
  }

  List<String> _generateOptions() {
    final List<String> options = [];
    options.add(_currentFlashcard.meaning);
    while (options.length < 4) {
      final option =
          widget.flashcards[_random.nextInt(widget.flashcards.length)].meaning;
      if (!options.contains(option)) {
        options.add(option);
      }
    }
    options.shuffle(_random);
    return options;
  }

  void _checkAnswer(String selectedOption) {
    setState(() {
      _answered = true;
      _isCorrect = selectedOption == _currentFlashcard.meaning;
      _showAnswer = true;
    });

    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        _showAnswer = false;
        _answered = false;
      });
      _generateRandomFlashcard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba de vocabulario'),
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
              _currentFlashcard.kanji,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
            SizedBox(height: 16),
            if (_showAnswer) ...[
              Text(
                _isCorrect
                    ? 'Correcto: ${_currentFlashcard.hiragana} - ${_currentFlashcard.meaning}'
                    : 'Incorrecto. La respuesta correcta es: ${_currentFlashcard.hiragana} - ${_currentFlashcard.meaning}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: _isCorrect ? Colors.greenAccent : Colors.redAccent,
                ),
              ),
              SizedBox(height: 16),
            ] else ...[
              for (var option in _options) ...[
                ElevatedButton(
                  onPressed: _answered ? null : () => _checkAnswer(option),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.indigoAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 8),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
