import 'package:flutter/material.dart';

class Flashcard {
  final String front;
  final String back;
  bool showFront;

  Flashcard({
    required this.front,
    required this.back,
    this.showFront = true,
  });
}

class FlashcardScreenJP extends StatefulWidget {
  const FlashcardScreenJP({Key? key}) : super(key: key);

  @override
  FlashcardScreenState createState() => FlashcardScreenState();
}

class FlashcardScreenState extends State<FlashcardScreenJP> {
  bool _isHiragana = true; // Initial mode is Hiragana
  late List<Flashcard> _flashcards;

  @override
  void initState() {
    super.initState();
    _flashcards = _generateFlashcards();
  }

  List<Flashcard> _generateFlashcards() {
    return _isHiragana
        ? [
      Flashcard(front: 'あ', back: 'a'),
      Flashcard(front: 'い', back: 'i'),
      Flashcard(front: 'う', back: 'u'),
      Flashcard(front: 'え', back: 'e'),
      Flashcard(front: 'お', back: 'o'),
      Flashcard(front: 'か', back: 'ka'),
      Flashcard(front: 'き', back: 'ki'),
      Flashcard(front: 'く', back: 'ku'),
      Flashcard(front: 'け', back: 'ke'),
      Flashcard(front: 'こ', back: 'ko'),
      Flashcard(front: 'さ', back: 'sa'),
      Flashcard(front: 'し', back: 'shi'),
      Flashcard(front: 'す', back: 'su'),
      Flashcard(front: 'せ', back: 'se'),
      Flashcard(front: 'そ', back: 'so'),
      Flashcard(front: 'た', back: 'ta'),
      Flashcard(front: 'ち', back: 'chi'),
      Flashcard(front: 'つ', back: 'tsu'),
      Flashcard(front: 'て', back: 'te'),
      Flashcard(front: 'と', back: 'to'),
      Flashcard(front: 'な', back: 'na'),
      Flashcard(front: 'に', back: 'ni'),
      Flashcard(front: 'ぬ', back: 'nu'),
      Flashcard(front: 'ね', back: 'ne'),
      Flashcard(front: 'の', back: 'no'),
      Flashcard(front: 'は', back: 'ha'),
      Flashcard(front: 'ひ', back: 'hi'),
      Flashcard(front: 'ふ', back: 'fu'),
      Flashcard(front: 'へ', back: 'he'),
      Flashcard(front: 'ほ', back: 'ho'),
      Flashcard(front: 'ま', back: 'ma'),
      Flashcard(front: 'み', back: 'mi'),
      Flashcard(front: 'む', back: 'mu'),
      Flashcard(front: 'め', back: 'me'),
      Flashcard(front: 'も', back: 'mo'),
      Flashcard(front: 'や', back: 'ya'),
      Flashcard(front: 'ゆ', back: 'yu'),
      Flashcard(front: 'よ', back: 'yo'),
      Flashcard(front: 'ら', back: 'ra'),
      Flashcard(front: 'り', back: 'ri'),
      Flashcard(front: 'る', back: 'ru'),
      Flashcard(front: 'れ', back: 're'),
      Flashcard(front: 'ろ', back: 'ro'),
      Flashcard(front: 'わ', back: 'wa'),
      Flashcard(front: 'を', back: 'wo'),
      Flashcard(front: 'ん', back: 'n'),
    ]
        : [
      Flashcard(front: 'ア', back: 'a'),
      Flashcard(front: 'イ', back: 'i'),
      Flashcard(front: 'ウ', back: 'u'),
      Flashcard(front: 'エ', back: 'e'),
      Flashcard(front: 'オ', back: 'o'),
      Flashcard(front: 'カ', back: 'ka'),
      Flashcard(front: 'キ', back: 'ki'),
      Flashcard(front: 'ク', back: 'ku'),
      Flashcard(front: 'ケ', back: 'ke'),
      Flashcard(front: 'コ', back: 'ko'),
      Flashcard(front: 'サ', back: 'sa'),
      Flashcard(front: 'シ', back: 'shi'),
      Flashcard(front: 'ス', back: 'su'),
      Flashcard(front: 'セ', back: 'se'),
      Flashcard(front: 'ソ', back: 'so'),
      Flashcard(front: 'タ', back: 'ta'),
      Flashcard(front: 'チ', back: 'chi'),
      Flashcard(front: 'ツ', back: 'tsu'),
      Flashcard(front: 'テ', back: 'te'),
      Flashcard(front: 'ト', back: 'to'),
      Flashcard(front: 'ナ', back: 'na'),
      Flashcard(front: 'ニ', back: 'ni'),
      Flashcard(front: 'ヌ', back: 'nu'),
      Flashcard(front: 'ネ', back: 'ne'),
      Flashcard(front: 'ノ', back: 'no'),
      Flashcard(front: 'ハ', back: 'ha'),
      Flashcard(front: 'ヒ', back: 'hi'),
      Flashcard(front: 'フ', back: 'fu'),
      Flashcard(front: 'ヘ', back: 'he'),
      Flashcard(front: 'ホ', back: 'ho'),
      Flashcard(front: 'マ', back: 'ma'),
      Flashcard(front: 'ミ', back: 'mi'),
      Flashcard(front: 'ム', back: 'mu'),
      Flashcard(front: 'メ', back: 'me'),
      Flashcard(front: 'モ', back: 'mo'),
      Flashcard(front: 'ヤ', back: 'ya'),
      Flashcard(front: 'ユ', back: 'yu'),
      Flashcard(front: 'ヨ', back: 'yo'),
      Flashcard(front: 'ラ', back: 'ra'),
      Flashcard(front: 'リ', back: 'ri'),
      Flashcard(front: 'ル', back: 'ru'),
      Flashcard(front: 'レ', back: 're'),
      Flashcard(front: 'ロ', back: 'ro'),
      Flashcard(front: 'ワ', back: 'wa'),
      Flashcard(front: 'ヲ', back: 'wo'),
      Flashcard(front: 'ン', back: 'n'),
    ];
  }

  void _flipFlashcard(int index) {
    setState(() {
      _flashcards[index].showFront = !_flashcards[index].showFront;
    });
  }

  void _toggleMode() {
    setState(() {
      _isHiragana = !_isHiragana;
      _flashcards = _generateFlashcards();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isHiragana ? 'Hiragana' : 'Katakana',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.compare_arrows, color: Colors.white),
            onPressed: _toggleMode,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // Number of columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: _flashcards.length,
          itemBuilder: (context, index) {
            final flashcard = _flashcards[index];
            return GestureDetector(
              onTap: () => _flipFlashcard(index),
              child: Card(
                color: Colors.grey[850], // Darker card background
                elevation: 4.0,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    flashcard.showFront ? flashcard.front : flashcard.back,
                    style: TextStyle(
                      fontSize: 30,
                      color: flashcard.showFront ? Colors.white : Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
