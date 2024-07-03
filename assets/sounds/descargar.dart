import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Flashcard {
  final String hanzi;
  final String pinyin;
  final String meaning;
  final String audioFileName;

  Flashcard({required this.hanzi, required this.pinyin, required this.meaning, required this.audioFileName});
}

void main() async {
  var flashcards = [
    Flashcard(hanzi: '爱', pinyin: 'ài', meaning: 'amar', audioFileName: '爱.mp3'),
    Flashcard(hanzi: '八', pinyin: 'bā', meaning: 'ocho', audioFileName: '八.mp3'),
    // Añade más flashcards aquí
  ];

  for (var flashcard in flashcards) {
    await downloadAudio(flashcard);
    await Future.delayed(Duration(seconds: 5)); // Espera 5 segundos entre cada solicitud
  }
}

Future<void> downloadAudio(Flashcard flashcard) async {
  try {
    final file = File('${Directory.current.path}/${flashcard.audioFileName}');
    if (await file.exists()) {
      print('Audio for ${flashcard.hanzi} already exists at ${file.path}');
      return;
    }

    final response = await http.post(
      Uri.parse('http://localhost:5000/synthesize'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'text': flashcard.hanzi}),
    );

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      await file.writeAsBytes(bytes);

      print('Audio for ${flashcard.hanzi} saved to ${file.path}');
    } else {
      print('Failed to download audio for ${flashcard.hanzi}: ${response.statusCode}');
    }
  } catch (e) {
    print('Error downloading audio for ${flashcard.hanzi}: $e');
  }
}