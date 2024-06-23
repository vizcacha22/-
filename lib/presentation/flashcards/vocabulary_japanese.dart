// import 'package:LongLaoshi/presentation/test/test_japanese.dart';
// import 'package:LongLaoshi/presentation/flashcards/util/search_vocabulary_japanese.dart';
import 'package:LongLaoshi/presentation/tests/test_japanese_hiragana.dart';
import 'package:flutter/material.dart';

class Flashcard {
  final String kanji;
  final String hiragana;
  final String romaji;
  final String meaning;
  bool showDetails;

  Flashcard({
    required this.kanji,
    required this.hiragana,
    required this.romaji,
    required this.meaning,
    this.showDetails = false,
  });
}

class FlashcardSearchDelegate extends SearchDelegate<Flashcard?> {
  final List<Flashcard> flashcards;
  final Function(Flashcard) onSelected;

  FlashcardSearchDelegate(this.flashcards, this.onSelected);

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
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Flashcard> results = flashcards
        .where((flashcard) =>
            flashcard.romaji.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (results.isEmpty) {
      return Center(
        child: Text(
          'No se encontraron resultados',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final flashcard = results[index];
        return ListTile(
          title: Text(flashcard.kanji),
          subtitle: Text('${flashcard.romaji} - ${flashcard.meaning}'),
          onTap: () {
            onSelected(flashcard);
            close(context, flashcard);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Flashcard> suggestions = flashcards
        .where((flashcard) =>
            flashcard.romaji.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (suggestions.isEmpty) {
      return Center(
        child: Text(
          'No se encontraron resultados',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

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
}

class VocabularyScreenJP extends StatefulWidget {
  final String level;

  const VocabularyScreenJP({Key? key, required this.level}) : super(key: key);

  @override
  VocabularyScreenState createState() => VocabularyScreenState();
}

class VocabularyScreenState extends State<VocabularyScreenJP> {
  late List<Flashcard> _flashcards;
  int? _selectedIndex;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _flashcards = _generateFlashcards();
  }

  List<Flashcard> _generateFlashcards() {
    if (widget.level == 'JLPT5') {
      return [
        Flashcard(
          kanji: '浴びる',
          hiragana: 'あびる',
          romaji: 'abiru',
          meaning: 'Bañarse, ducharse',
        ),
        Flashcard(
          kanji: '危ない',
          hiragana: 'あぶない',
          romaji: 'abunai',
          meaning: 'Peligroso, arriesgado, ¡Cuidado! - Adj い',
        ),
        Flashcard(
          kanji: 'あっち',
          hiragana: 'あっち',
          romaji: 'acchi',
          meaning: 'Ahí, allí, en esa dirección (informal)',
        ),
        Flashcard(
          kanji: 'あちら',
          hiragana: 'あちら',
          romaji: 'achira',
          meaning: 'Por allá, ahí, allí (formal)',
        ),
        Flashcard(
          kanji: '上げる',
          hiragana: 'あげる',
          romaji: 'ageru',
          meaning: 'Subir, elevar, dar, ofrecer (algo a alguien)',
        ),
        Flashcard(
          kanji: '赤',
          hiragana: 'あか',
          romaji: 'aka',
          meaning: 'Rojo',
        ),
        Flashcard(
          kanji: '赤い',
          hiragana: 'あかい',
          romaji: 'akai',
          meaning: 'Rojo - Adj い',
        ),
        Flashcard(
          kanji: '明るい',
          hiragana: 'あかるい',
          romaji: 'akarui',
          meaning: 'Brillante',
        ),
        Flashcard(
          kanji: '開ける',
          hiragana: 'あける',
          romaji: 'akeru',
          meaning: 'Abrir (algo) - Verbo transitivo',
        ),
        Flashcard(
          kanji: '秋',
          hiragana: 'あき',
          romaji: 'aki',
          meaning: 'Otoño',
        ),
        Flashcard(
          kanji: '開く',
          hiragana: 'あく',
          romaji: 'aku',
          meaning: 'Abrir(se) - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '甘い',
          hiragana: 'あまい',
          romaji: 'amai',
          meaning: 'Dulce (sabor), azucarado - Adj い',
        ),
        Flashcard(
          kanji: '飴',
          hiragana: 'あめ',
          romaji: 'ame',
          meaning: 'Caramelo, dulce (comestible)',
        ),
        Flashcard(
          kanji: '雨',
          hiragana: 'あめ',
          romaji: 'ame',
          meaning: 'Lluvia',
        ),
        Flashcard(
          kanji: 'あなた',
          hiragana: 'あなた',
          romaji: 'anata',
          meaning: 'Tú, usted',
        ),
        Flashcard(
          kanji: '姉',
          hiragana: 'あね',
          romaji: 'ane',
          meaning: 'Hermana mayor (Propio)',
        ),
        Flashcard(
          kanji: '兄',
          hiragana: 'あに',
          romaji: 'ani',
          meaning: 'Hermano mayor (Propio)',
        ),
        Flashcard(
          kanji: 'あの',
          hiragana: 'あの',
          romaji: 'ano',
          meaning: 'Ese, aquel, aquella',
        ),
        Flashcard(
          kanji: 'あのう',
          hiragana: 'あのう',
          romaji: 'anou',
          meaning: 'Bueno, ehm... uh... - expresión',
        ),
        Flashcard(
          kanji: '青',
          hiragana: 'あお',
          romaji: 'ao',
          meaning: 'Azul',
        ),
        Flashcard(
          kanji: '青い',
          hiragana: 'あおい',
          romaji: 'aoi',
          meaning: 'Azul - Adj い',
        ),
        Flashcard(
          kanji: 'アパート',
          hiragana: 'アパート',
          romaji: 'apaato',
          meaning: 'Departamento, edificio de apartamentos',
        ),
        Flashcard(
          kanji: '洗う',
          hiragana: 'あらう',
          romaji: 'arau',
          meaning: 'Lavar - Verbo',
        ),
        Flashcard(
          kanji: 'あれ',
          hiragana: 'あれ',
          romaji: 'are',
          meaning: 'Eso, aquello',
        ),
        Flashcard(
          kanji: 'ある',
          hiragana: 'ある',
          romaji: 'aru',
          meaning: 'Tener, ser (objetos inanimados) - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '歩く',
          hiragana: 'あるく',
          romaji: 'aruku',
          meaning: 'Caminar - Verbo',
        ),
        Flashcard(
          kanji: '朝',
          hiragana: 'あさ',
          romaji: 'asa',
          meaning: 'Mañana (las primeras horas)',
        ),
        Flashcard(
          kanji: '朝ごはん',
          hiragana: 'あさごはん',
          romaji: 'asagohan',
          meaning: 'Desayuno',
        ),
        Flashcard(
          kanji: '明後日',
          hiragana: 'あさって',
          romaji: 'asatte',
          meaning: 'Pasado mañana, el día después de mañana',
        ),
        Flashcard(
          kanji: '足',
          hiragana: 'あし',
          romaji: 'ashi',
          meaning: 'Pie, pata, pierna',
        ),
        Flashcard(
          kanji: '明日',
          hiragana: 'あした',
          romaji: 'ashita',
          meaning: 'Mañana (El día de mañana o el día siguiente)',
        ),
        Flashcard(
          kanji: '遊ぶ',
          hiragana: 'あそぶ',
          romaji: 'asobu',
          meaning: 'Jugar, pasar el rato, divertirse - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: 'あそこ',
          hiragana: 'あそこ',
          romaji: 'asoko',
          meaning: 'Allí, aquel lugar',
        ),
        Flashcard(
          kanji: '頭',
          hiragana: 'あたま',
          romaji: 'atama',
          meaning: 'Cabeza',
        ),
        Flashcard(
          kanji: '新しい',
          hiragana: 'あたらしい',
          romaji: 'atarashii',
          meaning: 'Nuevo - Adj い',
        ),
        Flashcard(
          kanji: '暖かい',
          hiragana: 'あたたかい',
          romaji: 'atatakai',
          meaning: 'Cálido - Adj い',
        ),
        Flashcard(
          kanji: '後',
          hiragana: 'あと',
          romaji: 'ato',
          meaning: 'Después, más tarde',
        ),
        Flashcard(
          kanji: '厚い',
          hiragana: 'あつい',
          romaji: 'atsui',
          meaning: 'Grueso, profundo - Adj い',
        ),
        Flashcard(
          kanji: '暑い',
          hiragana: 'あつい',
          romaji: 'atsui',
          meaning: 'Caluroso (clima), caliente - Adj い',
        ),
        Flashcard(
          kanji: '熱い',
          hiragana: 'あつい',
          romaji: 'atsui',
          meaning: 'Caliente (cosa, algo) - Adj い',
        ),
        Flashcard(
          kanji: '会う',
          hiragana: 'あう',
          romaji: 'au',
          meaning: 'Encontrar, ver, encontrarse - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '晩',
          hiragana: 'ばん',
          romaji: 'ban',
          meaning: 'Tardecita, noche',
        ),
        Flashcard(
          kanji: '晩ご飯',
          hiragana: 'ばんごはん',
          romaji: 'bangohan',
          meaning: 'Cena',
        ),
        Flashcard(
          kanji: '番号',
          hiragana: 'ばんごう',
          romaji: 'bangou',
          meaning: 'Número, dígitos',
        ),
        Flashcard(
          kanji: 'バス',
          hiragana: 'バス',
          romaji: 'basu',
          meaning: 'Bus',
        ),
        Flashcard(
          kanji: 'バター',
          hiragana: 'バター',
          romaji: 'bataa',
          meaning: 'Mantequilla',
        ),
        Flashcard(
          kanji: 'ベッド',
          hiragana: 'ベッド',
          romaji: 'beddo',
          meaning: 'Cama',
        ),
        Flashcard(
          kanji: '勉強',
          hiragana: 'べんきょう',
          romaji: 'benkyou',
          meaning: 'Estudiar',
        ),
        Flashcard(
          kanji: '便利',
          hiragana: 'べんり',
          romaji: 'benri',
          meaning: 'Conveniente, práctico, útil',
        ),
        Flashcard(
          kanji: 'ボールペン',
          hiragana: 'ボールペン',
          romaji: 'boorupen',
          meaning: 'Bolígrafo',
        ),
        Flashcard(
          kanji: 'ボタン',
          hiragana: 'ボタン',
          romaji: 'botan',
          meaning: 'Botón',
        ),
        Flashcard(
          kanji: '帽子',
          hiragana: 'ぼうし',
          romaji: 'boushi',
          meaning: 'Sombrero',
        ),
        Flashcard(
          kanji: '文章',
          hiragana: 'ぶんぷう',
          romaji: 'bunpou',
          meaning: 'Oración, artículo, texto, escrito',
        ),
        Flashcard(
          kanji: '豚肉',
          hiragana: 'ぶたにく',
          romaji: 'butaniku',
          meaning: 'Carne de cerdo',
        ),
        Flashcard(
          kanji: '病院',
          hiragana: 'びょういん',
          romaji: 'byouin',
          meaning: 'Hospital',
        ),
        Flashcard(
          kanji: '病気',
          hiragana: 'びょうき',
          romaji: 'byouki',
          meaning: 'Enfermedad',
        ),
        Flashcard(
          kanji: '茶色',
          hiragana: 'ちゃいろ',
          romaji: 'chairo',
          meaning: 'Marrón (color)',
        ),
        Flashcard(
          kanji: '茶碗',
          hiragana: 'ちゃわん',
          romaji: 'chawan',
          meaning: 'Tazón (de arroz), taza de té',
        ),
        Flashcard(
          kanji: '父',
          hiragana: 'ちち',
          romaji: 'chichi',
          meaning: 'Padre',
        ),
        Flashcard(
          kanji: '違う',
          hiragana: 'ちがう',
          romaji: 'chigau',
          meaning: 'Diferir, ser diferente (a), ir en contra (de)',
        ),
        Flashcard(
          kanji: '小さい',
          hiragana: 'ちいさい',
          romaji: 'chiisai',
          meaning: 'Pequeño/a, diminuto - Adj い',
        ),
        Flashcard(
          kanji: '小さな',
          hiragana: 'ちいさな',
          romaji: 'chiisana',
          meaning: 'Pequeño/a, diminuto - Adj. Pre-sustantivo (rentaishi)',
        ),
        Flashcard(
          kanji: '近い',
          hiragana: 'ちかい',
          romaji: 'chikai',
          meaning: 'Cerca, corta distancia - Adj い',
        ),
        Flashcard(
          kanji: '地下鉄',
          hiragana: 'ちかてつ',
          romaji: 'chikatetsu',
          meaning: 'Metro (Tren subterráneo)',
        ),
        Flashcard(
          kanji: '地図',
          hiragana: 'ちず',
          romaji: 'chizu',
          meaning: 'Mapa',
        ),
        Flashcard(
          kanji: 'ちょっと',
          hiragana: 'ちょっと',
          romaji: 'chotto',
          meaning: 'Un poco, solo un minuto, poco (tiempo) - Adverbio',
        ),
        Flashcard(
          kanji: '丁度',
          hiragana: 'ちょうど',
          romaji: 'choudo',
          meaning: 'Exactamente, correcto, justo - Adverbio',
        ),
        Flashcard(
          kanji: '台所',
          hiragana: 'だいどころ',
          romaji: 'daidokoro',
          meaning: 'Cocina',
        ),
        Flashcard(
          kanji: '大学',
          hiragana: 'だいがく',
          romaji: 'daigaku',
          meaning: 'Universidad',
        ),
        Flashcard(
          kanji: '大丈夫',
          hiragana: 'だいじょうぶ',
          romaji: 'daijoubu',
          meaning: 'Está bien, está todo bien - Adj な',
        ),
        Flashcard(
          kanji: '大好き',
          hiragana: 'だいすき',
          romaji: 'daisuki',
          meaning: 'Gustar mucho, encantar, (me) encanta - Adj な',
        ),
        Flashcard(
          kanji: 'だんだん',
          hiragana: 'だんだん',
          romaji: 'dandan',
          meaning: 'Poco a poco, gradualmente - Adverbio',
        ),
        Flashcard(
          kanji: '誰',
          hiragana: 'だれ',
          romaji: 'dare',
          meaning: 'Quién, quién (es)',
        ),
        Flashcard(
          kanji: '誰か',
          hiragana: 'だれか',
          romaji: 'dareka',
          meaning: 'Alguien',
        ),
        Flashcard(
          kanji: '出す',
          hiragana: 'だす',
          romaji: 'dasu',
          meaning: 'Sacar, salir, revelar, poner afuera - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '出口',
          hiragana: 'でぐち',
          romaji: 'deguchi',
          meaning: 'Salida (puerta), la salida de un lugar',
        ),
        Flashcard(
          kanji: '出かける',
          hiragana: 'でかける',
          romaji: 'dekakeru',
          meaning: 'Salir (para algún lugar), partir - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: 'でも',
          hiragana: 'でも',
          romaji: 'demo',
          meaning: 'Pero, sin embargo, aunque, aun así',
        ),
        Flashcard(
          kanji: '電気',
          hiragana: 'でんき',
          romaji: 'denki',
          meaning: 'Electricidad, luz eléctrica',
        ),
        Flashcard(
          kanji: '電車',
          hiragana: 'でんしゃ',
          romaji: 'densha',
          meaning: 'Tren, tren eléctrico',
        ),
        Flashcard(
          kanji: '電話',
          hiragana: 'でんわ',
          romaji: 'denwa',
          meaning: 'Teléfono (dispositivo), llamada telefónica',
        ),
        Flashcard(
          kanji: 'デパート',
          hiragana: 'デパート',
          romaji: 'depaato',
          meaning: 'Grandes almacenes, departamento, centro comercial',
        ),
        Flashcard(
          kanji: '出る',
          hiragana: 'でる',
          romaji: 'deru',
          meaning: 'Salir, aparecer (en), partir - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: 'ドア',
          hiragana: 'ドア',
          romaji: 'doa',
          meaning: 'Puerta',
        ),
        Flashcard(
          kanji: 'どっち',
          hiragana: 'どっち',
          romaji: 'docchi',
          meaning: '¿Cuál (de los dos)?, ¿Cuál? - Forma Informal',
        ),
        Flashcard(
          kanji: 'どちら',
          hiragana: 'どちら',
          romaji: 'dochira',
          meaning: '¿Cuál (de los dos)? -  Formal',
        ),
        Flashcard(
          kanji: 'どこ',
          hiragana: 'どこ',
          romaji: 'doko',
          meaning: '¿Dónde?, ¿qué lugar?',
        ),
        Flashcard(
          kanji: 'どなた',
          hiragana: 'どなた',
          romaji: 'donata',
          meaning: 'Quien - Formal',
        ),
        Flashcard(
          kanji: 'どんな',
          hiragana: 'どんな',
          romaji: 'donna',
          meaning: '¿Qué tipo de (...)?',
        ),
        Flashcard(
          kanji: 'どの',
          hiragana: 'どの',
          romaji: 'dono',
          meaning: '¿Cuál? (de tres o más o de todos), qué tipo, qué clase',
        ),
        Flashcard(
          kanji: 'どれ',
          hiragana: 'どれ',
          romaji: 'dore',
          meaning: '¿Cuál? ¿Qué?',
        ),
        Flashcard(
          kanji: 'どう',
          hiragana: 'どう',
          romaji: 'dou',
          meaning: 'Cómo, ¿De qué manera? ¿Qué tal?',
        ),
        Flashcard(
          kanji: '動物',
          hiragana: 'どうぶつ',
          romaji: 'doubutsu',
          meaning: 'Animal',
        ),
        Flashcard(
          kanji: 'どうも',
          hiragana: 'どうも',
          romaji: 'doumo',
          meaning: 'Gracias, muchas gracias - Forma de agradecimiento',
        ),
        Flashcard(
          kanji: 'どうぞ',
          hiragana: 'どうぞ',
          romaji: 'douzo',
          meaning: 'Por favor, aquí tienes, Adelante, siéntase libre',
        ),
        Flashcard(
          kanji: '土曜日',
          hiragana: 'どようび',
          romaji: 'doyoubi',
          meaning: 'Sábado',
        ),
        Flashcard(
          kanji: '絵',
          hiragana: 'え',
          romaji: 'e',
          meaning: 'Dibujo, pintura, imagen',
        ),
        Flashcard(
          kanji: 'ええ',
          hiragana: 'ええ',
          romaji: 'ee',
          meaning: 'Sí - Forma informal (menos formal que はい)',
        ),
        Flashcard(
          kanji: '映画',
          hiragana: 'えいが',
          romaji: 'eigakan',
          meaning: 'Película',
        ),
        Flashcard(
          kanji: '映画館',
          hiragana: 'えいがかん',
          romaji: 'eigakan',
          meaning: 'Cine, sala de cine',
        ),
        Flashcard(
          kanji: '英語',
          hiragana: 'えいご',
          romaji: 'eigo',
          meaning: 'Idioma inglés',
        ),
        Flashcard(
          kanji: '駅',
          hiragana: 'えき',
          romaji: 'eki',
          meaning: 'Estación (de tren o de autobús)',
        ),
        Flashcard(
          kanji: '鉛筆',
          hiragana: 'えんぴつ',
          romaji: 'enpitsu',
          meaning: 'Lápiz',
        ),
        Flashcard(
          kanji: 'エレベーター',
          hiragana: 'エレベーター',
          romaji: 'erebeetaa',
          meaning: 'Ascensor, elevador - Katakana',
        ),
        Flashcard(
          kanji: 'フィルム',
          hiragana: 'フィルム',
          romaji: 'firumu',
          meaning: 'Película (fotográfica o cinematográfica) - Katakana',
        ),
        Flashcard(
          kanji: 'フォーク',
          hiragana: 'フォーク',
          romaji: 'fooku',
          meaning: 'Tenedor - Katakana',
        ),
        Flashcard(
          kanji: '吹く',
          hiragana: 'ふく',
          romaji: 'fuku',
          meaning:
              'Soplar (viento), silbar, tocar un instrumento de viento - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '服',
          hiragana: 'ふく',
          romaji: 'fuku',
          meaning: 'Ropa',
        ),
        Flashcard(
          kanji: '降る',
          hiragana: 'ふる',
          romaji: 'furu',
          meaning: 'Caer (lluvia o nieve), precipitar - Verb. intransitivo',
        ),
        Flashcard(
          kanji: '古い',
          hiragana: 'ふるい',
          romaji: 'furui',
          meaning: 'Viejo (para objetos), antiguo, pasado de moda - Adj い',
        ),
        Flashcard(
          kanji: '二人',
          hiragana: 'ふたり',
          romaji: 'futari',
          meaning: 'Dos personas',
        ),
        Flashcard(
          kanji: '二つ',
          hiragana: 'ふたつ',
          romaji: 'futatsu',
          meaning: 'Dos (para objetos)',
        ),
        Flashcard(
          kanji: '太い',
          hiragana: 'ふとい',
          romaji: 'futoi',
          meaning: 'Gordo, grueso - Adj い',
        ),
        Flashcard(
          kanji: '二日',
          hiragana: 'ふつか',
          romaji: 'futsuka',
          meaning: 'Día dos, dos días',
        ),
        Flashcard(
          kanji: '封筒',
          hiragana: 'ふうとう',
          romaji: 'fuutou',
          meaning: 'Sobre (para cartas u hojas)',
        ),
        Flashcard(
          kanji: '冬',
          hiragana: 'ふゆ',
          romaji: 'fuyu',
          meaning: 'Invierno',
        ),
        Flashcard(
          kanji: '外国',
          hiragana: 'がいこく',
          romaji: 'gaikoku',
          meaning: 'País extranjero',
        ),
        Flashcard(
          kanji: '外国人',
          hiragana: 'がいこくじん',
          romaji: 'gaikokujin',
          meaning: 'Extranjero (persona), ciudadano extranjero',
        ),
        Flashcard(
          kanji: '学校',
          hiragana: 'がっこう',
          romaji: 'gakkou',
          meaning: 'Escuela',
        ),
        Flashcard(
          kanji: '学生',
          hiragana: 'がくせい',
          romaji: 'gakusei',
          meaning: 'Estudiante (sobretodo un estudiante universitario)',
        ),
        Flashcard(
          kanji: '側',
          hiragana: 'がわ',
          romaji: 'gawa',
          meaning: 'Al lado, lado, cerca',
        ),
        Flashcard(
          kanji: '玄関',
          hiragana: 'げんかん',
          romaji: 'genkan',
          meaning:
              'Entrada (de una casa o edificio), vestíbulo, recibidor, puerta de entrada principal.',
        ),
        Flashcard(
          kanji: '元気',
          hiragana: 'げんき',
          romaji: 'genki',
          meaning: 'Energía, salud, saludable, estar bien - Adj な',
        ),
        Flashcard(
          kanji: '月曜日',
          hiragana: 'げつようび',
          romaji: 'getsuyoubi',
          meaning: 'Lunes',
        ),
        Flashcard(
          kanji: '銀行',
          hiragana: 'ぎんこう',
          romaji: 'ginkou',
          meaning: 'Banco',
        ),
        Flashcard(
          kanji: 'ギター',
          hiragana: 'ギター',
          romaji: 'gitaa',
          meaning: 'Guitarra - Katakana',
        ),
        Flashcard(
          kanji: '五',
          hiragana: 'ご',
          romaji: 'go',
          meaning: 'Cinco (5) - Número',
        ),
        Flashcard(
          kanji: '午後',
          hiragana: 'ごご',
          romaji: 'gogo',
          meaning: '(Por la) Tarde, P.M',
        ),
        Flashcard(
          kanji: 'ご飯',
          hiragana: 'ごはん',
          romaji: 'gohan',
          meaning: 'Comida (arroz), comida en general',
        ),
        Flashcard(
          kanji: '午前',
          hiragana: 'ごぜん',
          romaji: 'gozen',
          meaning: '(Por la) Mañana, A.M (Antes del mediodía)',
        ),
        Flashcard(
          kanji: 'グラム',
          hiragana: 'グラム',
          romaji: 'guramu',
          meaning: 'Gramo - Katakana',
        ),
        Flashcard(
          kanji: '牛肉',
          hiragana: 'ぎゅうにく',
          romaji: 'gyuuniku',
          meaning: 'Carne de res, carne de ternera',
        ),
        Flashcard(
          kanji: '牛乳',
          hiragana: 'ぎゅうにゅう',
          romaji: 'gyuunyuu',
          meaning: 'Leche (de vaca)',
        ),
        Flashcard(
          kanji: '歯',
          hiragana: 'は',
          romaji: 'ha',
          meaning: 'Diente',
        ),
        Flashcard(
          kanji: '八',
          hiragana: 'はち',
          romaji: 'hachi',
          meaning: 'Ocho (8) - Número',
        ),
        Flashcard(
          kanji: '葉書',
          hiragana: 'はがき',
          romaji: 'hagaki',
          meaning: 'Tarjeta postal',
        ),
        Flashcard(
          kanji: '母',
          hiragana: 'はは',
          romaji: 'haha',
          meaning: 'Madre',
        ),
        Flashcard(
          kanji: 'はい',
          hiragana: 'はい',
          romaji: 'hai',
          meaning: 'Sí',
        ),
        Flashcard(
          kanji: '入る',
          hiragana: 'はいる',
          romaji: 'hairu',
          meaning: 'Entrar, irrumpir en - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '灰皿',
          hiragana: 'はいざら',
          romaji: 'haizara',
          meaning: 'Cenicero',
        ),
        Flashcard(
          kanji: '始まる',
          hiragana: 'はじまる',
          romaji: 'hajimaru',
          meaning: 'Comenzar, empezar - Verbo intransitivo',
        ),
        Flashcard(
          kanji: '初めて',
          hiragana: 'はじめて',
          romaji: 'hajimete',
          meaning: 'Por primera vez - Adverbio',
        ),
        Flashcard(
          kanji: '箱',
          hiragana: 'はこ',
          romaji: 'hako',
          meaning: 'Caja, cajón',
        ),
        Flashcard(
          kanji: '履く',
          hiragana: 'はく',
          romaji: 'haku',
          meaning:
              'Ponerse (o usar), Ponerse (los pantalones, la falda) - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '半',
          hiragana: 'はん',
          romaji: 'han',
          meaning: 'Mitad, y media (hora y media)',
        ),
        Flashcard(
          kanji: '花',
          hiragana: 'はな',
          romaji: 'hana',
          meaning: 'Flor, florecer, pétalo',
        ),
        Flashcard(
          kanji: '鼻',
          hiragana: 'はな',
          romaji: 'hana',
          meaning: 'Nariz',
        ),
        Flashcard(
          kanji: '話',
          hiragana: 'はなし',
          romaji: 'hanashi',
          meaning: 'Conversación, habla, charla, historia',
        ),
        Flashcard(
          kanji: '話す',
          hiragana: 'はなす',
          romaji: 'hanasu',
          meaning: 'Hablar, conversar, charlar - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '半分',
          hiragana: 'はんぶん',
          romaji: 'hanbun',
          meaning: 'Mitad',
        ),
        Flashcard(
          kanji: 'ハンカチ',
          hiragana: 'はんかち',
          romaji: 'Hankachi',
          meaning: 'Pañuelo',
        ),
        Flashcard(
          kanji: '晴れ',
          hiragana: 'はれ',
          romaji: 'Hare',
          meaning:
              'Claro (opuesto a nublado o lluvioso), tiempo despejado, buen tiempo',
        ),
        Flashcard(
          kanji: '晴れる',
          hiragana: 'はれる',
          romaji: 'Hareru',
          meaning:
              'Despejarse (el tiempo), estar soleado, aclarar, despejar - Verbo intransitivo',
        ),
        Flashcard(
          kanji: '貼る',
          hiragana: 'はる',
          romaji: 'Haru',
          meaning: 'Pegar (en una superficie)',
        ),
        Flashcard(
          kanji: '春',
          hiragana: 'はる',
          romaji: 'Haru',
          meaning: 'Primavera',
        ),
        Flashcard(
          kanji: '箸',
          hiragana: 'はし',
          romaji: 'Hashi',
          meaning: 'Palillos (para comer)',
        ),
        Flashcard(
          kanji: '橋',
          hiragana: 'はし',
          romaji: 'Hashi',
          meaning: 'Puente',
        ),
        Flashcard(
          kanji: '走る',
          hiragana: 'はしる',
          romaji: 'Hashiru',
          meaning: 'Correr - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '二十歳',
          hiragana: 'はたち',
          romaji: 'Hatachi',
          meaning: 'Veinte años (Edad en Japón donde uno es mayor de edad)',
        ),
        Flashcard(
          kanji: '働く',
          hiragana: 'はたらく',
          romaji: 'Hataraku',
          meaning: 'Trabajar - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '二十日',
          hiragana: 'はつか',
          romaji: 'Hatsuka',
          meaning: 'Día 20, vigésimo día del mes',
        ),
        Flashcard(
          kanji: '早い',
          hiragana: 'はやい',
          romaji: 'Hayai',
          meaning: 'Temprano, rápido - Adj い',
        ),
        Flashcard(
          kanji: '速い',
          hiragana: 'はやい',
          romaji: 'Hayai',
          meaning: 'Rápido, apresurado, rápidamente - Adj い',
        ),
        Flashcard(
          kanji: '辺',
          hiragana: 'へん',
          romaji: 'Hen',
          meaning: 'Área, alrededores',
        ),
        Flashcard(
          kanji: '下手',
          hiragana: 'へた',
          romaji: 'Heta',
          meaning: 'Malo, torpe en hacer algo, poca habilidad - Adj な',
        ),
        Flashcard(
          kanji: '部屋',
          hiragana: 'へや',
          romaji: 'Heya',
          meaning: 'Habitación, cuarto',
        ),
        Flashcard(
          kanji: '左',
          hiragana: 'ひだり',
          romaji: 'Hidari',
          meaning: 'Izquierda',
        ),
        Flashcard(
          kanji: '東',
          hiragana: 'ひがし',
          romaji: 'Higashi',
          meaning: 'Este (Punto cardinal)',
        ),
        Flashcard(
          kanji: '飛行機',
          hiragana: 'ひこうき',
          romaji: 'Hikouki',
          meaning: 'Avión',
        ),
        Flashcard(
          kanji: '引く',
          hiragana: 'ひく',
          romaji: 'Hiku',
          meaning: 'Tirar, jalar, coger (resfriado, gripe) - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '弾く',
          hiragana: 'ひく',
          romaji: 'Hiku',
          meaning:
              'Tocar (Instrumento musical como piano o guitarra). - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '低い',
          hiragana: 'ひくい',
          romaji: 'Hikui',
          meaning: 'Bajo (en altura o nivel) - Adj い',
        ),
        Flashcard(
          kanji: '暇',
          hiragana: 'ひま',
          romaji: 'Hima',
          meaning: 'Tiempo libre, ocio. - Adj な',
        ),
        Flashcard(
          kanji: '広い',
          hiragana: 'ひろい',
          romaji: 'Hiroi',
          meaning: 'Amplio, espacioso - Adj い',
        ),
        Flashcard(
          kanji: '昼',
          hiragana: 'ひる',
          romaji: 'Hiru',
          meaning: 'Mediodía, tarde',
        ),
        Flashcard(
          kanji: '昼ご飯',
          hiragana: 'ひるごはん',
          romaji: 'Hirugohan',
          meaning: 'Almuerzo',
        ),
        Flashcard(
          kanji: '人',
          hiragana: 'ひと',
          romaji: 'Hito',
          meaning: 'Persona',
        ),
        Flashcard(
          kanji: '一人',
          hiragana: 'ひとり',
          romaji: 'Hitori',
          meaning: 'Una persona, solo (una sola persona) - Adverbio',
        ),
        Flashcard(
          kanji: '一つ',
          hiragana: 'ひとつ',
          romaji: 'Hitotsu',
          meaning: 'Uno (para objetos)',
        ),
        Flashcard(
          kanji: 'ほか',
          hiragana: 'ほか',
          romaji: 'Hoka',
          meaning: 'Otro/s',
        ),
        Flashcard(
          kanji: '本',
          hiragana: 'ほん',
          romaji: 'Hon',
          meaning: 'Libro',
        ),
        Flashcard(
          kanji: '本棚',
          hiragana: 'ほんだな',
          romaji: 'Hondana',
          meaning: 'Estantería (de libros)',
        ),
        Flashcard(
          kanji: '本当',
          hiragana: 'ほんとう',
          romaji: 'Hontou',
          meaning: 'Cierto, verdadero, realidad, hecho, auténtico - Adj な',
        ),
        Flashcard(
          kanji: '欲しい',
          hiragana: 'ほしい',
          romaji: 'hoshii',
          meaning: 'Querer, desear (algo) - Adj い',
        ),
        Flashcard(
          kanji: '細い',
          hiragana: 'ほそい',
          romaji: 'hosoi',
          meaning: 'Delgado, estrecho - Adj い',
        ),
        Flashcard(
          kanji: 'ホテル',
          hiragana: 'ホテル',
          romaji: 'hoteru',
          meaning: 'Hotel',
        ),
        Flashcard(
          kanji: '百',
          hiragana: 'ひゃく',
          romaji: 'hyaku',
          meaning: 'Cien (100) - Número',
        ),
        Flashcard(
          kanji: '一',
          hiragana: 'いち',
          romaji: 'ichi',
          meaning: 'Uno (1) - Número',
        ),
        Flashcard(
          kanji: '一番',
          hiragana: 'いちばん',
          romaji: 'ichiban',
          meaning: 'El primero, el mejor, el más, el número uno - Adverbio',
        ),
        Flashcard(
          kanji: '一日',
          hiragana: 'いちにち',
          romaji: 'ichinichi',
          meaning: 'Un día, todo el día',
        ),
        Flashcard(
          kanji: '家',
          hiragana: 'いえ',
          romaji: 'ie',
          meaning: 'Casa',
        ),
        Flashcard(
          kanji: 'いい',
          hiragana: 'いい',
          romaji: 'ii',
          meaning: 'Bueno',
        ),
        Flashcard(
          kanji: 'いいえ',
          hiragana: 'いいえ',
          romaji: 'iie',
          meaning: 'No (respuesta negativa formal)',
        ),
        Flashcard(
          kanji: 'いかが',
          hiragana: 'いかが',
          romaji: 'ikaga',
          meaning: '¿Cómo?, ¿Qué tal? - Adverbio',
        ),
        Flashcard(
          kanji: '池',
          hiragana: 'いけ',
          romaji: 'ike',
          meaning: 'Estanque',
        ),
        Flashcard(
          kanji: '行く',
          hiragana: 'いく',
          romaji: 'iku',
          meaning: 'Ir, moverse - Verbo intransitivo',
        ),
        Flashcard(
          kanji: 'いくら',
          hiragana: 'いくら',
          romaji: 'ikura',
          meaning: '¿Cuánto? (para preguntar precio o cantidad) - Adverbio',
        ),
        Flashcard(
          kanji: 'いくつ',
          hiragana: 'いくつ',
          romaji: 'ikutsu',
          meaning: '¿Cuántos?, ¿Cuántas? (para preguntar la cantidad)',
        ),
        Flashcard(
          kanji: '今',
          hiragana: 'いま',
          romaji: 'ima',
          meaning: 'Ahora, en este momento',
        ),
        Flashcard(
          kanji: '意味',
          hiragana: 'いみ',
          romaji: 'imi',
          meaning: 'Significado',
        ),
        Flashcard(
          kanji: '妹',
          hiragana: 'いもうと',
          romaji: 'imouto',
          meaning: 'Hermana menor',
        ),
        Flashcard(
          kanji: '犬',
          hiragana: 'いぬ',
          romaji: 'inu',
          meaning: 'Perro',
        ),
        Flashcard(
          kanji: '入れる',
          hiragana: 'いれる',
          romaji: 'ireru',
          meaning: 'Poner, dejar entrar, insertar, meter - (Verbo transitivo)',
        ),
        Flashcard(
          kanji: '入口',
          hiragana: 'いりぐち',
          romaji: 'iriguchi',
          meaning: 'Entrada (por puerta)',
        ),
        Flashcard(
          kanji: '色',
          hiragana: 'いろ',
          romaji: 'iro',
          meaning: 'Color',
        ),
        Flashcard(
          kanji: '色々',
          hiragana: 'いろいろ',
          romaji: 'iroiro',
          meaning: 'Varios - Adj な',
        ),
        Flashcard(
          kanji: 'いる',
          hiragana: 'iru',
          romaji: 'iru',
          meaning: 'Estar, ser (seres vivos o animados) - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '要る',
          hiragana: 'iru',
          romaji: 'iru',
          meaning: 'Necesitar, querer, requerir - Verb. intransitivo',
        ),
        Flashcard(
          kanji: '医者',
          hiragana: 'いしゃ',
          romaji: 'isha',
          meaning: 'Médico (Doctor)',
        ),
        Flashcard(
          kanji: '忙しい',
          hiragana: 'いそがしい',
          romaji: 'isogashii',
          meaning: 'Ocupado, agitado, estar ocupado - Adj い',
        ),
        Flashcard(
          kanji: '一緒',
          hiragana: 'いっしょ',
          romaji: 'issho',
          meaning: 'Juntos/as, al mismo tiempo, mismo, idéntico',
        ),
        Flashcard(
          kanji: '椅子',
          hiragana: 'いす',
          romaji: 'isu',
          meaning: 'Silla',
        ),
        Flashcard(
          kanji: '痛い',
          hiragana: 'いたい',
          romaji: 'itai',
          meaning: 'Doloroso, dolor - Adj い',
        ),
        Flashcard(
          kanji: 'いつ',
          hiragana: 'itsu',
          romaji: 'itsu',
          meaning: 'Cuándo',
        ),
        Flashcard(
          kanji: '五日',
          hiragana: 'いつか',
          romaji: 'itsuka',
          meaning: 'Día 5 del mes, cinco (5) días',
        ),
        Flashcard(
          kanji: 'いつも',
          hiragana: 'itsumo',
          romaji: 'itsumo',
          meaning: 'Siempre - Adverbio',
        ),
        Flashcard(
          kanji: '五つ',
          hiragana: 'いつつ',
          romaji: 'itsutsu',
          meaning: 'Cinco (para objetos)',
        ),
        Flashcard(
          kanji: '言う',
          hiragana: 'いう',
          romaji: 'iu',
          meaning: 'Decir, declarar, nombrar, llamar',
        ),
        Flashcard(
          kanji: '嫌',
          hiragana: 'いや',
          romaji: 'iya',
          meaning: 'Desagradable, detestable, odio, desagrado - Adj な',
        ),
        Flashcard(
          kanji: 'じゃあ',
          hiragana: 'jaa',
          romaji: 'jaa',
          meaning: 'Entonces, bueno - Conjunción',
        ),
        Flashcard(
          kanji: '字引',
          hiragana: 'じびき',
          romaji: 'jibiki',
          meaning: 'Diccionario (en el contexto histórico)',
        ),
        Flashcard(
          kanji: '自分',
          hiragana: 'じぶん',
          romaji: 'jibun',
          meaning: 'Uno mismo, yo mismo, sí mismo',
        ),
        Flashcard(
          kanji: '自動車',
          hiragana: 'じどうしゃ',
          romaji: 'jidousha',
          meaning: 'Automóvil',
        ),
        Flashcard(
          kanji: '時間',
          hiragana: 'じかん',
          romaji: 'jikan',
          meaning: 'Tiempo, horas',
        ),
        Flashcard(
          kanji: '辞書',
          hiragana: 'じしょ',
          romaji: 'jisho',
          meaning: 'Diccionario',
        ),
        Flashcard(
          kanji: '自転車',
          hiragana: 'じてんしゃ',
          romaji: 'jitensha',
          meaning: 'Bicicleta',
        ),
        Flashcard(
          kanji: '丈夫',
          hiragana: 'じょうぶ',
          romaji: 'joubu',
          meaning: 'Fuerte, resistente - Adj な',
        ),
        Flashcard(
          kanji: '上手',
          hiragana: 'じょうず',
          romaji: 'jouzu',
          meaning: 'Hábil, bueno en algo, experto - Adj な',
        ),
        Flashcard(
          kanji: '授業',
          hiragana: 'じゅぎょう',
          romaji: 'jugyou',
          meaning: 'Clase (asignatura), lección, trabajo de clase',
        ),
        Flashcard(
          kanji: '十',
          hiragana: 'じゅう',
          romaji: 'juu',
          meaning: 'Diez - Número',
        ),
        Flashcard(
          kanji: 'かばん',
          hiragana: 'かばん',
          romaji: 'kaban',
          meaning: 'Bolso, maleta',
        ),
        Flashcard(
          kanji: '花瓶',
          hiragana: 'かびん',
          romaji: 'kabin',
          meaning: 'Florero, jarrón',
        ),
        Flashcard(
          kanji: '角',
          hiragana: 'かど',
          romaji: 'kado',
          meaning: 'Esquina, ángulo',
        ),
        Flashcard(
          kanji: '帰る',
          hiragana: 'かえる',
          romaji: 'kaeru',
          meaning: 'Volver, regresar - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '返す',
          hiragana: 'かえす',
          romaji: 'kaesu',
          meaning:
              'Devolver (algo), volver a poner, restaurar - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '鍵',
          hiragana: 'かぎ',
          romaji: 'kagi',
          meaning: 'Llave',
        ),
        Flashcard(
          kanji: '回',
          hiragana: 'かい',
          romaji: 'kai',
          meaning: 'Contador de veces u ocurrencias',
        ),
        Flashcard(
          kanji: '階段',
          hiragana: 'かいだん',
          romaji: 'kaidan',
          meaning: 'Escaleras',
        ),
        Flashcard(
          kanji: '買い物',
          hiragana: 'かいもの',
          romaji: 'kaimono',
          meaning: 'Compras, ir de compras',
        ),
        Flashcard(
          kanji: '会社',
          hiragana: 'かいしゃ',
          romaji: 'kaisha',
          meaning: 'Empresa, compañía, corporación, lugar de trabajo',
        ),
        Flashcard(
          kanji: '掛かる',
          hiragana: 'かかる',
          romaji: 'kakaru',
          meaning:
              'Tomar (tiempo o dinero) Costar (Ej. Mucho dinero), llevar tiempo, colgar, coger (un resfriado) - Verbo intransitivo',
        ),
        Flashcard(
          kanji: '掛ける',
          hiragana: 'かける',
          romaji: 'kakeru',
          meaning:
              'Colgar, tender, sentarse, llamar por telefono, multiplicar -  Verbo transitivo',
        ),
        Flashcard(
          kanji: '書く',
          hiragana: 'かく',
          romaji: 'kaku',
          meaning: 'Escribir - Verb. Transitivo',
        ),
        Flashcard(
          kanji: 'カメラ',
          hiragana: 'kamera',
          romaji: 'kamera',
          meaning: 'Cámara - Katakana',
        ),
        Flashcard(
          kanji: '紙',
          hiragana: 'かみ',
          romaji: 'kami',
          meaning: 'Papel',
        ),
        Flashcard(
          kanji: '漢字',
          hiragana: 'かんじ',
          romaji: 'kanji',
          meaning: 'Caracteres chinos, kanji',
        ),
        Flashcard(
          kanji: '顔',
          hiragana: 'かお',
          romaji: 'kao',
          meaning: 'Cara, rostro',
        ),
        Flashcard(
          kanji: 'カップ',
          hiragana: 'kappu',
          romaji: 'kappu',
          meaning: 'Taza, vaso - Katakana',
        ),
        Flashcard(
          kanji: '体',
          hiragana: 'からだ',
          romaji: 'karada',
          meaning: 'Cuerpo',
        ),
        Flashcard(
          kanji: '辛い',
          hiragana: 'からい',
          romaji: 'karai',
          meaning: 'Picante, picoso - Adj い',
        ),
        Flashcard(
          kanji: 'カレー',
          hiragana: 'karee',
          romaji: 'karee',
          meaning: 'Curry',
        ),
        Flashcard(
          kanji: 'カレンダー',
          hiragana: 'karendaa',
          romaji: 'karendaa',
          meaning: 'Calendario',
        ),
        Flashcard(
          kanji: '借りる',
          hiragana: 'かりる',
          romaji: 'kariru',
          meaning:
              'Pedir prestado, tener un préstamo, alquilar - Verb. transitivo',
        ),
        Flashcard(
          kanji: '軽い',
          hiragana: 'かるい',
          romaji: 'karui',
          meaning: 'Ligero (no pesado), leve, suave - Adj い',
        ),
        Flashcard(
          kanji: '傘',
          hiragana: 'かさ',
          romaji: 'kasa',
          meaning: 'Paraguas, sombrilla',
        ),
        Flashcard(
          kanji: '貸す',
          hiragana: 'かす',
          romaji: 'kasu',
          meaning: 'Prestar, dejar prestado, alquilar - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '方',
          hiragana: 'かた',
          romaji: 'kata',
          meaning:
              'Dirección (formal), forma de hacer algo (forma de comer), lado',
        ),
        Flashcard(
          kanji: '家庭',
          hiragana: 'かてい',
          romaji: 'katei',
          meaning:
              'Hogar, familia (costumbres familiares, ambiente familiar...)',
        ),
        Flashcard(
          kanji: '買う',
          hiragana: 'かう',
          romaji: 'kau',
          meaning: 'Comprar - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '川',
          hiragana: 'かわ',
          romaji: 'kawa',
          meaning: 'Río',
        ),
        Flashcard(
          kanji: '可愛い',
          hiragana: 'かわいい',
          romaji: 'kawaii',
          meaning: 'Lindo, adorable, bonito, encantador, mono - Adj い',
        ),
        Flashcard(
          kanji: '火曜日',
          hiragana: 'かようび',
          romaji: 'kayoubi',
          meaning: 'Martes',
        ),
        Flashcard(
          kanji: '風邪',
          hiragana: 'かぜ',
          romaji: 'kaze',
          meaning: 'Resfriado común, gripe',
        ),
        Flashcard(
          kanji: '風',
          hiragana: 'かぜ',
          romaji: 'kaze',
          meaning: 'Viento, aire, brisa',
        ),
        Flashcard(
          kanji: '家族',
          hiragana: 'かぞく',
          romaji: 'kazoku',
          meaning: 'Familia, miembros de una familia',
        ),
        Flashcard(
          kanji: '警官',
          hiragana: 'けいかん',
          romaji: 'keikan',
          meaning: 'Policía',
        ),
        Flashcard(
          kanji: '結婚',
          hiragana: 'けっこん',
          romaji: 'kekkon',
          meaning: 'Matrimonio - Sustantivo, verbo suru',
        ),
        Flashcard(
          kanji: '結構',
          hiragana: 'けっこう',
          romaji: 'kekkou',
          meaning:
              'Espléndido, agradable, suficiente, bien (estoy bien), no gracias - Sustantivo adverbial, adj な',
        ),
        Flashcard(
          kanji: '今朝',
          hiragana: 'けさ',
          romaji: 'kesa',
          meaning: 'Esta mañana - sustantivo (temporal)',
        ),
        Flashcard(
          kanji: '消す',
          hiragana: 'けす',
          romaji: 'kesu',
          meaning:
              'Borrar, eliminar, tachar, apagar (energía, luz, fuego), extinguir - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '木',
          hiragana: 'き',
          romaji: 'ki',
          meaning: 'Madera',
        ),
        Flashcard(
          kanji: '消える',
          hiragana: 'きえる',
          romaji: 'kieru',
          meaning: 'Desaparecer, desvanecerse - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '黄色い',
          hiragana: 'きいろい',
          romaji: 'kiiroi',
          meaning: 'Amarillo - Adj い',
        ),
        Flashcard(
          kanji: '聞く',
          hiragana: 'きく',
          romaji: 'kiku',
          meaning: 'Escuchar - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '昨日',
          hiragana: 'きのう',
          romaji: 'kinou',
          meaning: 'Ayer',
        ),
        Flashcard(
          kanji: '金曜日',
          hiragana: 'きんようび',
          romaji: 'kinyoubi',
          meaning: 'Viernes',
        ),
        Flashcard(
          kanji: '切符',
          hiragana: 'きっぷ',
          romaji: 'kippu',
          meaning: 'Ticket, boleto, billete',
        ),
        Flashcard(
          kanji: '嫌い',
          hiragana: 'きらい',
          romaji: 'kirai',
          meaning: 'Odiar, desagradable, odio, disgusto - Adj な',
        ),
        Flashcard(
          kanji: 'きれい',
          hiragana: 'kirei',
          romaji: 'kirei',
          meaning: 'Bonito, limpio, aseado - Adj な',
        ),
        Flashcard(
          kanji: 'キログラム',
          hiragana: 'kiroguramu',
          romaji: 'kiroguramu',
          meaning: 'Kilogramo',
        ),
        Flashcard(
          kanji: 'キロメートル',
          hiragana: 'kiromeetoru',
          romaji: 'kiromeetoru',
          meaning: 'Kilómetro',
        ),
        Flashcard(
          kanji: '切る',
          hiragana: 'きる',
          romaji: 'kiru',
          meaning:
              'Cortar, poner fin, terminar (una conversación) - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '喫茶店',
          hiragana: 'きっさてん',
          romaji: 'kissaten',
          meaning: 'Cafetería',
        ),
        Flashcard(
          kanji: '北',
          hiragana: 'きた',
          romaji: 'kita',
          meaning: 'Norte',
        ),
        Flashcard(
          kanji: '汚い',
          hiragana: 'きたない',
          romaji: 'kitanai',
          meaning:
              'Sucio, asqueroso, impuro, desordenado, vulgar, ordinario - Adj い',
        ),
        Flashcard(
          kanji: '切手',
          hiragana: 'きって',
          romaji: 'kitte',
          meaning: 'Sello',
        ),
        Flashcard(
          kanji: 'こっち',
          hiragana: 'kocchi',
          romaji: 'kocchi',
          meaning:
              'Esta dirección, aquí (dirección cerca del hablante), esta persona (referirse a persona cercana)',
        ),
        Flashcard(
          kanji: 'こちら',
          hiragana: 'kochira',
          romaji: 'kochira',
          meaning: 'Esta dirección, aquí, esta persona (Forma cortés de こっち)',
        ),
        Flashcard(
          kanji: '子供',
          hiragana: 'こども',
          romaji: 'kodomo',
          meaning: 'Niño, niños',
        ),
        Flashcard(
          kanji: '個',
          hiragana: 'こ',
          romaji: 'ko',
          meaning:
              'Contador de articulos u objetos redondeados (huevos, frutas, botones, monedas)',
        ),
        Flashcard(
          kanji: '声',
          hiragana: 'こえ',
          romaji: 'koe',
          meaning: 'Voz',
        ),
        Flashcard(
          kanji: 'ここ',
          hiragana: 'ここ',
          romaji: 'koko',
          meaning: 'Aquí',
        ),
        Flashcard(
          kanji: '九日',
          hiragana: 'ここのか',
          romaji: 'kokonoka',
          meaning: 'Noveno día del mes, día 9, nueve días',
        ),
        Flashcard(
          kanji: '九つ',
          hiragana: 'ここのつ',
          romaji: 'kokonotsu',
          meaning: 'Nueve (contador estándar)',
        ),
        Flashcard(
          kanji: '困る',
          hiragana: 'こまる',
          romaji: 'komaru',
          meaning:
              'Verse en apuros, estar perplejo, estar preocupado, estar molesto - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '今晩',
          hiragana: 'こんばん',
          romaji: 'konban',
          meaning: 'Esta noche, esta tarde',
        ),
        Flashcard(
          kanji: '今月',
          hiragana: 'こんげつ',
          romaji: 'kongetsu',
          meaning: 'Este mes',
        ),
        Flashcard(
          kanji: 'こんな',
          hiragana: 'こんな',
          romaji: 'konna',
          meaning:
              'Tal (como este), tales (sobre algo o alguien cercano al hablante) - Adj. Presustantivo',
        ),
        Flashcard(
          kanji: 'この',
          hiragana: 'この',
          romaji: 'kono',
          meaning: 'Este, esta - Adj. Presustantivo',
        ),
        Flashcard(
          kanji: '今週',
          hiragana: 'こんしゅう',
          romaji: 'konshuu',
          meaning: 'Esta semana',
        ),
        Flashcard(
          kanji: 'コーヒー',
          hiragana: 'kohii',
          romaji: 'kohii',
          meaning: 'Café - Katakana',
        ),
        Flashcard(
          kanji: 'コート',
          hiragana: 'kooto',
          romaji: 'kooto',
          meaning: 'Abrigo - Katakana',
        ),
        Flashcard(
          kanji: 'コピー',
          hiragana: 'kopii',
          romaji: 'kopii',
          meaning: 'Copiar, fotocopiar - Katakana',
        ),
        Flashcard(
          kanji: 'コップ',
          hiragana: 'koppu',
          romaji: 'koppu',
          meaning: 'Vaso, copa - Katakana',
        ),
        Flashcard(
          kanji: 'これ',
          hiragana: 'kore',
          romaji: 'kore',
          meaning: 'Esto (esto es...)',
        ),
        Flashcard(
          kanji: '答える',
          hiragana: 'こたえる',
          romaji: 'kotaeru',
          meaning: 'Responder - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '言葉',
          hiragana: 'ことば',
          romaji: 'kotoba',
          meaning: 'Palabra/s',
        ),
        Flashcard(
          kanji: '今年',
          hiragana: 'ことし',
          romaji: 'kotoshi',
          meaning: 'Este año',
        ),
        Flashcard(
          kanji: '交番',
          hiragana: 'こうばん',
          romaji: 'kouban',
          meaning: 'Comisaría/Estación de policía',
        ),
        Flashcard(
          kanji: '紅茶',
          hiragana: 'こうちゃ',
          romaji: 'koucha',
          meaning: 'Té negro',
        ),
        Flashcard(
          kanji: '公園',
          hiragana: 'こうえん',
          romaji: 'kouen',
          meaning: 'Parque',
        ),
        Flashcard(
          kanji: '交差点',
          hiragana: 'こうさてん',
          romaji: 'kousaten',
          meaning: 'Cruce de calles, intersección',
        ),
        Flashcard(
          kanji: '口',
          hiragana: 'くち',
          romaji: 'kuchi',
          meaning: 'Boca',
        ),
        Flashcard(
          kanji: '果物',
          hiragana: 'くだもの',
          romaji: 'kudamono',
          meaning: 'Fruta',
        ),
        Flashcard(
          kanji: 'ください',
          hiragana: 'kudasai',
          romaji: 'kudasai',
          meaning: 'Por favor - Expresión',
        ),
        Flashcard(
          kanji: '曇り',
          hiragana: 'くもり',
          romaji: 'kumori',
          meaning: 'Nublado (estado del clima)',
        ),
        Flashcard(
          kanji: '曇る',
          hiragana: 'くもる',
          romaji: 'kumoru',
          meaning:
              'Nublarse (proceso de volverse nublado) - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '国',
          hiragana: 'くに',
          romaji: 'kuni',
          meaning: 'País',
        ),
        Flashcard(
          kanji: '暗い',
          hiragana: 'くらい',
          romaji: 'kurai',
          meaning: 'Oscuro - Adj い',
        ),
        Flashcard(
          kanji: 'クラス',
          hiragana: 'kurasu',
          romaji: 'kurasu',
          meaning: 'Clase (grupo de alúmnos) - Katakana',
        ),
        Flashcard(
          kanji: '黒',
          hiragana: 'くろ',
          romaji: 'kuro',
          meaning: 'Negro (color)',
        ),
        Flashcard(
          kanji: '黒い',
          hiragana: 'くろい',
          romaji: 'kuroi',
          meaning: 'Negro (para describir algo de color negro) - Adj い',
        ),
        Flashcard(
          kanji: '来る',
          hiragana: 'くる',
          romaji: 'kuru',
          meaning: 'Venir - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '車',
          hiragana: 'くるま',
          romaji: 'kuruma',
          meaning: 'Coche, carro, automóvil',
        ),
        Flashcard(
          kanji: '薬',
          hiragana: 'くすり',
          romaji: 'kusuri',
          meaning: 'Medicina, medicamento, fármaco, droga',
        ),
        Flashcard(
          kanji: '靴',
          hiragana: 'くつ',
          romaji: 'kutsu',
          meaning: 'Zapatos',
        ),
        Flashcard(
          kanji: '靴下',
          hiragana: 'くつした',
          romaji: 'kutsushita',
          meaning: 'Calcetines, medias',
        ),
        Flashcard(
          kanji: '去年',
          hiragana: 'きょねん',
          romaji: 'kyonen',
          meaning: 'El año pasado, año anterior',
        ),
        Flashcard(
          kanji: '今日',
          hiragana: 'きょう',
          romaji: 'kyou',
          meaning: 'Hoy',
        ),
        Flashcard(
          kanji: '兄弟',
          hiragana: 'きょうだい',
          romaji: 'kyoudai',
          meaning: 'Hermanos',
        ),
        Flashcard(
          kanji: '教室',
          hiragana: 'きょうしつ',
          romaji: 'kyoushitsu',
          meaning: 'Aula, salón de clases',
        ),
        Flashcard(
          kanji: '九',
          hiragana: 'きゅう',
          romaji: 'kyuu',
          meaning: 'Nueve - Número',
        ),
        Flashcard(
          kanji: 'マッチ',
          hiragana: 'Macchi',
          romaji: 'Macchi',
          meaning: 'Partido, cerilla, fósforo - Katakana',
        ),
        Flashcard(
          kanji: '町',
          hiragana: 'まち',
          romaji: 'Machi',
          meaning: 'Ciudad, pueblo',
        ),
        Flashcard(
          kanji: 'まだ',
          hiragana: 'mada',
          romaji: 'mada',
          meaning: 'Aún (no), todavía - Adverbio',
        ),
        Flashcard(
          kanji: '窓',
          hiragana: 'まど',
          romaji: 'mado',
          meaning: 'Ventana',
        ),
        Flashcard(
          kanji: '前',
          hiragana: 'まえ',
          romaji: 'mae',
          meaning: 'Delante, antes (de), enfrente - Sufijo',
        ),
        Flashcard(
          kanji: '曲がる',
          hiragana: 'まがる',
          romaji: 'magaru',
          meaning: 'Girar (Ej. Una esquina) - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '毎朝',
          hiragana: 'まいあさ',
          romaji: 'maiasa',
          meaning: 'Cada mañana',
        ),
        Flashcard(
          kanji: '毎晩',
          hiragana: 'まいばん',
          romaji: 'maiban',
          meaning: 'Cada noche',
        ),
        Flashcard(
          kanji: '毎日',
          hiragana: 'まいにち',
          romaji: 'mainichi',
          meaning: 'Todos los días',
        ),
        Flashcard(
          kanji: '毎週',
          hiragana: 'まいしゅう',
          romaji: 'maishuu',
          meaning: 'Cada semana',
        ),
        Flashcard(
          kanji: '毎年',
          hiragana: 'まいとし',
          romaji: 'maitoshi',
          meaning: 'Cada año',
        ),
        Flashcard(
          kanji: '毎月',
          hiragana: 'まいつき',
          romaji: 'maitsuki',
          meaning: 'Cada mes',
        ),
        Flashcard(
          kanji: '万',
          hiragana: 'まん',
          romaji: 'man',
          meaning: 'Diez mil - Número',
        ),
        Flashcard(
          kanji: '万年筆',
          hiragana: 'まんねんひつ',
          romaji: 'mannenhitsu',
          meaning: 'Pluma estilográfica',
        ),
        Flashcard(
          kanji: '丸い',
          hiragana: 'まるい',
          romaji: 'marui',
          meaning: 'Redondo, circular - Adj い',
        ),
        Flashcard(
          kanji: '真っ直ぐ',
          hiragana: 'まっすぐ',
          romaji: 'massugu',
          meaning: 'Recto, directo, derecho (adelante) - Adj な',
        ),
        Flashcard(
          kanji: '待つ',
          hiragana: 'まつ',
          romaji: 'matsu',
          meaning: 'Esperar - Verb. Intransitivo, transitivo',
        ),
        Flashcard(
          kanji: '不味い',
          hiragana: 'まずい',
          romaji: 'mazui',
          meaning: 'Malo (sabor desagradable, no delicioso) - Adj い',
        ),
        Flashcard(
          kanji: '道',
          hiragana: 'みち',
          romaji: 'michi',
          meaning: 'Carretera, calle, camino',
        ),
        Flashcard(
          kanji: '緑',
          hiragana: 'みどり',
          romaji: 'midori',
          meaning: 'Verde',
        ),
        Flashcard(
          kanji: '磨く',
          hiragana: 'みがく',
          romaji: 'migaku',
          meaning:
              'Cepillar (dientes), pulir (Ej. Zapatos), dar brillo - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '右',
          hiragana: 'みぎ',
          romaji: 'migi',
          meaning: 'Derecha',
        ),
        Flashcard(
          kanji: '短い',
          hiragana: 'みじかい',
          romaji: 'mijikai',
          meaning: 'Corto - Adj い',
        ),
        Flashcard(
          kanji: '三日',
          hiragana: 'みっか',
          romaji: 'mikka',
          meaning: 'Tercer día, tres días',
        ),
        Flashcard(
          kanji: '耳',
          hiragana: 'みみ',
          romaji: 'mimi',
          meaning: 'Oreja',
        ),
        Flashcard(
          kanji: '南',
          hiragana: 'みなみ',
          romaji: 'minami',
          meaning: 'Sur',
        ),
        Flashcard(
          kanji: '皆さん',
          hiragana: 'みなさん',
          romaji: 'minasan',
          meaning: 'Todos (ustedes)',
        ),
        Flashcard(
          kanji: 'みんな',
          hiragana: 'minna',
          romaji: 'minna',
          meaning: 'Todos - Adverbio',
        ),
        Flashcard(
          kanji: '見る',
          hiragana: 'みる',
          romaji: 'miru',
          meaning: 'Ver, mirar, observar - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '店',
          hiragana: 'みせ',
          romaji: 'mise',
          meaning: 'Tienda',
        ),
        Flashcard(
          kanji: '見せる',
          hiragana: 'みせる',
          romaji: 'miseru',
          meaning: 'Mostrar - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '三つ',
          hiragana: 'みっつ',
          romaji: 'mittsu',
          meaning: 'Tres (Contador estándar)',
        ),
        Flashcard(
          kanji: '水',
          hiragana: 'みず',
          romaji: 'mizu',
          meaning: 'Agua',
        ),
        Flashcard(
          kanji: '木曜日',
          hiragana: 'もくようび',
          romaji: 'mokuyoubi',
          meaning: 'Jueves',
        ),
        Flashcard(
          kanji: '門',
          hiragana: 'もん',
          romaji: 'mon',
          meaning: 'Puerta',
        ),
        Flashcard(
          kanji: '問題',
          hiragana: 'もんだい',
          romaji: 'mondai',
          meaning: 'Pregunta (Ej. En un examen), Problema',
        ),
        Flashcard(
          kanji: '物',
          hiragana: 'もの',
          romaji: 'mono',
          meaning: 'Cosa, objeto, artículo',
        ),
        Flashcard(
          kanji: '持つ',
          hiragana: 'もつ',
          romaji: 'motsu',
          meaning: 'Tomar, llevar, sostener (en la mano)',
        ),
        Flashcard(
          kanji: 'もっと',
          hiragana: 'motto',
          romaji: 'motto',
          meaning: 'Más',
        ),
        Flashcard(
          kanji: 'もう一度',
          hiragana: 'もういちど',
          romaji: 'mou ichido',
          meaning: 'Una vez más, otra vez',
        ),
        Flashcard(
          kanji: '六日',
          hiragana: 'むいか',
          romaji: 'muika',
          meaning: 'Sexto día, seis días',
        ),
        Flashcard(
          kanji: '向こう',
          hiragana: 'むこう',
          romaji: 'mukou',
          meaning: 'Allá, alado opuesto, otro lado, por ahí',
        ),
        Flashcard(
          kanji: '村',
          hiragana: 'むら',
          romaji: 'mura',
          meaning: 'Aldea',
        ),
        Flashcard(
          kanji: '六つ',
          hiragana: 'むっつ',
          romaji: 'muttsu',
          meaning: 'Seis (contador estándar)',
        ),
        Flashcard(
          kanji: '難しい',
          hiragana: 'むずかしい',
          romaji: 'muzukashii',
          meaning: 'Difícil - Adj い',
        ),
        Flashcard(
          kanji: '長い',
          hiragana: 'ながい',
          romaji: 'nagai',
          meaning: 'Largo - Adj い',
        ),
        Flashcard(
          kanji: 'ナイフ',
          hiragana: 'naifu',
          romaji: 'naifu',
          meaning: 'Cuchillo - Katakana',
        ),
        Flashcard(
          kanji: '中',
          hiragana: 'なか',
          romaji: 'naka',
          meaning: 'Dentro (de), medio, entre, centro',
        ),
        Flashcard(
          kanji: '鳴く',
          hiragana: 'なく',
          romaji: 'naku',
          meaning: 'Piar (pájaro), ladrar, ronronear, hacer sonido (animal)',
        ),
        Flashcard(
          kanji: '無くす',
          hiragana: 'なくす',
          romaji: 'nakusu',
          meaning:
              'Perder (algo), perder a alguien (familiar) - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '名前',
          hiragana: 'なまえ',
          romaji: 'namae',
          meaning: 'Nombre',
        ),
        Flashcard(
          kanji: '七つ',
          hiragana: 'ななつ',
          romaji: 'nanatsu',
          meaning: 'Siete (Contador estándar)',
        ),
        Flashcard(
          kanji: '何',
          hiragana: 'なに',
          romaji: 'nani',
          meaning: 'Qué, cuál',
        ),
        Flashcard(
          kanji: '七日',
          hiragana: 'なのか',
          romaji: 'nanoka',
          meaning: 'Día siete del mes, siete días',
        ),
        Flashcard(
          kanji: '並べる',
          hiragana: 'ならべる',
          romaji: 'naraberu',
          meaning: 'Colocar alineados, poner en fila - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '並ぶ',
          hiragana: 'ならぶ',
          romaji: 'narabu',
          meaning: 'Estar en fila, alinearse - verb intransitivo',
        ),
        Flashcard(
          kanji: '習う',
          hiragana: 'ならう',
          romaji: 'narau',
          meaning: 'Aprender',
        ),
        Flashcard(
          kanji: '夏',
          hiragana: 'なつ',
          romaji: 'natsu',
          meaning: 'Verano',
        ),
        Flashcard(
          kanji: '夏休み',
          hiragana: 'なつやすみ',
          romaji: 'natsuyasumi',
          meaning: 'Vacaciones de verano',
        ),
        Flashcard(
          kanji: 'なぜ',
          hiragana: 'naze',
          romaji: 'naze',
          meaning: '¿Por qué? - Adverbio',
        ),
        Flashcard(
          kanji: '猫',
          hiragana: 'ねこ',
          romaji: 'neko',
          meaning: 'Gato',
        ),
        Flashcard(
          kanji: 'ネクタイ',
          hiragana: 'nekutai',
          romaji: 'nekutai',
          meaning: 'Corbata - Katakana',
        ),
        Flashcard(
          kanji: '寝る',
          hiragana: 'ねる',
          romaji: 'neru',
          meaning:
              'Dormir, acostarse (en la cama), tumbarse - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '二',
          hiragana: 'に',
          romaji: 'ni',
          meaning: 'Dos - Número',
        ),
        Flashcard(
          kanji: '日曜日',
          hiragana: 'にちようび',
          romaji: 'nichiyoubi',
          meaning: 'Domingo',
        ),
        Flashcard(
          kanji: '飲み物',
          hiragana: 'のみもの',
          romaji: 'nomimono',
          meaning: 'Bebida',
        ),
        Flashcard(
          kanji: '飲む',
          hiragana: 'のむ',
          romaji: 'nomu',
          meaning: 'Beber - Verb. Transitivo',
        ),
        Flashcard(
          kanji: 'ノート',
          hiragana: 'nooto',
          romaji: 'nooto',
          meaning: 'Cuaderno, bloc de notas - Katakana',
        ),
        Flashcard(
          kanji: '乗る',
          hiragana: 'のる',
          romaji: 'noru',
          meaning:
              'Montar, subirse (tren, bicicleta, avión...) - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '脱ぐ',
          hiragana: 'ぬぐ',
          romaji: 'nugu',
          meaning: 'Desvestirse, quitarse (ropa) - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '温い',
          hiragana: 'ぬるい',
          romaji: 'nurui',
          meaning: 'Tibio, caliente (referente a temperatura) - Adj い',
        ),
        Flashcard(
          kanji: 'ニュース',
          hiragana: 'ニュース',
          romaji: 'nyuusu',
          meaning: 'Noticias - Katakana',
        ),
        Flashcard(
          kanji: 'お伯母さん',
          hiragana: 'おばあさん',
          romaji: 'obaasan',
          meaning: 'Abuela, señora mayor',
        ),
        Flashcard(
          kanji: 'おばさん',
          hiragana: 'obasan',
          romaji: 'obasan',
          meaning: 'Tía (mujer mayor que la hablante)',
        ),
        Flashcard(
          kanji: 'お弁当',
          hiragana: 'おべんとう',
          romaji: 'obentou',
          meaning: 'Comida para llevar, almuerzo preparado',
        ),
        Flashcard(
          kanji: '覚える',
          hiragana: 'おぼえる',
          romaji: 'oboeru',
          meaning:
              'Recordar, memorizar, aprender de memoria - Verb. Transitivo',
        ),
        Flashcard(
          kanji: 'お茶',
          hiragana: 'おちゃ',
          romaji: 'ocha',
          meaning: 'Té',
        ),
        Flashcard(
          kanji: 'お風呂',
          hiragana: 'おふろ',
          romaji: 'ofuro',
          meaning: 'Baño (tina o bañera)',
        ),
        Flashcard(
          kanji: 'おいしい',
          hiragana: 'おいしい',
          romaji: 'oishii',
          meaning: 'Delicioso - Adj い',
        ),
        Flashcard(
          kanji: 'おじさん',
          hiragana: 'おじさん',
          romaji: 'ojisan',
          meaning: 'Tío (hombre mayor que el hablante)',
        ),
        Flashcard(
          kanji: 'お祖父さん',
          hiragana: 'おじいさん',
          romaji: 'ojiisan',
          meaning: 'Abuelo, hombre mayor',
        ),
        Flashcard(
          kanji: 'お母さん',
          hiragana: 'おかあさん',
          romaji: 'okaasan',
          meaning: 'Mamá, madre',
        ),
        Flashcard(
          kanji: 'お金',
          hiragana: 'おかね',
          romaji: 'okane',
          meaning: 'Dinero',
        ),
        Flashcard(
          kanji: 'お菓子',
          hiragana: 'おかし',
          romaji: 'okashi',
          meaning: 'Dulces, golosinas',
        ),
        Flashcard(
          kanji: '起きる',
          hiragana: 'おきる',
          romaji: 'okiru',
          meaning: 'Despertarse, levantarse - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '置く',
          hiragana: 'おく',
          romaji: 'oku',
          meaning:
              'Poner, colocar, dejar algo en cierto estado - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '奥さん',
          hiragana: 'おくさん',
          romaji: 'okusan',
          meaning: 'Esposa (de otra persona), señora',
        ),
        Flashcard(
          kanji: 'お巡りさん',
          hiragana: 'おまわいさん',
          romaji: 'omawarisan',
          meaning: 'Policía',
        ),
        Flashcard(
          kanji: '思い',
          hiragana: 'おもい',
          romaji: 'omoi',
          meaning: 'Sentimiento, pensamiento, imaginación - Adj い',
        ),
        Flashcard(
          kanji: '重い',
          hiragana: 'おもい',
          romaji: 'omoi',
          meaning:
              'Pesado, masivo, grave, serio, pesado (alguien que está lento) - Adj い',
        ),
        Flashcard(
          kanji: '面白い',
          hiragana: 'おもしろい',
          romaji: 'omoshiroi',
          meaning: 'Interesante, divertido - Adj い',
        ),
        Flashcard(
          kanji: '同じ',
          hiragana: 'おなじ',
          romaji: 'onaji',
          meaning: 'Mismo, igual - Adverbio',
        ),
        Flashcard(
          kanji: 'お腹',
          hiragana: 'おなか',
          romaji: 'onaka',
          meaning: 'Estómago',
        ),
        Flashcard(
          kanji: 'お姉さん',
          hiragana: 'おねえさん',
          romaji: 'oneesan',
          meaning: 'Hermana mayor (de otra persona)',
        ),
        Flashcard(
          kanji: '音楽',
          hiragana: 'おんがく',
          romaji: 'ongaku',
          meaning: 'Música',
        ),
        Flashcard(
          kanji: 'お兄さん',
          hiragana: 'おにいさん',
          romaji: 'oniisan',
          meaning: 'Hermano mayor (de otra persona)',
        ),
        Flashcard(
          kanji: '女',
          hiragana: 'おんな',
          romaji: 'onna',
          meaning: 'Mujer',
        ),
        Flashcard(
          kanji: '女の子',
          hiragana: 'おんなのこ',
          romaji: 'onnanoko',
          meaning: 'Niña, chica',
        ),
        Flashcard(
          kanji: '多い',
          hiragana: 'おおい',
          romaji: 'ooi',
          meaning: 'Muchos, numerosos - Adj い',
        ),
        Flashcard(
          kanji: '大きい',
          hiragana: 'おおきい',
          romaji: 'ookii',
          meaning: 'Grande, grandioso, importante - Adj い',
        ),
        Flashcard(
          kanji: '大きな',
          hiragana: 'おおきな',
          romaji: 'ookina',
          meaning: 'Gran (forma adjetival de "grande") - Adj な',
        ),
        Flashcard(
          kanji: '大勢',
          hiragana: 'おおぜい',
          romaji: 'oozei',
          meaning: 'Mucha gente, multitud, numerosos, gran cantidad de...',
        ),
        Flashcard(
          kanji: '降りる',
          hiragana: 'おりる',
          romaji: 'oriru',
          meaning: 'Bajar, descender (de un vehículo) - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: 'お酒',
          hiragana: 'おさけ',
          romaji: 'osake',
          meaning: 'Alcohol, licor',
        ),
        Flashcard(
          kanji: 'お皿',
          hiragana: 'おさら',
          romaji: 'osara',
          meaning: 'Plato (objeto)',
        ),
        Flashcard(
          kanji: '教える',
          hiragana: 'おしえる',
          romaji: 'oshieru',
          meaning: 'Enseñar, instruir, educar, informar - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '遅い',
          hiragana: 'おそい',
          romaji: 'osoi',
          meaning: 'Tarde, lento - Adj い',
        ),
        Flashcard(
          kanji: '押す',
          hiragana: 'おす',
          romaji: 'osu',
          meaning: 'Presionar, empujar, apretar - Verb. Transitivo',
        ),
        Flashcard(
          kanji: 'お手洗い',
          hiragana: 'おてあらい',
          romaji: 'otearai',
          meaning: 'Baño, lavabo',
        ),
        Flashcard(
          kanji: '男',
          hiragana: 'おとこ',
          romaji: 'otoko',
          meaning: 'Hombre',
        ),
        Flashcard(
          kanji: '男の子',
          hiragana: 'おとこのこ',
          romaji: 'otokonoko',
          meaning: 'Niño, chico',
        ),
        Flashcard(
          kanji: '大人',
          hiragana: 'おとな',
          romaji: 'otona',
          meaning: 'Adulto',
        ),
        Flashcard(
          kanji: '一昨日',
          hiragana: 'おととい',
          romaji: 'ototoi',
          meaning: 'Anteayer, el día antes de ayer',
        ),
        Flashcard(
          kanji: '一昨年',
          hiragana: 'おととし',
          romaji: 'ototoshi',
          meaning: 'Hace dos años, el año anterior al pasado',
        ),
        Flashcard(
          kanji: 'お父さん',
          hiragana: 'おとうさん',
          romaji: 'otousan',
          meaning: 'Papá, padre',
        ),
        Flashcard(
          kanji: '弟',
          hiragana: 'おとうと',
          romaji: 'otouto',
          meaning: 'Hermano menor',
        ),
        Flashcard(
          kanji: '終わる',
          hiragana: 'おわる',
          romaji: 'owaru',
          meaning: 'Terminar, finalizar - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '泳ぐ',
          hiragana: 'およぐ',
          romaji: 'oyogu',
          meaning: 'Nadar - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: 'パーティー',
          hiragana: 'パーティー',
          romaji: 'paatii',
          meaning: 'Fiesta, party (en inglés) - Katakana',
        ),
        Flashcard(
          kanji: 'パン',
          hiragana: 'パン',
          romaji: 'pan',
          meaning: 'Pan - Katakana',
        ),
        Flashcard(
          kanji: 'ページ',
          hiragana: 'ページ',
          romaji: 'peeji',
          meaning: 'Página - Katakana',
        ),
        Flashcard(
          kanji: 'ペン',
          hiragana: 'ペン',
          romaji: 'pen',
          meaning: 'Bolígrafo, pluma - Katakana',
        ),
        Flashcard(
          kanji: 'ペット',
          hiragana: 'ペット',
          romaji: 'petto',
          meaning: 'Mascota, animal doméstico - Katakana',
        ),
        Flashcard(
          kanji: 'ポケット',
          hiragana: 'ポケット',
          romaji: 'poketto',
          meaning: 'Bolsillo (Ej. De pantalón) - Katakana',
        ),
        Flashcard(
          kanji: 'ポスト',
          hiragana: 'posuto',
          romaji: 'posuto',
          meaning: 'Buzón - Katakana',
        ),
        Flashcard(
          kanji: 'プール',
          hiragana: 'プール',
          romaji: 'puuru',
          meaning: 'Piscina - Katakana',
        ),
        Flashcard(
          kanji: '来月',
          hiragana: 'らいげつ',
          romaji: 'raigetsu',
          meaning: 'El próximo mes, el mes siguiente',
        ),
        Flashcard(
          kanji: '来年',
          hiragana: 'らいねん',
          romaji: 'rainen',
          meaning: 'El próximo año',
        ),
        Flashcard(
          kanji: '来週',
          hiragana: 'らいしゅう',
          romaji: 'raishuu',
          meaning: 'La próxima semana',
        ),
        Flashcard(
          kanji: 'ラジオ',
          hiragana: 'らじお',
          romaji: 'rajio',
          meaning: 'Radio - Katakana',
        ),
        Flashcard(
          kanji: '零',
          hiragana: 'れい',
          romaji: 'rei',
          meaning: 'Cero',
        ),
        Flashcard(
          kanji: '冷蔵庫',
          hiragana: 'れいぞうこ',
          romaji: 'reizouko',
          meaning: 'Refrigerador, nevera',
        ),
        Flashcard(
          kanji: 'レコード',
          hiragana: 'rekoodo',
          romaji: 'rekoodo',
          meaning: 'Disco de vinilo, grabación - Katakana',
        ),
        Flashcard(
          kanji: '練習',
          hiragana: 'れんしゅう',
          romaji: 'renshuu',
          meaning: 'Práctica, ejercicio - Verbo suru',
        ),
        Flashcard(
          kanji: 'レストラン',
          hiragana: 'resutoran',
          romaji: 'resutoran',
          meaning: 'Restaurante - Katakana',
        ),
        Flashcard(
          kanji: '立派',
          hiragana: 'りっぱ',
          romaji: 'rippa',
          meaning: 'Espléndido, magnífico - Adj な',
        ),
        Flashcard(
          kanji: '六',
          hiragana: 'ろく',
          romaji: 'roku',
          meaning: 'Seis - Número',
        ),
        Flashcard(
          kanji: '廊下',
          hiragana: 'ろうか',
          romaji: 'rouka',
          meaning: 'Pasillo',
        ),
        Flashcard(
          kanji: '旅行',
          hiragana: 'りょこう',
          romaji: 'ryokou',
          meaning: 'Viaje - Verbo suru',
        ),
        Flashcard(
          kanji: '料理',
          hiragana: 'りょうり',
          romaji: 'ryouri',
          meaning: 'Cocinar, cocina - Verbo suru',
        ),
        Flashcard(
          kanji: '両親',
          hiragana: 'りょうしん',
          romaji: 'ryoushin',
          meaning: 'Padres (madre y padre)',
        ),
        Flashcard(
          kanji: '留学生',
          hiragana: 'りゅうがくせい',
          romaji: 'ryuugakusei',
          meaning: 'Estudiante extranjero, estudiante internacional',
        ),
        Flashcard(
          kanji: 'さあ',
          hiragana: 'さあ',
          romaji: 'saa',
          meaning: 'Bueno..., bien, a ver - Conjunción',
        ),
        Flashcard(
          kanji: '財布',
          hiragana: 'さいふ',
          romaji: 'saifu',
          meaning: 'Billetera, cartera',
        ),
        Flashcard(
          kanji: '魚',
          hiragana: 'さかな',
          romaji: 'sakana',
          meaning: 'Pescado, pez',
        ),
        Flashcard(
          kanji: '先',
          hiragana: 'さき',
          romaji: 'saki',
          meaning: 'Anterior, viejo, previo, primero - Prefijo',
        ),
        Flashcard(
          kanji: '咲く',
          hiragana: 'さく',
          romaji: 'saku',
          meaning: 'Florecer - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '作文',
          hiragana: 'さくぶん',
          romaji: 'sakubun',
          meaning: 'Composición, ensayo',
        ),
        Flashcard(
          kanji: '寒い',
          hiragana: 'さむい',
          romaji: 'samui',
          meaning: 'Frío (clima) - Adj い',
        ),
        Flashcard(
          kanji: '三',
          hiragana: 'さん',
          romaji: 'san',
          meaning: 'Tres - Número',
        ),
        Flashcard(
          kanji: '散歩',
          hiragana: 'さんぽ',
          romaji: 'sanpo',
          meaning: 'Paseo - Verbo suru',
        ),
        Flashcard(
          kanji: '再来年',
          hiragana: 'さらいねん',
          romaji: 'sarainen',
          meaning: 'Dentro de dos años, el año después del próximo',
        ),
        Flashcard(
          kanji: '差す',
          hiragana: 'さす',
          romaji: 'sasu',
          meaning:
              'Estirar las manos, levantar (un paraguas) - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '砂糖',
          hiragana: 'さとう',
          romaji: 'satou',
          meaning: 'Azúcar',
        ),
        Flashcard(
          kanji: '背',
          hiragana: 'せ、せい',
          romaji: 'se, sei',
          meaning: 'Altura, estatura',
        ),
        Flashcard(
          kanji: '背広',
          hiragana: 'せびろ',
          romaji: 'sebiro',
          meaning: 'Traje de negocios (masculino y femenino)',
        ),
        Flashcard(
          kanji: 'セーター',
          hiragana: 'seetaa',
          romaji: 'seetaa',
          meaning: 'Suéter, jersey - Katakana',
        ),
        Flashcard(
          kanji: '生徒',
          hiragana: 'せいと',
          romaji: 'seito',
          meaning: 'Estudiante (primaria, secundaria)',
        ),
        Flashcard(
          kanji: '石鹼',
          hiragana: 'せっけん',
          romaji: 'sekken',
          meaning: 'Jabón',
        ),
        Flashcard(
          kanji: '狭い',
          hiragana: 'せまい',
          romaji: 'semai',
          meaning: 'Estrecho, angosto, pequeño - Adj い',
        ),
        Flashcard(
          kanji: '千',
          hiragana: 'せん',
          romaji: 'sen',
          meaning: 'Mil - Número',
        ),
        Flashcard(
          kanji: '先月',
          hiragana: 'せんげつ',
          romaji: 'sengetsu',
          meaning: 'El mes pasado',
        ),
        Flashcard(
          kanji: '先生',
          hiragana: 'せんせい',
          romaji: 'sensei',
          meaning: 'Maestro, profesor',
        ),
        Flashcard(
          kanji: '先週',
          hiragana: 'せんしゅう',
          romaji: 'senshuu',
          meaning: 'La semana pasada',
        ),
        Flashcard(
          kanji: '選択',
          hiragana: 'せんたく',
          romaji: 'sentaku',
          meaning: 'Elección, selección, opción - Verbo suru',
        ),
        Flashcard(
          kanji: '写真',
          hiragana: 'しゃしん',
          romaji: 'shashin',
          meaning: 'Fotografía, foto, imagen',
        ),
        Flashcard(
          kanji: 'シャツ',
          hiragana: 'shatsu',
          romaji: 'shatsu',
          meaning: 'Camisa, camiseta - Katakana',
        ),
        Flashcard(
          kanji: 'シャワー',
          hiragana: 'shawaa',
          romaji: 'shawaa',
          meaning: 'Ducha - Katakana',
        ),
        Flashcard(
          kanji: '四',
          hiragana: 'し',
          romaji: 'shi',
          meaning: 'Cuatro - Número',
        ),
        Flashcard(
          kanji: '七',
          hiragana: 'しち',
          romaji: 'shichi',
          meaning: 'Siete - Número',
        ),
        Flashcard(
          kanji: '仕事',
          hiragana: 'しごと',
          romaji: 'shigoto',
          meaning: 'Trabajo, empleo - Verbo suru',
        ),
        Flashcard(
          kanji: '閉まる',
          hiragana: 'しまる',
          romaji: 'shimaru',
          meaning: 'Cerrar(se) - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '閉める',
          hiragana: 'しめる',
          romaji: 'shimeru',
          meaning: 'Cerrar (algo) - Transitivo',
        ),
        Flashcard(
          kanji: '締める',
          hiragana: 'しめる',
          romaji: 'shimeru',
          meaning: 'Apretar, atar, cerrar (con fuerza) - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '新聞',
          hiragana: 'しんぶん',
          romaji: 'shinbun',
          meaning: 'Periódico',
        ),
        Flashcard(
          kanji: '死ぬ',
          hiragana: 'しぬ',
          romaji: 'shinu',
          meaning: 'Morir, fallecer - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '塩',
          hiragana: 'しお',
          romaji: 'shio',
          meaning: 'Sal',
        ),
        Flashcard(
          kanji: '白',
          hiragana: 'しろ',
          romaji: 'shiro',
          meaning: 'Blanco (color)',
        ),
        Flashcard(
          kanji: '白い',
          hiragana: 'しろい',
          romaji: 'shiroi',
          meaning: 'Blanco - Adj い',
        ),
        Flashcard(
          kanji: '知る',
          hiragana: 'しる',
          romaji: 'shiru',
          meaning: 'Saber, conocer - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '下',
          hiragana: 'した',
          romaji: 'shita',
          meaning: 'Abajo, debajo',
        ),
        Flashcard(
          kanji: '質問',
          hiragana: 'しつもん',
          romaji: 'shitsumon',
          meaning: 'Pregunta - Verbo suru',
        ),
        Flashcard(
          kanji: '静か',
          hiragana: 'しずか',
          romaji: 'shizuka',
          meaning: 'Silencioso, tranquilo - Adj な',
        ),
        Flashcard(
          kanji: '食堂',
          hiragana: 'しょくどう',
          romaji: 'shokudou',
          meaning: 'Comedor, cafetería, mesón',
        ),
        Flashcard(
          kanji: '醬油',
          hiragana: 'しょうゆ',
          romaji: 'shouyu',
          meaning: 'Salsa de soja',
        ),
        Flashcard(
          kanji: '宿題',
          hiragana: 'しゅくだい',
          romaji: 'shukudai',
          meaning: 'Deberes (estudios), tareas para el hogar',
        ),
        Flashcard(
          kanji: 'そば',
          hiragana: 'そば',
          romaji: 'soba',
          meaning: 'Cerca (de algo o alguien), fideos de trigo sarraceno',
        ),
        Flashcard(
          kanji: 'そっち',
          hiragana: 'そっち',
          romaji: 'socchi',
          meaning:
              'Allí, por ahí (referente a un lugar cercano al hablante y al oyente)',
        ),
        Flashcard(
          kanji: 'そちら',
          hiragana: 'そちら',
          romaji: 'sochira',
          meaning: 'Allí, por ahí (forma más formal que ' 'そっち' ')',
        ),
        Flashcard(
          kanji: 'そこ',
          hiragana: 'そこ',
          romaji: 'soko',
          meaning: 'Ahí (lugar)',
        ),
        Flashcard(
          kanji: 'その',
          hiragana: 'その',
          romaji: 'sono',
          meaning: 'Ese, esa, esos, esas - Adj. Posustantivo',
        ),
        Flashcard(
          kanji: '空',
          hiragana: 'そら',
          romaji: 'sora',
          meaning: 'Cielo, espacio',
        ),
        Flashcard(
          kanji: 'それ',
          hiragana: 'それ',
          romaji: 'sore',
          meaning: 'Eso, eso allí, aquel, aquello',
        ),
        Flashcard(
          kanji: 'それでは',
          hiragana: 'それでは',
          romaji: 'soredewa',
          meaning: 'Bueno entonces, en ese caso',
        ),
        Flashcard(
          kanji: 'そして',
          hiragana: 'そして',
          romaji: 'soshite',
          meaning: 'Y, además',
        ),
        Flashcard(
          kanji: '外',
          hiragana: 'そと',
          romaji: 'soto',
          meaning: 'Fuera, exterior',
        ),
        Flashcard(
          kanji: '掃除',
          hiragana: 'そうじ',
          romaji: 'souji',
          meaning: 'Limpieza - Verbo suru',
        ),
        Flashcard(
          kanji: 'すぎる',
          hiragana: 'すぎる',
          romaji: 'sugiru',
          meaning: 'Demasiado, excesivo',
        ),
        Flashcard(
          kanji: 'すぐに',
          hiragana: 'すぐに',
          romaji: 'suguni',
          meaning: 'Inmediatamente, pronto - Adverbio',
        ),
        Flashcard(
          kanji: '水曜日',
          hiragana: 'すいようび',
          romaji: 'suiyoubi',
          meaning: 'Miércoles',
        ),
        Flashcard(
          kanji: 'スカート',
          hiragana: 'スカート',
          romaji: 'sukaato',
          meaning: 'Falda - Katakana',
        ),
        Flashcard(
          kanji: '好き',
          hiragana: 'すき',
          romaji: 'suki',
          meaning: 'Gustar, me gusta - Adj な',
        ),
        Flashcard(
          kanji: '少し',
          hiragana: 'すこし',
          romaji: 'sukoshi',
          meaning: 'Poco/s, un poco, pequeña cantidad - Adverbio',
        ),
        Flashcard(
          kanji: '少ない',
          hiragana: 'すくない',
          romaji: 'sukunai',
          meaning: 'Poco, escaso, insuficiente - Adj い',
        ),
        Flashcard(
          kanji: '住む',
          hiragana: 'すむ',
          romaji: 'sumu',
          meaning: 'Vivir en, residir (intransitivo) - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: 'スポーツ',
          hiragana: 'スポーツ',
          romaji: 'supootsu',
          meaning: 'Deportes - Katakana',
        ),
        Flashcard(
          kanji: 'スプーン',
          hiragana: 'スプーン',
          romaji: 'supuun',
          meaning: 'Cuchara - Katakana',
        ),
        Flashcard(
          kanji: 'スリッパ',
          hiragana: 'スリッパ',
          romaji: 'surippa',
          meaning: 'Pantuflas, zapatillas de estar en casa - Katakana',
        ),
        Flashcard(
          kanji: 'ストーブ',
          hiragana: 'ストーブ',
          romaji: 'sutoobu',
          meaning: 'Estufa, calentador - Katakana',
        ),
        Flashcard(
          kanji: '吸う',
          hiragana: 'すう',
          romaji: 'suu',
          meaning: 'Fumar, inhalar, chupar, sorber - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '座る',
          hiragana: 'すわる',
          romaji: 'suwaru',
          meaning: 'Sentarse - Verbo intransitivo',
        ),
        Flashcard(
          kanji: '涼しい',
          hiragana: 'すずしい',
          romaji: 'suzushii',
          meaning: 'Fresco (tiempo), fresquito - Adj い',
        ),
        Flashcard(
          kanji: 'タバコ',
          hiragana: 'タバコ',
          romaji: 'tabako',
          meaning: 'Tabaco',
        ),
        Flashcard(
          kanji: '食べ物',
          hiragana: 'たべもの',
          romaji: 'tabemono',
          meaning: 'Comida',
        ),
        Flashcard(
          kanji: '食べる',
          hiragana: 'たべる',
          romaji: 'taberu',
          meaning: 'Comer - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '多分',
          hiragana: 'たぶん',
          romaji: 'tabun',
          meaning: 'Probablemente, quizás - Adj な',
        ),
        Flashcard(
          kanji: '大変',
          hiragana: 'たいへん',
          romaji: 'taihen',
          meaning: 'Muy, mucho, difícil, difícilmente - Adj な',
        ),
        Flashcard(
          kanji: '大切',
          hiragana: 'たいせつ',
          romaji: 'taisetsu',
          meaning: 'Importante, necesario, valioso, apreciado - Adj な',
        ),
        Flashcard(
          kanji: '大使館',
          hiragana: 'たいしかん',
          romaji: 'taishikan',
          meaning: 'Embajada',
        ),
        Flashcard(
          kanji: '高い',
          hiragana: 'たかい',
          romaji: 'takai',
          meaning: 'Alto, caro - Adj い',
        ),
        Flashcard(
          kanji: 'たくさん',
          hiragana: 'たくさん',
          romaji: 'takusan',
          meaning: 'Mucho, muchos - Sustantivo Adverbial',
        ),
        Flashcard(
          kanji: 'タクシー',
          hiragana: 'タクシー',
          romaji: 'takushii',
          meaning: 'Taxi - Katakana',
        ),
        Flashcard(
          kanji: '卵',
          hiragana: 'たまご',
          romaji: 'tamago',
          meaning: 'Huevo',
        ),
        Flashcard(
          kanji: '誕生日',
          hiragana: 'たんじょうび',
          romaji: 'tanjoubi',
          meaning: 'Cumpleaños',
        ),
        Flashcard(
          kanji: '頼む',
          hiragana: 'たのむ',
          romaji: 'tanomu',
          meaning: 'Pedir, rogar - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '楽しい',
          hiragana: 'たのしい',
          romaji: 'tanoshii',
          meaning: 'Divertido - Adj い',
        ),
        Flashcard(
          kanji: '縦',
          hiragana: 'たて',
          romaji: 'tate',
          meaning: 'Vertical, la altura, de adelante hacia atrás',
        ),
        Flashcard(
          kanji: '建物',
          hiragana: 'たてもの',
          romaji: 'tatemono',
          meaning: 'Edificio',
        ),
        Flashcard(
          kanji: '立つ',
          hiragana: 'たつ',
          romaji: 'tatsu',
          meaning: 'Estar de pie, levantarse - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '手',
          hiragana: 'て',
          romaji: 'te',
          meaning: 'Mano',
        ),
        Flashcard(
          kanji: 'テーブル',
          hiragana: 'テーブル',
          romaji: 'teeburu',
          meaning: 'Mesa - Katakana',
        ),
        Flashcard(
          kanji: 'テープ',
          hiragana: 'テープ',
          romaji: 'teepu',
          meaning: 'Cinta (adhesiva) - Katakana',
        ),
        Flashcard(
          kanji: 'テープレコーダー',
          hiragana: 'テープレコーダー',
          romaji: 'teepurekooda',
          meaning: 'Grabadora de cinta - Katakana',
        ),
        Flashcard(
          kanji: '手紙',
          hiragana: 'てがみ',
          romaji: 'tegami',
          meaning: 'Carta',
        ),
        Flashcard(
          kanji: '天気',
          hiragana: 'てんき',
          romaji: 'tenki',
          meaning: 'Clima, tiempo atmosférico',
        ),
        Flashcard(
          kanji: 'テレビ',
          hiragana: 'テレビ',
          romaji: 'terebi',
          meaning: 'Televisión - Katakana',
        ),
        Flashcard(
          kanji: 'テスト',
          hiragana: 'テスト',
          romaji: 'tesuto',
          meaning: 'Prueba, test - Katakana',
        ),
        Flashcard(
          kanji: '戸',
          hiragana: 'と',
          romaji: 'to',
          meaning: 'Puerta (corredera, estilo japonés)',
        ),
        Flashcard(
          kanji: '飛ぶ',
          hiragana: 'とぶ',
          romaji: 'tobu',
          meaning: 'Volar - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: 'トイレ',
          hiragana: 'トイレ',
          romaji: 'toire',
          meaning: 'Toilet, baño, inodoro, aseo, servicio, váter - Katakana',
        ),
        Flashcard(
          kanji: '時計',
          hiragana: 'とけい',
          romaji: 'tokei',
          meaning: 'Reloj',
        ),
        Flashcard(
          kanji: '時',
          hiragana: 'とき',
          romaji: 'toki',
          meaning: 'Tiempo, momento, cuando',
        ),
        Flashcard(
          kanji: '時々',
          hiragana: 'ときどき',
          romaji: 'tokidoki',
          meaning: 'A veces - Adverbio',
        ),
        Flashcard(
          kanji: '所',
          hiragana: 'ところ',
          romaji: 'tokoro',
          meaning: 'Lugar, contador de lugares - Sufijo',
        ),
        Flashcard(
          kanji: '止まる',
          hiragana: 'とまる',
          romaji: 'tomaru',
          meaning: 'Pararse, detenerse - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '友達',
          hiragana: 'ともだち',
          romaji: 'tomodachi',
          meaning: 'Amigo, compañero',
        ),
        Flashcard(
          kanji: '隣',
          hiragana: 'となり',
          romaji: 'tonari',
          meaning: 'Al lado, vecino, contiguo',
        ),
        Flashcard(
          kanji: '遠い',
          hiragana: 'とおい',
          romaji: 'tooi',
          meaning: 'Lejos, distante - Adj い',
        ),
        Flashcard(
          kanji: '十日',
          hiragana: 'とおか',
          romaji: 'tooka',
          meaning: 'Día 10 del mes, diez días',
        ),
        Flashcard(
          kanji: '鳥',
          hiragana: 'とり',
          romaji: 'tori',
          meaning: 'Pájaro, ave',
        ),
        Flashcard(
          kanji: '鶏肉',
          hiragana: 'とりにく',
          romaji: 'toriniku',
          meaning: 'Carne de pollo',
        ),
        Flashcard(
          kanji: '撮る',
          hiragana: 'とる',
          romaji: 'toru',
          meaning: 'Tomar una foto, filmar - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '取る',
          hiragana: 'とる',
          romaji: 'toru',
          meaning:
              'Tomar, agarrar, recoger, cosechar, ganar, elegir, tener (tiempo, una comida) - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '年',
          hiragana: 'とし',
          romaji: 'toshi',
          meaning: 'Año, contador para años',
        ),
        Flashcard(
          kanji: '図書館',
          hiragana: 'としょかん',
          romaji: 'toshokan',
          meaning: 'Biblioteca',
        ),
        Flashcard(
          kanji: 'とても',
          hiragana: 'とても',
          romaji: 'totemo',
          meaning: 'Muy (Ej: Muy bueno) - Adverbio',
        ),
        Flashcard(
          kanji: '次',
          hiragana: 'つぎ',
          romaji: 'tsugi',
          meaning: 'Siguiente, Próximo',
        ),
        Flashcard(
          kanji: '一日',
          hiragana: 'ついたち',
          romaji: 'tsuitachi',
          meaning: 'Primer día del mes, un día',
        ),
        Flashcard(
          kanji: '疲れる',
          hiragana: 'つかれる',
          romaji: 'tsukareru',
          meaning: 'Cansarse - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '使う',
          hiragana: 'つかう',
          romaji: 'tsukau',
          meaning: 'Usar - Verb. Transitivo',
        ),
        Flashcard(
          kanji: 'つける',
          hiragana: 'つける',
          romaji: 'tsukeru',
          meaning: 'Pegar, adherir, unir, anexar - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '着く',
          hiragana: 'つく',
          romaji: 'tsuku',
          meaning: 'Llegar (a un lugar) - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '机',
          hiragana: 'つくえ',
          romaji: 'tsukue',
          meaning: 'Escritorio, Mesa',
        ),
        Flashcard(
          kanji: '作る',
          hiragana: 'つくる',
          romaji: 'tsukuru',
          meaning:
              'Hacer, crear, producir, fabricar, preparar (comida) - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '詰まらない',
          hiragana: 'つまらない',
          romaji: 'tsumaranai',
          meaning:
              'Aburrido, poco interesante, insignificante, inútil, sin importancia - Adj い',
        ),
        Flashcard(
          kanji: '冷たい',
          hiragana: 'つめたい',
          romaji: 'tsumetai',
          meaning: 'Frío (al tacto) - Adj い',
        ),
        Flashcard(
          kanji: 'つもり',
          hiragana: 'つもり',
          romaji: 'tsumori',
          meaning: 'Plan, Intención',
        ),
        Flashcard(
          kanji: '勤める',
          hiragana: 'つとめる',
          romaji: 'tsutomeru',
          meaning: 'Trabajar (forma casual) - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '強い',
          hiragana: 'つよい',
          romaji: 'tsuyoi',
          meaning: 'Fuerte, potente, poderoso, resistente - Adj い',
        ),
        Flashcard(
          kanji: '上',
          hiragana: 'うえ',
          romaji: 'ue',
          meaning:
              'Arriba, encima, sobre, mayor (Ej. alguien mayor que tú) - Sufijo',
        ),
        Flashcard(
          kanji: '生まれる',
          hiragana: 'うまれる',
          romaji: 'umareru',
          meaning: 'Nacer - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '海',
          hiragana: 'うみ',
          romaji: 'umi',
          meaning: 'Mar, playa',
        ),
        Flashcard(
          kanji: '売る',
          hiragana: 'うる',
          romaji: 'uru',
          meaning: 'Vender - Verb. Transitivo',
        ),
        Flashcard(
          kanji: 'うるさい',
          hiragana: 'うるさい',
          romaji: 'urusai',
          meaning: 'Ruidoso, molesto - Adj い',
        ),
        Flashcard(
          kanji: '後ろ',
          hiragana: 'うしろ',
          romaji: 'ushiro',
          meaning: 'Atras, detras',
        ),
        Flashcard(
          kanji: '薄い',
          hiragana: 'うすい',
          romaji: 'usui',
          meaning: 'Delgado, fino, ligero, tenue - color - Adj い',
        ),
        Flashcard(
          kanji: '歌',
          hiragana: 'うた',
          romaji: 'uta',
          meaning: 'Canción',
        ),
        Flashcard(
          kanji: '歌う',
          hiragana: 'うたう',
          romaji: 'utau',
          meaning: 'Cantar, recitar - Verb. Transitivo, Intransitivo',
        ),
        Flashcard(
          kanji: '上着',
          hiragana: 'うわぎ',
          romaji: 'uwagi',
          meaning: 'Chaqueta, abrigo',
        ),
        Flashcard(
          kanji: 'ワイシャツ',
          hiragana: 'ワイシャツ',
          romaji: 'wai shatsu',
          meaning: 'Camisa blanca (De negocios, de botones) - Katakana',
        ),
        Flashcard(
          kanji: '若い',
          hiragana: 'わかい',
          romaji: 'wakai',
          meaning: 'Joven - Adj い',
        ),
        Flashcard(
          kanji: '分かる',
          hiragana: 'わかる',
          romaji: 'wakaru',
          meaning: 'Entender, comprender, quedar claro - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '悪い',
          hiragana: 'わるい',
          romaji: 'warui',
          meaning: 'Malo - Adj い',
        ),
        Flashcard(
          kanji: '忘れる',
          hiragana: 'わすれる',
          romaji: 'wasureru',
          meaning: 'Olvidar - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '渡る',
          hiragana: 'わたる',
          romaji: 'wataru',
          meaning: 'Cruzar (pasar al otro lado) - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '私',
          hiragana: 'わたし',
          romaji: 'watashi',
          meaning: 'Yo, mi (Ej. Mi carro) - Pronombre',
        ),
        Flashcard(
          kanji: '渡す',
          hiragana: 'わたす',
          romaji: 'watasu',
          meaning: 'Entregar (con ambas manos) - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '山',
          hiragana: 'やま',
          romaji: 'yama',
          meaning: 'Montaña',
        ),
        Flashcard(
          kanji: '八百屋',
          hiragana: 'やおや',
          romaji: 'yaoya',
          meaning: 'Verdulería, verdulero',
        ),
        Flashcard(
          kanji: 'やる',
          hiragana: 'やる',
          romaji: 'yaru',
          meaning:
              'Hacer, emprender, realizar, jugar (un juego) - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '野菜',
          hiragana: 'やさい',
          romaji: 'yasai',
          meaning: 'Verduras',
        ),
        Flashcard(
          kanji: '易しい',
          hiragana: 'やさしい',
          romaji: 'yasashii',
          meaning: 'Fácil, sencillo - Adj い',
        ),
        Flashcard(
          kanji: '安い',
          hiragana: 'やすい',
          romaji: 'yasui',
          meaning: 'Barato - Adj い',
        ),
        Flashcard(
          kanji: '休み',
          hiragana: 'やすみ',
          romaji: 'yasumi',
          meaning: 'Descanso, vacaciones',
        ),
        Flashcard(
          kanji: '休む',
          hiragana: 'やすむ',
          romaji: 'yasumu',
          meaning: 'Descansar - Verb. Intransitivo',
        ),
        Flashcard(
          kanji: '八つ',
          hiragana: 'やっつ',
          romaji: 'yattsu',
          meaning: 'Ocho (Contador estándar)',
        ),
        Flashcard(
          kanji: '呼ぶ',
          hiragana: 'よぶ',
          romaji: 'yobu',
          meaning: 'Llamar, invitar, hacer venir - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '良い',
          hiragana: 'よい / いい',
          romaji: 'yoi / ii',
          meaning: 'Bueno, excelente, bien, agradable - Adj い',
        ),
        Flashcard(
          kanji: '四日',
          hiragana: 'よっか',
          romaji: 'yokka',
          meaning: 'Día 4 del mes, 4 días',
        ),
        Flashcard(
          kanji: '横',
          hiragana: 'よこ',
          romaji: 'yoko',
          meaning: 'Horizontal, lateral, transversal, a lo ancho',
        ),
        Flashcard(
          kanji: 'よく',
          hiragana: 'よく',
          romaji: 'yoku',
          meaning: 'Bien, apropiadamente, con frecuencia, a menudo - Adverbio',
        ),
        Flashcard(
          kanji: '読む',
          hiragana: 'よむ',
          romaji: 'yomu',
          meaning:
              'Leer, adivinar, predecir, leer (pensamientos) - Verb. Transitivo',
        ),
        Flashcard(
          kanji: '夜',
          hiragana: 'よる',
          romaji: 'yoru',
          meaning: 'Noche',
        ),
        Flashcard(
          kanji: '四つ',
          hiragana: 'よっつ',
          romaji: 'yottsu',
          meaning: 'Cuatro (contador estándar)',
        ),
        Flashcard(
          kanji: '洋服',
          hiragana: 'ようふく',
          romaji: 'youfuku',
          meaning: 'Ropa occidental',
        ),
        Flashcard(
          kanji: '八日',
          hiragana: 'ようか',
          romaji: 'youka',
          meaning: 'Día 8 del mes, 8 días',
        ),
        Flashcard(
          kanji: '弱い',
          hiragana: 'よわい',
          romaji: 'yowai',
          meaning: 'Débil, frágil, delicado - Adj い',
        ),
        Flashcard(
          kanji: '雪',
          hiragana: 'ゆき',
          romaji: 'yuki',
          meaning: 'Nieve',
        ),
        Flashcard(
          kanji: 'ゆっくり',
          hiragana: 'ゆっくり',
          romaji: 'yukkuri',
          meaning: 'Lentamente, con calma - Adverbio',
        ),
        Flashcard(
          kanji: '昨夜',
          hiragana: 'ゆうべ / さくや',
          romaji: 'yuube / sakuya',
          meaning: 'Anoche',
        ),
        Flashcard(
          kanji: '郵便局',
          hiragana: 'ゆうびんきょく',
          romaji: 'yuubinkyoku',
          meaning: 'Oficina de correos',
        ),
        Flashcard(
          kanji: '夕方',
          hiragana: 'ゆうがた',
          romaji: 'yuugata',
          meaning: 'Tarde, Al atardecer',
        ),
        Flashcard(
          kanji: '夕飯',
          hiragana: 'ゆうはん',
          romaji: 'yuuhan',
          meaning: 'Cena',
        ),
        Flashcard(
          kanji: '有名',
          hiragana: 'ゆうめい',
          romaji: 'yuumei',
          meaning: 'Famoso, fama - Adj な',
        ),
        Flashcard(
          kanji: '雑誌',
          hiragana: 'ざっし',
          romaji: 'zasshi',
          meaning: 'Revista',
        ),
        Flashcard(
          kanji: 'ズボン',
          hiragana: 'ズボン',
          romaji: 'zubon',
          meaning: 'Pantalones',
        ),
        Flashcard(
          kanji: 'ずつ',
          hiragana: 'ずつ',
          romaji: 'zutsu',
          meaning: 'Cada, cada uno (cada persona, cada niño...)',
        ),
      ];
    } else if (widget.level == 'JLPT4') {
      return [
        Flashcard(
            kanji: 'ありがとう',
            hiragana: 'ありがとう',
            romaji: 'arigatou',
            meaning: 'Thank you'),
        Flashcard(
            kanji: 'すみません',
            hiragana: 'すみません',
            romaji: 'sumimasen',
            meaning: 'Excuse me'),
      ];
    }
    return [];
  }

  List<Flashcard> get flashcards => _flashcards;

  void _toggleFlashcardDetails(int index) {
    setState(() {
      _selectedIndex = index;
      _flashcards[index].showDetails = !_flashcards[index].showDetails;
    });
  }

  void _startSearch() {
    showSearch(
      context: context,
      delegate: FlashcardSearchDelegate(_flashcards, (selectedFlashcard) {
        final index = _flashcards.indexOf(selectedFlashcard);
        if (index != -1) {
          _scrollToIndex(index);
        }
      }),
    );
  }

  void _scrollToIndex(int index) {
    _scrollController.animateTo(
      index * 55.0, // Approximate height of each card
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    setState(() {
      _selectedIndex = index;
      _flashcards[index].showDetails = true;
    });
  }

  void _startTest() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VocabularyTestScreenJP(flashcards: _flashcards),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vocabulario Japonés - ${widget.level}',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _startSearch,
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
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _flashcards.length,
          itemBuilder: (context, index) {
            final flashcard = _flashcards[index];
            return GestureDetector(
              onTap: () => _toggleFlashcardDetails(index),
              child: Card(
                color: _selectedIndex == index
                    ? Colors.indigoAccent
                    : Colors.grey[850],
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (flashcard.showDetails) ...[
                        Text(
                          flashcard.kanji,
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          flashcard.hiragana,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          flashcard.romaji,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          flashcard.meaning,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ] else ...[
                        Text(
                          flashcard.kanji,
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _startTest,
        label: Text('Iniciar Test'),
        icon: Icon(Icons.assignment),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}
