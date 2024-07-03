import 'dart:math';
import 'package:flutter/material.dart';
import 'package:LongLaoshi/presentation/vocabulary/vocabulary_zh/vocabulary_chinese.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define el tema global aquí
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white, // Color del cursor
        ),
      ),
      home: HanziTestScreenZH(
        flashcards: [], // Aquí deberías pasar tus flashcards
      ),
    );
  }
}

class HanziTestScreenZH extends StatefulWidget {
  final List<Flashcard> flashcards;

  const HanziTestScreenZH({Key? key, required this.flashcards})
      : super(key: key);

  @override
  _HanziTestScreenZHState createState() => _HanziTestScreenZHState();
}

class _HanziTestScreenZHState extends State<HanziTestScreenZH> {
  late Flashcard _currentFlashcard;
  final TextEditingController _controller = TextEditingController();
  bool _isCorrect = false;
  final Random _random = Random();
  int _questionCounter = 0;
  final int _maxQuestions = 30;

  @override
  void initState() {
    super.initState();
    _generateRandomFlashcard();
  }

  void _generateRandomFlashcard() {
    if (_questionCounter >= _maxQuestions) {
      _showCompletionDialog();
      return;
    }
    final randomIndex = _random.nextInt(widget.flashcards.length);
    setState(() {
      _currentFlashcard = widget.flashcards[randomIndex];
      _isCorrect = false;
      _controller.clear();
      _questionCounter++;
    });
  }

  void _checkAnswer() {
    setState(() {
      _isCorrect = _controller.text.trim().toLowerCase() ==
          _currentFlashcard.pinyin.toLowerCase();
    });

    if (_isCorrect) {
      Future.delayed(Duration(seconds: 2), _generateRandomFlashcard);
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Prueba completada"),
          content: Text("Has completado las 30 preguntas."),
          actions: [
            TextButton(
              child: Text("  Aceptar  "),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba de Hanzi'),
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
              'Pregunta $_questionCounter de $_maxQuestions',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              _currentFlashcard.hanzi,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
            SizedBox(height: 16),
            if (_isCorrect) ...[
              Text(
                _currentFlashcard.pinyin,
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
                  hintText: 'Escribe el pinyin',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade400),
                  ),
                ),
                onSubmitted: (_) => _checkAnswer(),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _checkAnswer,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red.shade400, // Color del texto
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0), // Espaciado interno
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Borde redondeado
                  ),
                ),
                child: Text(
                  '  Verificar  ',
                  style: TextStyle(fontSize: 20),
                ),
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
