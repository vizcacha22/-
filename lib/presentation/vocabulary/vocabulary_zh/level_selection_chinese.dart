import 'package:flutter/material.dart';

import 'vocabulary_chinese.dart';

class LevelSelectionScreenZH extends StatelessWidget {
  const LevelSelectionScreenZH({Key? key}) : super(key: key);

  void _navigateToVocabularyScreen(BuildContext context, String level) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VocabularyScreenZH(level: level),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vocabulario Chino',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red.shade700,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.red.shade900],
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
                _buildLevelButton(context, 'HSK0'),
                _buildLevelButton(context, 'HSK1'),
                _buildLevelButton(context, 'HSK2'),
                _buildLevelButton(context, 'HSK3'),
                _buildLevelButton(context, 'HSK4'),
                _buildLevelButton(context, 'HSK5'),
                _buildLevelButton(context, 'HSK6'),
                _buildLevelButton(context, 'HSK7'),
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
          child: Text(level, style: TextStyle(fontSize: 24,color: Colors.black)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade700,
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
    );
  }
}
