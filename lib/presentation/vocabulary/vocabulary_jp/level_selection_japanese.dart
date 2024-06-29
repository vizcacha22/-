import 'package:LongLaoshi/presentation/vocabulary/vocabulary_jp/vocabulary_japanese.dart';
import 'package:flutter/material.dart';

class LevelSelectionScreenJP extends StatelessWidget {
  const LevelSelectionScreenJP({Key? key}) : super(key: key);

  void _navigateToVocabularyScreen(BuildContext context, String level) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VocabularyScreenJP(level: level),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vocabulario Japonés',
          style: TextStyle(color: Colors.black),
        ),
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
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLevelButton(context, 'JLPT5'),
                _buildLevelButton(context, 'JLPT4'),
                _buildLevelButton(context, 'JLPT3'),
                _buildLevelButton(context, 'JLPT2'),
                _buildLevelButton(context, 'JLPT1'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLevelButton(BuildContext context, String level) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: () => _navigateToVocabularyScreen(context, level),
          child: Text(level, style: TextStyle(fontSize: 24)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigoAccent,
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }
}
