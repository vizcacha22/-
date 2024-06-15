import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Flashcard {
  final String front;
  final String? back; // back can be null
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
  late List<Flashcard> _syllableFlashcards;
  late List<Flashcard> _fruitFlashcards;
  final AudioPlayer _audioPlayer = AudioPlayer();
  String _currentCategory = 'Vocales';

  @override
  void initState() {
    super.initState();
    _vowelFlashcards = _generateVowelFlashcards();
    _syllableFlashcards = _generateSyllableFlashcards();
    _fruitFlashcards = _generateFruitFlashcards();
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
      Flashcard(front: 'ǖ', sound: 'sounds/ü1.mp3'),
      Flashcard(front: 'ǘ', sound: 'sounds/ü2.mp3'),
      Flashcard(front: 'ǚ', sound: 'sounds/ü3.mp3'),
      Flashcard(front: 'ǜ', sound: 'sounds/ü4.mp3'),
    ];
  }

  List<Flashcard> _generateSyllableFlashcards() {
    return [
      Flashcard(front: 'bā', sound: 'sounds/ba1.mp3'),
      Flashcard(front: 'bá', sound: 'sounds/ba2.mp3'),
      Flashcard(front: 'bǎ', sound: 'sounds/ba3.mp3'),
      Flashcard(front: 'bà', sound: 'sounds/ba4.mp3'),
      Flashcard(front: 'bē', sound: 'sounds/be1.mp3'),
      Flashcard(front: 'bé', sound: 'sounds/be2.mp3'),
      Flashcard(front: 'bě', sound: 'sounds/be3.mp3'),
      Flashcard(front: 'bè', sound: 'sounds/be4.mp3'),
      Flashcard(front: 'bī', sound: 'sounds/bi1.mp3'),
      Flashcard(front: 'bí', sound: 'sounds/bi2.mp3'),
      Flashcard(front: 'bǐ', sound: 'sounds/bi3.mp3'),
      Flashcard(front: 'bì', sound: 'sounds/bi4.mp3'),
      Flashcard(front: 'bō', sound: 'sounds/bo1.mp3'),
      Flashcard(front: 'bó', sound: 'sounds/bo2.mp3'),
      Flashcard(front: 'bǒ', sound: 'sounds/bo3.mp3'),
      Flashcard(front: 'bò', sound: 'sounds/bo4.mp3'),
      Flashcard(front: 'bū', sound: 'sounds/bu1.mp3'),
      Flashcard(front: 'bú', sound: 'sounds/bu2.mp3'),
      Flashcard(front: 'bǔ', sound: 'sounds/bu3.mp3'),
      Flashcard(front: 'bù', sound: 'sounds/bu4.mp3'),
    ];
  }

  List<Flashcard> _generateFruitFlashcards() {
    return [
      Flashcard(front: 'píngguǒ', back: '苹果', sound: 'sounds/pingguo.mp3'),
      Flashcard(front: 'xiāngjiāo', back: '香蕉', sound: 'sounds/xiangjiao.mp3'),
      Flashcard(front: 'xīguā', back: '西瓜', sound: 'sounds/xigua.mp3'),
      Flashcard(front: 'cǎoméi', back: '草莓', sound: 'sounds/caomei.mp3'),
      Flashcard(front: 'chéngzi', back: '橙子', sound: 'sounds/chengzi.mp3'),
      Flashcard(front: 'míhóutáo', back: '猕猴桃', sound: 'sounds/mihoutao.mp3'),
      Flashcard(front: 'pútáo', back: '葡萄', sound: 'sounds/putao.mp3'),
    ];
  }

  void _playSound(String soundPath) {
    _audioPlayer.play(AssetSource(soundPath));
  }

  void _toggleCategory(String category) {
    setState(() {
      _currentCategory = category;
    });
  }

  void _flipFlashcard(List<Flashcard> flashcards, int index) {
    setState(() {
      flashcards[index].showFront = !flashcards[index].showFront;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  List<Widget> _buildFlashcardColumns(
      List<Flashcard> flashcards, List<String> headers) {
    List<Widget> columns = [];
    int index = 0;
    for (String header in headers) {
      List<Widget> columnContent = [
        Text(header,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Divider(),
      ];
      for (int i = 0; i < 4; i++) {
        if (index < flashcards.length) {
          columnContent.add(
            GestureDetector(
              onTap: () {
                _playSound(flashcards[index].sound);
                if (_currentCategory == 'Frutas') {
                  _flipFlashcard(flashcards, index);
                }
              },
              child: Card(
                elevation: 4.0,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    flashcards[index].showFront
                        ? flashcards[index].front
                        : flashcards[index].back ?? '',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
          );
          index++;
        }
      }
      columns.add(Expanded(
        child: Column(
          children: columnContent,
        ),
      ));
    }
    return columns;
  }

  @override
  Widget build(BuildContext context) {
    List<Flashcard> _flashcards;
    List<String> _headers;
    if (_currentCategory == 'Vocales') {
      _flashcards = _vowelFlashcards;
      _headers = ['a', 'e', 'i', 'o', 'u', 'ü'];
    } else if (_currentCategory == 'Sílabas') {
      _flashcards = _syllableFlashcards;
      _headers = ['ba', 'be', 'bi', 'bo', 'bu'];
    } else {
      _flashcards = _fruitFlashcards;
      _headers = [];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentCategory),
        backgroundColor: Colors.greenAccent,
        actions: [
          DropdownButton<String>(
            value: _currentCategory,
            items: <String>['Vocales', 'Sílabas', 'Frutas'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                _toggleCategory(newValue);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _currentCategory == 'Frutas'
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _flashcards.length,
                itemBuilder: (context, index) {
                  final flashcard = _flashcards[index];
                  return GestureDetector(
                    onTap: () {
                      _playSound(flashcard.sound);
                      _flipFlashcard(_flashcards, index);
                    },
                    child: Card(
                      elevation: 4.0,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          flashcard.showFront
                              ? flashcard.front
                              : flashcard.back ?? '',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Row(
                children: _buildFlashcardColumns(_flashcards, _headers),
              ),
      ),
    );
  }
}
