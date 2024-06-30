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
            colors: [Colors.black, Colors.indigo],
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
                _buildLevelButton(context, 'JLPT5', 'JLPT5'),
                _buildLevelButton(context, 'JLPT4', 'JLPT4'),
                _buildLevelButton(context, 'JLPT3', 'JLPT3'),
                _buildLevelButton(context, 'JLPT2', 'JLPT2'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLevelButton(
      BuildContext context, String level, String displayText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: () => _navigateToVocabularyScreen(context, level),
          child: Text(
            displayText,
            style: TextStyle(fontSize: 24),
          ),
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 16.0),
            ),
            elevation: WidgetStateProperty.all<double>(5.0),
            // Fondo transparente para aplicar gradiente
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey; // Color cuando está deshabilitado
                }
                return Colors.white24;
              },
            ),
            // Color del texto del botón
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            // Color de overlay al presionar
            overlayColor: WidgetStateProperty.all<Color>(Colors.indigo),
          ),
        ),
      ),
    );
  }
}
