import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Flashcard {
  final String front;
  final String? back;
  final String sound;
  bool showFront;

  Flashcard({
    required this.front,
    this.back,
    required this.sound,
    this.showFront = true,
  });
}

class FlashcardScreenCN extends StatefulWidget {
  const FlashcardScreenCN({Key? key}) : super(key: key);

  @override
  FlashcardScreenState createState() => FlashcardScreenState();
}

class FlashcardScreenState extends State<FlashcardScreenCN> {
  late List<Flashcard> _vowelFlashcards;
  final AudioPlayer _audioPlayer = AudioPlayer();
  String _currentCategory = 'Vocales';

  @override
  void initState() {
    super.initState();
    _vowelFlashcards = _generateVowelFlashcards();
  }

  List<Flashcard> _generateVowelFlashcards() {
    return [
      Flashcard(front: 'ā', sound: 'sounds/a1.mp3'),
      Flashcard(front: 'á', sound: 'sounds/a2.mp3'),
      Flashcard(front: 'ǎ', sound: 'sounds/a3.mp3'),
      Flashcard(front: 'à', sound: 'sounds/a4.mp3'),
      Flashcard(front: 'ē', sound: 'sounds/e1.mp3'),
      Flashcard(front: 'é', sound: 'sounds/e2.mp3'),
      Flashcard(front: 'ě', sound: 'sounds/e3.mp3'),
      Flashcard(front: 'è', sound: 'sounds/e4.mp3'),
      Flashcard(front: 'ī', sound: 'sounds/i1.mp3'),
      Flashcard(front: 'í', sound: 'sounds/i2.mp3'),
      Flashcard(front: 'ǐ', sound: 'sounds/i3.mp3'),
      Flashcard(front: 'ì', sound: 'sounds/i4.mp3'),
      Flashcard(front: 'ō', sound: 'sounds/o1.mp3'),
      Flashcard(front: 'ó', sound: 'sounds/o2.mp3'),
      Flashcard(front: 'ǒ', sound: 'sounds/o3.mp3'),
      Flashcard(front: 'ò', sound: 'sounds/o4.mp3'),
      Flashcard(front: 'ū', sound: 'sounds/u1.mp3'),
      Flashcard(front: 'ú', sound: 'sounds/u2.mp3'),
      Flashcard(front: 'ǔ', sound: 'sounds/u3.mp3'),
      Flashcard(front: 'ù', sound: 'sounds/u4.mp3'),
      Flashcard(front: 'ǖ', sound: 'sounds/u1.mp3'),
      Flashcard(front: 'ǘ', sound: 'sounds/u2.mp3'),
      Flashcard(front: 'ǚ', sound: 'sounds/u3.mp3'),
      Flashcard(front: 'ǜ', sound: 'sounds/u4.mp3'),
    ];
  }

  void _playSound(String soundPath) async {
    await _audioPlayer.play(AssetSource(soundPath));
    print(soundPath);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    List<Flashcard> _flashcards;

    _flashcards = _vowelFlashcards;

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentCategory),
        backgroundColor: Colors.red.shade700, // Color de fondo de la barra de navegación
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.red.shade900], // Gradiente de fondo oscuro
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: _buildFlashcardColumns(
              _flashcards,
              ['A', 'E', 'I', 'O', 'U', 'Ü'],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFlashcardColumns(
      List<Flashcard> flashcards,
      List<String> headers,
      ) {
    List<Widget> columns = [];
    int index = 0;
    for (String header in headers) {
      List<Widget> columnContent = [
        Text(
          header,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), // Estilo del título de la columna
        ),
        Divider(color: Colors.white), // Separador blanco entre el título y las tarjetas
      ];
      for (int i = 0; i < 4 && index < flashcards.length; i++) {
        final currentIndex = index;
        columnContent.add(
          GestureDetector(
            child: Card(
              elevation: 4.0,
              color: Colors.grey.shade800, // Color de fondo de la tarjeta
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  flashcards[currentIndex].showFront
                      ? flashcards[currentIndex].front
                      : flashcards[currentIndex].back ?? '',
                  style: TextStyle(fontSize: 30, color: Colors.white), // Estilo del texto dentro de la tarjeta
                ),
              ),
            ),
            onTap: () {
              print(currentIndex);
              _playSound(flashcards[currentIndex].sound);
            },
          ),
        );
        index++;
      }

      columns.add(
        Expanded(
          child: Column(
            children: columnContent,
          ),
        ),
      );
    }

    return columns;
  }
}
