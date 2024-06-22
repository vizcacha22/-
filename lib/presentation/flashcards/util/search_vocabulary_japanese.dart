import 'package:flutter/material.dart';
import 'package:LongLaoshi/presentation/flashcards/vocabulary_japanese.dart';

class FlashcardSearchDelegate extends SearchDelegate<Flashcard?> {
  final List<Flashcard> flashcards;

  FlashcardSearchDelegate(this.flashcards);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Cierra la búsqueda sin seleccionar nada
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Flashcard> results = _searchFlashcards(query);

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final flashcard = results[index];
        return ListTile(
          title: Text(flashcard.kanji),
          subtitle: Text(flashcard.romaji),
          onTap: () {
            close(context, flashcard); // Devuelve el flashcard seleccionado
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Flashcard> suggestions = _searchFlashcards(query);

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final flashcard = suggestions[index];
        return ListTile(
          title: Text(flashcard.kanji),
          subtitle: Text(flashcard.romaji),
          onTap: () {
            query = flashcard.romaji;
            showResults(context);
          },
        );
      },
    );
  }

  List<Flashcard> _searchFlashcards(String query) {
    if (query.isEmpty) {
      return [];
    }

    List<Flashcard> results = [];
    int left = 0;
    int right = flashcards.length - 1;

    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (flashcards[mid].romaji.startsWith(query)) {
        // Encuentra todos los matches a la izquierda y derecha
        int start = mid;
        int end = mid;

        while (start > 0 && flashcards[start - 1].romaji.startsWith(query)) {
          start--;
        }
        while (end < flashcards.length - 1 &&
            flashcards[end + 1].romaji.startsWith(query)) {
          end++;
        }

        results = flashcards.sublist(start, end + 1);
        break;
      } else if (flashcards[mid].romaji.compareTo(query) < 0) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return results;
  }
}
