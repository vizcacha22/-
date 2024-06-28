// import 'package:LongLaoshi/presentation/test/test_japanese.dart';
// import 'package:LongLaoshi/presentation/flashcards/util/search_vocabulary_japanese.dart';
import 'package:LongLaoshi/presentation/tests/test_election.dart';
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
          hiragana: 'カメラ',
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
          hiragana: 'カップ',
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
          hiragana: 'カレー',
          romaji: 'karee',
          meaning: 'Curry',
        ),
        Flashcard(
          kanji: 'カレンダー',
          hiragana: 'カレンダー',
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
          hiragana: 'コーヒー',
          romaji: 'kohii',
          meaning: 'Café - Katakana',
        ),
        Flashcard(
          kanji: 'コート',
          hiragana: 'コート',
          romaji: 'kooto',
          meaning: 'Abrigo - Katakana',
        ),
        Flashcard(
          kanji: 'コピー',
          hiragana: 'コピー',
          romaji: 'kopii',
          meaning: 'Copiar, fotocopiar - Katakana',
        ),
        Flashcard(
          kanji: 'コップ',
          hiragana: 'コップ',
          romaji: 'koppu',
          meaning: 'Vaso, copa - Katakana',
        ),
        Flashcard(
          kanji: 'これ',
          hiragana: 'これ',
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
          hiragana: 'ください',
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
        Flashcard(kanji: 'あ', hiragana: 'あ', romaji: 'a', meaning: 'Ah; oh'),
        Flashcard(kanji: 'ああ', hiragana: 'ああ', romaji: 'aa', meaning: 'Ah; sí'),
        Flashcard(
            kanji: 'アフリカ',
            hiragana: 'アフリカ',
            romaji: 'afurika',
            meaning: 'África'),
        Flashcard(
            kanji: '上がる', hiragana: 'あがる', romaji: 'agaru', meaning: 'Subir'),
        Flashcard(
            kanji: '挨拶',
            hiragana: 'あいさつ',
            romaji: 'aisatsu',
            meaning: 'Saludo'),
        Flashcard(kanji: '味', hiragana: 'あじ', romaji: 'aji', meaning: 'Sabor'),
        Flashcard(
            kanji: 'アジア', hiragana: 'アジア', romaji: 'ajia', meaning: 'Asia'),
        Flashcard(
            kanji: '赤ちゃん',
            hiragana: 'あかちゃん',
            romaji: 'akachan',
            meaning: 'Bebé'),
        Flashcard(
            kanji: '赤ん坊',
            hiragana: 'あかんぼう',
            romaji: 'akanbou',
            meaning: 'Bebé'),
        Flashcard(
            kanji: 'アクセサリー',
            hiragana: 'アクセサリー',
            romaji: 'akusesarii',
            meaning: 'Accesorio'),
        Flashcard(
            kanji: 'アメリカ',
            hiragana: 'アメリカ',
            romaji: 'amerika',
            meaning: 'América'),
        Flashcard(
            kanji: 'アナウンサー',
            hiragana: 'アナウンサー',
            romaji: 'anaunsaa',
            meaning: 'Locutor'),
        Flashcard(
            kanji: 'あんな', hiragana: 'あんな', romaji: 'anna', meaning: 'Tal; así'),
        Flashcard(
            kanji: '案内', hiragana: 'あんない', romaji: 'annai', meaning: 'Guía'),
        Flashcard(
            kanji: '安心',
            hiragana: 'あんしん',
            romaji: 'anshin',
            meaning: 'Tranquilidad'),
        Flashcard(
            kanji: '安全',
            hiragana: 'あんぜん',
            romaji: 'anzen',
            meaning: 'Seguridad'),
        Flashcard(
            kanji: 'アルバイト',
            hiragana: 'アルバイト',
            romaji: 'arubaito',
            meaning: 'Trabajo a tiempo parcial'),
        Flashcard(
            kanji: 'アルコール',
            hiragana: 'アルコール',
            romaji: 'arukooru',
            meaning: 'Alcohol'),
        Flashcard(
            kanji: '浅い',
            hiragana: 'あさい',
            romaji: 'asai',
            meaning: 'Superficial'),
        Flashcard(
            kanji: '遊び', hiragana: 'あそび', romaji: 'asobi', meaning: 'Juego'),
        Flashcard(
            kanji: '集まる',
            hiragana: 'あつまる',
            romaji: 'atsumaru',
            meaning: 'Reunirse'),
        Flashcard(
            kanji: '集める',
            hiragana: 'あつめる',
            romaji: 'atsumeru',
            meaning: 'Recolectar'),
        Flashcard(
            kanji: '謝る',
            hiragana: 'あやまる',
            romaji: 'ayamaru',
            meaning: 'Disculparse'),
        Flashcard(kanji: '倍', hiragana: 'ばい', romaji: 'bai', meaning: 'Doble'),
        Flashcard(
            kanji: '番組',
            hiragana: 'ばんぐみ',
            romaji: 'bangumi',
            meaning: 'Programa (por ejemplo, de TV)'),
        Flashcard(
            kanji: '場所', hiragana: 'ばしょ', romaji: 'basho', meaning: 'Lugar'),
        Flashcard(
            kanji: 'ベル', hiragana: 'ベル', romaji: 'beru', meaning: 'Campana'),
        Flashcard(
            kanji: '美術館',
            hiragana: 'びじゅつかん',
            romaji: 'bijutsukan',
            meaning: 'Galería de arte; museo de arte'),
        Flashcard(
            kanji: 'びっくり',
            hiragana: 'びっくり',
            romaji: 'bikkuri',
            meaning: 'Sorprendido'),
        Flashcard(
            kanji: 'ビル', hiragana: 'ビル', romaji: 'biru', meaning: 'Edificio'),
        Flashcard(
            kanji: '僕',
            hiragana: 'ぼく',
            romaji: 'boku',
            meaning: 'Yo (usado por hombres)'),
        Flashcard(
            kanji: '貿易',
            hiragana: 'ぼうえき',
            romaji: 'boueki',
            meaning: 'Comercio'),
        Flashcard(
            kanji: '部長',
            hiragana: 'ぶちょう',
            romaji: 'buchou',
            meaning: 'Jefe de sección o departamento'),
        Flashcard(
            kanji: 'ぶどう', hiragana: 'ぶどう', romaji: 'budou', meaning: 'Uvas'),
        Flashcard(
            kanji: '文学',
            hiragana: 'ぶんがく',
            romaji: 'bungaku',
            meaning: 'Literatura'),
        Flashcard(
            kanji: '文化', hiragana: 'ぶんか', romaji: 'bunka', meaning: 'Cultura'),
        Flashcard(
            kanji: '文法',
            hiragana: 'ぶんぽう',
            romaji: 'bunpou',
            meaning: 'Gramática'),
        Flashcard(
            kanji: 'ちゃん',
            hiragana: 'ちゃん',
            romaji: 'chan',
            meaning: 'Sufijo para persona femenina familiar'),
        Flashcard(
            kanji: 'チェック',
            hiragana: 'チェック',
            romaji: 'chekku',
            meaning: 'Chequear'),
        Flashcard(kanji: '血', hiragana: 'ち', romaji: 'chi', meaning: 'Sangre'),
        Flashcard(
            kanji: '力',
            hiragana: 'ちから',
            romaji: 'chikara',
            meaning: 'Energía; fuerza'),
        Flashcard(
            kanji: '地理', hiragana: 'ちり', romaji: 'chiri', meaning: 'Geografía'),
        Flashcard(
            kanji: '中学校',
            hiragana: 'ちゅうがっこう',
            romaji: 'chuugakkou',
            meaning: 'Escuela secundaria'),
        Flashcard(
            kanji: '注意',
            hiragana: 'ちゅうい',
            romaji: 'chuui',
            meaning: 'Atención; precaución'),
        Flashcard(
            kanji: '注射',
            hiragana: 'ちゅうしゃ',
            romaji: 'chuusha',
            meaning: 'Inyección'),
        Flashcard(
            kanji: '駐車場',
            hiragana: 'ちゅうしゃじょう',
            romaji: 'chuushajou',
            meaning: 'Estacionamiento'),
        Flashcard(
            kanji: '大分',
            hiragana: 'だいぶ',
            romaji: 'daibu',
            meaning: 'Considerablemente; mucho'),
        Flashcard(
            kanji: '大学生',
            hiragana: 'だいがくせい',
            romaji: 'daigakusei',
            meaning: 'Estudiante universitario'),
        Flashcard(
            kanji: '大事',
            hiragana: 'だいじ',
            romaji: 'daiji',
            meaning: 'Importante; serio; crucial'),
        Flashcard(
            kanji: '大体',
            hiragana: 'だいたい',
            romaji: 'daitai',
            meaning: 'Aproximadamente'),
        Flashcard(
            kanji: '暖房',
            hiragana: 'だんぼう',
            romaji: 'danbou',
            meaning: 'Calefacción'),
        Flashcard(
            kanji: '男性',
            hiragana: 'だんせい',
            romaji: 'dansei',
            meaning: 'Hombre; masculino'),
        Flashcard(
            kanji: 'できるだけ',
            hiragana: 'できるだけ',
            romaji: 'dekiru dake',
            meaning: 'Tanto como sea posible'),
        Flashcard(
            kanji: '電報',
            hiragana: 'でんぽう',
            romaji: 'denpou',
            meaning: 'Telegrama'),
        Flashcard(
            kanji: '電灯',
            hiragana: 'でんとう',
            romaji: 'dentou',
            meaning: 'Luz eléctrica'),
        Flashcard(
            kanji: 'どんどん',
            hiragana: 'どんどん',
            romaji: 'dondon',
            meaning: 'Rápidamente; cada vez más'),
        Flashcard(
            kanji: '泥棒',
            hiragana: 'どろぼう',
            romaji: 'dorobou',
            meaning: 'Ladrón'),
        Flashcard(
            kanji: '動物園',
            hiragana: 'どうぶつえん',
            romaji: 'doubutsuen',
            meaning: 'Zoológico'),
        Flashcard(
            kanji: '道具',
            hiragana: 'どうぐ',
            romaji: 'dougu',
            meaning: 'Herramienta'),
        Flashcard(kanji: '枝', hiragana: 'えだ', romaji: 'eda', meaning: 'Rama'),
        Flashcard(
            kanji: '遠慮',
            hiragana: 'えんりょ',
            romaji: 'enryo',
            meaning: 'Reserva; abstención'),
        Flashcard(
            kanji: '選ぶ', hiragana: 'えらぶ', romaji: 'erabu', meaning: 'Elegir'),
        Flashcard(
            kanji: 'エスカレーター',
            hiragana: 'エスカレーター',
            romaji: 'esukareetaa',
            meaning: 'Escalera mecánica'),
        Flashcard(
            kanji: 'ファックス',
            hiragana: 'ファックス',
            romaji: 'fakkusu',
            meaning: 'Fax'),
        Flashcard(
            kanji: '不便',
            hiragana: 'ふべん',
            romaji: 'fuben',
            meaning: 'Inconveniente'),
        Flashcard(
            kanji: '増える',
            hiragana: 'ふえる',
            romaji: 'fueru',
            meaning: 'Aumentar'),
        Flashcard(
            kanji: '深い', hiragana: 'ふかい', romaji: 'fukai', meaning: 'Profundo'),
        Flashcard(
            kanji: '復習',
            hiragana: 'ふくしゅう',
            romaji: 'fukushuu',
            meaning: 'Revisión'),
        Flashcard(
            kanji: '複雑',
            hiragana: 'ふくざつ',
            romaji: 'fukuzatsu',
            meaning: 'Complejidad'),
        Flashcard(
            kanji: '踏む', hiragana: 'ふむ', romaji: 'fumu', meaning: 'Pisar'),
        Flashcard(kanji: '舟', hiragana: 'ふね', romaji: 'fune', meaning: 'Barco'),
        Flashcard(
            kanji: '降り出す',
            hiragana: 'ふりだす',
            romaji: 'furidasu',
            meaning: 'Empezar a llover'),
        Flashcard(
            kanji: '布団', hiragana: 'ふとん', romaji: 'futon', meaning: 'Futón'),
        Flashcard(
            kanji: '太る',
            hiragana: 'ふとる',
            romaji: 'futoru',
            meaning: 'Engordar'),
        Flashcard(
            kanji: '普通',
            hiragana: 'ふつう',
            romaji: 'futsuu',
            meaning: 'Normalmente'),
        Flashcard(
            kanji: 'ガラス', hiragana: 'ガラス', romaji: 'garasu', meaning: 'Vidrio'),
        Flashcard(
            kanji: 'ガソリン',
            hiragana: 'ガソリン',
            romaji: 'gasorin',
            meaning: 'Gasolina; nafta'),
        Flashcard(
            kanji: 'ガソリンスタンド',
            hiragana: 'ガソリンスタンド',
            romaji: 'gasorin sutando',
            meaning: 'Estación de servicio'),
        Flashcard(kanji: 'ガス', hiragana: 'ガス', romaji: 'gasu', meaning: 'Gas'),
        Flashcard(
            kanji: '原因', hiragana: 'げんいん', romaji: 'genin', meaning: 'Causa'),
        Flashcard(
            kanji: '下宿',
            hiragana: 'げしゅく',
            romaji: 'geshuku',
            meaning: 'Pensión'),
        Flashcard(
            kanji: '技術',
            hiragana: 'ぎじゅつ',
            romaji: 'gijutsu',
            meaning: 'Técnica; habilidad técnica'),
        Flashcard(
            kanji: 'ごちそう',
            hiragana: 'ごちそう',
            romaji: 'gochisou',
            meaning: 'Banquete'),
        Flashcard(
            kanji: 'ごみ', hiragana: 'ごみ', romaji: 'gomi', meaning: 'Basura'),
        Flashcard(
            kanji: 'ご覧になる',
            hiragana: 'ごらんになる',
            romaji: 'goran ni naru',
            meaning: 'Ver (forma respetuosa)'),
        Flashcard(
            kanji: 'ご主人',
            hiragana: 'ごしゅじん',
            romaji: 'goshujin',
            meaning: 'Tu esposo; su esposo'),
        Flashcard(
            kanji: 'ご存じ',
            hiragana: 'ごぞんじ',
            romaji: 'gozonji',
            meaning: 'Saber'),
        Flashcard(
            kanji: '具合',
            hiragana: 'ぐあい',
            romaji: 'guai',
            meaning: 'Estado; salud'),
        Flashcard(
            kanji: '葉', hiragana: 'は', romaji: 'ha', meaning: 'Hojas; hoja'),
        Flashcard(
            kanji: '拝見',
            hiragana: 'はいけん',
            romaji: 'haiken',
            meaning: 'Ver (forma respetuosa)'),
        Flashcard(
            kanji: '歯医者',
            hiragana: 'はいしゃ',
            romaji: 'haisha',
            meaning: 'Dentista'),
        Flashcard(
            kanji: 'はっきり',
            hiragana: 'はっきり',
            romaji: 'hakkiri',
            meaning: 'Claramente'),
        Flashcard(
            kanji: '運ぶ', hiragana: 'はこぶ', romaji: 'hakobu', meaning: 'Llevar'),
        Flashcard(
            kanji: '花見',
            hiragana: 'はなみ',
            romaji: 'hanami',
            meaning: 'Ver los cerezos en flor; paseo para ver flores'),
        Flashcard(
            kanji: 'ハンドバッグ',
            hiragana: 'ハンドバッグ',
            romaji: 'handobaggu',
            meaning: 'Bolso de mano'),
        Flashcard(
            kanji: '反対',
            hiragana: 'はんたい',
            romaji: 'hantai',
            meaning: 'Oposición; en contra'),
        Flashcard(
            kanji: '払う', hiragana: 'はらう', romaji: 'harau', meaning: 'Pagar'),
        Flashcard(
            kanji: '発音',
            hiragana: 'はつおん',
            romaji: 'hatsuon',
            meaning: 'Pronunciación'),
        Flashcard(
            kanji: '林', hiragana: 'はやし', romaji: 'hayashi', meaning: 'Bosque'),
        Flashcard(
            kanji: '恥ずかしい',
            hiragana: 'はずかしい',
            romaji: 'hazukashii',
            meaning: 'Avergonzado; vergonzoso'),
        Flashcard(
            kanji: '変',
            hiragana: 'へん',
            romaji: 'hen',
            meaning: 'extraño; peculiar; raro'),
        Flashcard(
            kanji: '返事',
            hiragana: 'へんじ',
            romaji: 'henji',
            meaning: 'respuesta; contestación'),
        Flashcard(kanji: '火', hiragana: 'ひ', romaji: 'hi', meaning: 'fuego'),
        Flashcard(
            kanji: '酷い',
            hiragana: 'ひどい',
            romaji: 'hidoi',
            meaning: 'terrible; horrible'),
        Flashcard(
            kanji: '冷える',
            hiragana: 'ひえる',
            romaji: 'hieru',
            meaning: 'enfriarse'),
        Flashcard(kanji: '髭', hiragana: 'ひげ', romaji: 'hige', meaning: 'barba'),
        Flashcard(
            kanji: '非常に',
            hiragana: 'ひじょうに',
            romaji: 'hijou ni',
            meaning: 'extremadamente'),
        Flashcard(
            kanji: '光', hiragana: 'ひかり', romaji: 'hikari', meaning: 'luz'),
        Flashcard(
            kanji: '光る', hiragana: 'ひかる', romaji: 'hikaru', meaning: 'brillar'),
        Flashcard(
            kanji: '引き出し',
            hiragana: 'ひきだし',
            romaji: 'hikidashi',
            meaning: 'cajón'),
        Flashcard(
            kanji: '引き出す',
            hiragana: 'ひきだす',
            romaji: 'hikidasu',
            meaning: 'sacar; retirar'),
        Flashcard(
            kanji: '引っ越す',
            hiragana: 'ひっこす',
            romaji: 'hikkosu',
            meaning: 'mudarse'),
        Flashcard(
            kanji: '飛行場',
            hiragana: 'ひこうじょう',
            romaji: 'hikoujou',
            meaning: 'aeropuerto'),
        Flashcard(
            kanji: '開く', hiragana: 'ひらく', romaji: 'hiraku', meaning: 'abrir'),
        Flashcard(
            kanji: '拾う', hiragana: 'ひろう', romaji: 'hirou', meaning: 'recoger'),
        Flashcard(
            kanji: '昼間',
            hiragana: 'ひるま',
            romaji: 'hiruma',
            meaning: 'durante el día'),
        Flashcard(
            kanji: '昼休み',
            hiragana: 'ひるやすみ',
            romaji: 'hiruyasumi',
            meaning: 'descanso del mediodía'),
        Flashcard(
            kanji: '久しぶり',
            hiragana: 'ひさしぶり',
            romaji: 'hisashiburi',
            meaning: 'después de mucho tiempo; hacía mucho que no...'),
        Flashcard(
            kanji: '褒める',
            hiragana: 'ほめる',
            romaji: 'homeru',
            meaning: 'alabar; elogiar'),
        Flashcard(
            kanji: '翻訳',
            hiragana: 'ほんやく',
            romaji: 'honyaku',
            meaning: 'traducción'),
        Flashcard(
            kanji: '星', hiragana: 'ほし', romaji: 'hoshi', meaning: 'estrella'),
        Flashcard(
            kanji: 'ほとんど',
            hiragana: 'ほとんど',
            romaji: 'hotondo',
            meaning: 'casi; casi todo'),
        Flashcard(
            kanji: '法律', hiragana: 'ほうりつ', romaji: 'houritsu', meaning: 'ley'),
        Flashcard(
            kanji: '放送',
            hiragana: 'ほうそう',
            romaji: 'housou',
            meaning: 'emisión; transmisión (radio o TV)'),
        Flashcard(
            kanji: '一度', hiragana: 'いちど', romaji: 'ichido', meaning: 'una vez'),
        Flashcard(
            kanji: '以外', hiragana: 'いがい', romaji: 'igai', meaning: 'excepto'),
        Flashcard(
            kanji: '医学',
            hiragana: 'いがく',
            romaji: 'igaku',
            meaning: 'medicina; ciencia médica'),
        Flashcard(
            kanji: 'いじめる',
            hiragana: 'いじめる',
            romaji: 'ijimeru',
            meaning: 'acosar; intimidar'),
        Flashcard(
            kanji: '以上',
            hiragana: 'いじょう',
            romaji: 'ijou',
            meaning: 'más de; por encima de; superior a'),
        Flashcard(
            kanji: '以下',
            hiragana: 'いか',
            romaji: 'ika',
            meaning: 'no más de; dentro de; inferior a'),
        Flashcard(
            kanji: '意見', hiragana: 'いけん', romaji: 'iken', meaning: 'opinión'),
        Flashcard(
            kanji: '生き物',
            hiragana: 'いきもの',
            romaji: 'ikimono',
            meaning: 'ser vivo'),
        Flashcard(
            kanji: '生きる', hiragana: 'いきる', romaji: 'ikiru', meaning: 'vivir'),
        Flashcard(
            kanji: '以内',
            hiragana: 'いない',
            romaji: 'inai',
            meaning: 'dentro de; no más de'),
        Flashcard(
            kanji: '田舎',
            hiragana: 'いなか',
            romaji: 'inaka',
            meaning: 'campo; provincia; rural'),
        Flashcard(
            kanji: '祈る', hiragana: 'いのる', romaji: 'inoru', meaning: 'rezar'),
        Flashcard(
            kanji: 'いっぱい',
            hiragana: 'いっぱい',
            romaji: 'ippai',
            meaning: 'lleno; completo'),
        Flashcard(
            kanji: '色んな',
            hiragana: 'いろんな',
            romaji: 'ironna',
            meaning: 'varios; diversos'),
        Flashcard(
            kanji: '石', hiragana: 'いし', romaji: 'ishi', meaning: 'piedra'),
        Flashcard(
            kanji: '急ぐ',
            hiragana: 'いそぐ',
            romaji: 'isogu',
            meaning: 'apresurarse; tener prisa'),
        Flashcard(
            kanji: '一生懸命',
            hiragana: 'いっしょうけんめい',
            romaji: 'isshoukenmei',
            meaning: 'con todo el esfuerzo; con ahínco'),
        Flashcard(
            kanji: '頂く',
            hiragana: 'いただく',
            romaji: 'itadaku',
            meaning: 'recibir (con humildad)'),
        Flashcard(
            kanji: '致す',
            hiragana: 'いたす',
            romaji: 'itasu',
            meaning: 'hacer (con humildad)'),
        Flashcard(kanji: '糸', hiragana: 'いと', romaji: 'ito', meaning: 'hilo'),
        Flashcard(
            kanji: 'ジャム',
            hiragana: 'ジャム',
            romaji: 'jamu',
            meaning: 'mermelada'),
        Flashcard(
            kanji: '字',
            hiragana: 'じ',
            romaji: 'ji',
            meaning: 'carácter; letra'),
        Flashcard(
            kanji: '時代',
            hiragana: 'じだい',
            romaji: 'jidai',
            meaning: 'época; periodo'),
        Flashcard(
            kanji: '事故', hiragana: 'じこ', romaji: 'jiko', meaning: 'accidente'),
        Flashcard(
            kanji: '事務所',
            hiragana: 'じむしょ',
            romaji: 'jimusho',
            meaning: 'oficina'),
        Flashcard(
            kanji: '神社',
            hiragana: 'じんじゃ',
            romaji: 'jinja',
            meaning: 'santuario shintoísta'),
        Flashcard(
            kanji: '人口',
            hiragana: 'じんこう',
            romaji: 'jinkou',
            meaning: 'población'),
        Flashcard(
            kanji: '人生',
            hiragana: 'じんせい',
            romaji: 'jinsei',
            meaning: 'vida humana; vida'),
        Flashcard(
            kanji: '地震',
            hiragana: 'じしん',
            romaji: 'jishin',
            meaning: 'terremoto'),
        Flashcard(
            kanji: '辞典',
            hiragana: 'じてん',
            romaji: 'jiten',
            meaning: 'diccionario'),
        Flashcard(
            kanji: '自由', hiragana: 'じゆう', romaji: 'jiyuu', meaning: 'libertad'),
        Flashcard(
            kanji: '女性',
            hiragana: 'じょせい',
            romaji: 'josei',
            meaning: 'mujer; sexo femenino'),
        Flashcard(
            kanji: '準備',
            hiragana: 'じゅんび',
            romaji: 'junbi',
            meaning: 'preparación'),
        Flashcard(
            kanji: '十分',
            hiragana: 'じゅうぶん',
            romaji: 'juubun',
            meaning: 'suficiente; bastante'),
        Flashcard(
            kanji: '柔道', hiragana: 'じゅうどう', romaji: 'juudou', meaning: 'judo'),
        Flashcard(
            kanji: '住所',
            hiragana: 'じゅうしょ',
            romaji: 'juusho',
            meaning: 'dirección (postal)'),
        Flashcard(
            kanji: 'カーテン',
            hiragana: 'カーテン',
            romaji: 'kaaten',
            meaning: 'cortina'),
        Flashcard(
            kanji: '壁', hiragana: 'かべ', romaji: 'kabe', meaning: 'pared; muro'),
        Flashcard(
            kanji: '課長',
            hiragana: 'かちょう',
            romaji: 'kachou',
            meaning: 'jefe de sección'),
        Flashcard(
            kanji: '帰り',
            hiragana: 'かえり',
            romaji: 'kaeri',
            meaning: 'regreso; vuelta'),
        Flashcard(
            kanji: '変える',
            hiragana: 'かえる',
            romaji: 'kaeru',
            meaning: 'cambiar; alterar'),
        Flashcard(
            kanji: '科学', hiragana: 'かがく', romaji: 'kagaku', meaning: 'ciencia'),
        Flashcard(
            kanji: '鏡', hiragana: 'かがみ', romaji: 'kagami', meaning: 'espejo'),
        Flashcard(
            kanji: '海岸', hiragana: 'かいがん', romaji: 'kaigan', meaning: 'costa'),
        Flashcard(
            kanji: '会議',
            hiragana: 'かいぎ',
            romaji: 'kaigi',
            meaning: 'reunión; conferencia'),
        Flashcard(
            kanji: '会議室',
            hiragana: 'かいぎしつ',
            romaji: 'kaigishitsu',
            meaning: 'sala de conferencias'),
        Flashcard(
            kanji: '会場',
            hiragana: 'かいじょう',
            romaji: 'kaijou',
            meaning: 'lugar de reunión; recinto'),
        Flashcard(
            kanji: '会話',
            hiragana: 'かいわ',
            romaji: 'kaiwa',
            meaning: 'conversación; diálogo'),
        Flashcard(
            kanji: '火事', hiragana: 'かじ', romaji: 'kaji', meaning: 'incendio'),
        Flashcard(
            kanji: '格好',
            hiragana: 'かっこう',
            romaji: 'kakkou',
            meaning: 'apariencia; aspecto'),
        Flashcard(
            kanji: '構う',
            hiragana: 'かまう',
            romaji: 'kamau',
            meaning: 'preocuparse; importar'),
        Flashcard(
            kanji: '髪',
            hiragana: 'かみ',
            romaji: 'kami',
            meaning: 'pelo; cabello'),
        Flashcard(
            kanji: '噛む',
            hiragana: 'かむ',
            romaji: 'kamu',
            meaning: 'masticar; morder'),
        Flashcard(
            kanji: '家内',
            hiragana: 'かない',
            romaji: 'kanai',
            meaning: 'mi esposa; dentro de la casa; familia'),
        Flashcard(
            kanji: '必ず',
            hiragana: 'かならず',
            romaji: 'kanarazu',
            meaning: 'seguramente; sin falta'),
        Flashcard(
            kanji: '悲しい',
            hiragana: 'かなしい',
            romaji: 'kanashii',
            meaning: 'triste'),
        Flashcard(
            kanji: '考える',
            hiragana: 'かんがえる',
            romaji: 'kangaeru',
            meaning: 'pensar; considerar'),
        Flashcard(
            kanji: '看護婦',
            hiragana: 'かんごふ',
            romaji: 'kangofu',
            meaning: 'enfermera'),
        Flashcard(
            kanji: '関係',
            hiragana: 'かんけい',
            romaji: 'kankei',
            meaning: 'relación; conexión'),
        Flashcard(
            kanji: '彼女',
            hiragana: 'かのじょ',
            romaji: 'kanojo',
            meaning: 'ella; novia'),
        Flashcard(
            kanji: '簡単',
            hiragana: 'かんたん',
            romaji: 'kantan',
            meaning: 'fácil; sencillo'),
        Flashcard(
            kanji: '彼', hiragana: 'かれ', romaji: 'kare', meaning: 'él; novio'),
        Flashcard(
            kanji: '彼ら', hiragana: 'かれら', romaji: 'karera', meaning: 'ellos'),
        Flashcard(
            kanji: '形',
            hiragana: 'かたち',
            romaji: 'katachi',
            meaning: 'forma; figura'),
        Flashcard(
            kanji: '片付ける',
            hiragana: 'かたづける',
            romaji: 'katadzukeru',
            meaning: 'ordenar; arreglar'),
        Flashcard(
            kanji: '硬い',
            hiragana: 'かたい',
            romaji: 'katai',
            meaning: 'duro; rígido'),
        Flashcard(
            kanji: '勝つ', hiragana: 'かつ', romaji: 'katsu', meaning: 'ganar'),
        Flashcard(
            kanji: '乾く', hiragana: 'かわく', romaji: 'kawaku', meaning: 'secarse'),
        Flashcard(
            kanji: '代わり',
            hiragana: 'かわり',
            romaji: 'kawari',
            meaning: 'sustitución; cambio'),
        Flashcard(
            kanji: '変わる',
            hiragana: 'かわる',
            romaji: 'kawaru',
            meaning: 'cambiar; transformarse'),
        Flashcard(
            kanji: '通う',
            hiragana: 'かよう',
            romaji: 'kayou',
            meaning: 'ir (a algún lugar) regularmente; asistir'),
        Flashcard(
            kanji: '飾る',
            hiragana: 'かざる',
            romaji: 'kazaru',
            meaning: 'adornar; decorar'),
        Flashcard(
            kanji: '毛', hiragana: 'け', romaji: 'ke', meaning: 'pelo; pelaje'),
        Flashcard(
            kanji: 'ケーキ',
            hiragana: 'ケーキ',
            romaji: 'keeki',
            meaning: 'pastel; bizcocho'),
        Flashcard(
            kanji: '怪我',
            hiragana: 'けが',
            romaji: 'kega',
            meaning: 'lesión; herida'),
        Flashcard(
            kanji: '計画',
            hiragana: 'けいかく',
            romaji: 'keikaku',
            meaning: 'plan; proyecto'),
        Flashcard(
            kanji: '経験',
            hiragana: 'けいけん',
            romaji: 'keiken',
            meaning: 'experiencia'),
        Flashcard(
            kanji: '警察',
            hiragana: 'けいさつ',
            romaji: 'keisatsu',
            meaning: 'policía'),
        Flashcard(
            kanji: '経済',
            hiragana: 'けいざい',
            romaji: 'keizai',
            meaning: 'finanzas; economía'),
        Flashcard(
            kanji: '見物',
            hiragana: 'けんぶつ',
            romaji: 'kenbutsu',
            meaning: 'turismo; visita'),
        Flashcard(
            kanji: '喧嘩',
            hiragana: 'けんか',
            romaji: 'kenka',
            meaning: 'pelea; discusión'),
        Flashcard(
            kanji: '研究',
            hiragana: 'けんきゅう',
            romaji: 'kenkyuu',
            meaning: 'investigación; estudio'),
        Flashcard(
            kanji: '研究室',
            hiragana: 'けんきゅうしつ',
            romaji: 'kenkyuushitsu',
            meaning: 'laboratorio'),
        Flashcard(
            kanji: '消しゴム',
            hiragana: 'けしごむ',
            romaji: 'keshigomu',
            meaning: 'borrador'),
        Flashcard(
            kanji: '景色',
            hiragana: 'けしき',
            romaji: 'keshiki',
            meaning: 'paisaje'),
        Flashcard(
            kanji: '気',
            hiragana: 'き',
            romaji: 'ki',
            meaning: 'espíritu; ánimo'),
        Flashcard(
            kanji: '厳しい',
            hiragana: 'きびしい',
            romaji: 'kibishii',
            meaning: 'estricto; severo'),
        Flashcard(
            kanji: '気分',
            hiragana: 'きぶん',
            romaji: 'kibun',
            meaning: 'estado de ánimo; humor'),
        Flashcard(
            kanji: '機会',
            hiragana: 'きかい',
            romaji: 'kikai',
            meaning: 'oportunidad'),
        Flashcard(
            kanji: '危険', hiragana: 'きけん', romaji: 'kiken', meaning: 'peligro'),
        Flashcard(
            kanji: '聞こえる',
            hiragana: 'きこえる',
            romaji: 'kikoeru',
            meaning: 'escucharse; ser audible'),
        Flashcard(
            kanji: '決まる',
            hiragana: 'きまる',
            romaji: 'kimaru',
            meaning: 'decidirse; estar decidido'),
        Flashcard(
            kanji: '決める',
            hiragana: 'きめる',
            romaji: 'kimeru',
            meaning: 'decidir'),
        Flashcard(
            kanji: '君',
            hiragana: 'きみ',
            romaji: 'kimi',
            meaning: 'tú; tú (uso familiar)'),
        Flashcard(
            kanji: '気持ち',
            hiragana: 'きもち',
            romaji: 'kimochi',
            meaning: 'sentimiento'),
        Flashcard(
            kanji: '着物', hiragana: 'きもの', romaji: 'kimono', meaning: 'kimono'),
        Flashcard(
            kanji: '近所',
            hiragana: 'きんじょ',
            romaji: 'kinjo',
            meaning: 'vecindario'),
        Flashcard(kanji: '絹', hiragana: 'きぬ', romaji: 'kinu', meaning: 'seda'),
        Flashcard(
            kanji: '季節',
            hiragana: 'きせつ',
            romaji: 'kisetsu',
            meaning: 'estación (del año)'),
        Flashcard(
            kanji: '汽車',
            hiragana: 'きしゃ',
            romaji: 'kisha',
            meaning: 'tren a vapor'),
        Flashcard(
            kanji: '規則',
            hiragana: 'きそく',
            romaji: 'kisoku',
            meaning: 'regla; norma'),
        Flashcard(
            kanji: '子', hiragana: 'こ', romaji: 'ko', meaning: 'niño; hijo'),
        Flashcard(
            kanji: '心',
            hiragana: 'こころ',
            romaji: 'kokoro',
            meaning: 'corazón; mente; espíritu'),
        Flashcard(
            kanji: '国際',
            hiragana: 'こくさい',
            romaji: 'kokusai',
            meaning: 'internacional'),
        Flashcard(
            kanji: '細かい',
            hiragana: 'こまかい',
            romaji: 'komakai',
            meaning: 'pequeño; fino'),
        Flashcard(
            kanji: '米',
            hiragana: 'こめ',
            romaji: 'kome',
            meaning: 'arroz (sin cáscara)'),
        Flashcard(
            kanji: '込む',
            hiragana: 'こむ',
            romaji: 'komu',
            meaning: 'estar lleno; estar atestado'),
        Flashcard(
            kanji: '今度',
            hiragana: 'こんど',
            romaji: 'kondo',
            meaning: 'esta vez; próxima vez'),
        Flashcard(
            kanji: 'この間',
            hiragana: 'このあいだ',
            romaji: 'kono aida',
            meaning: 'el otro día; recientemente'),
        Flashcard(
            kanji: 'このごろ',
            hiragana: 'このごろ',
            romaji: 'kono goro',
            meaning: 'estos días; últimamente'),
        Flashcard(
            kanji: 'コンピュータ',
            hiragana: 'コンピュータ',
            romaji: 'konpyuuta',
            meaning: 'computadora'),
        Flashcard(
            kanji: 'コンサート',
            hiragana: 'コンサート',
            romaji: 'konsaato',
            meaning: 'concierto'),
        Flashcard(
            kanji: '今夜',
            hiragana: 'こんや',
            romaji: 'konya',
            meaning: 'esta noche'),
        Flashcard(
            kanji: 'これから',
            hiragana: 'これから',
            romaji: 'korekara',
            meaning: 'de ahora en adelante'),
        Flashcard(
            kanji: '故障',
            hiragana: 'こしょう',
            romaji: 'koshou',
            meaning: 'avería; fallo (mecánico)'),
        Flashcard(
            kanji: '答え',
            hiragana: 'こたえ',
            romaji: 'kotae',
            meaning: 'respuesta'),
        Flashcard(
            kanji: '小鳥',
            hiragana: 'ことり',
            romaji: 'kotori',
            meaning: 'pajarito'),
        Flashcard(
            kanji: '校長',
            hiragana: 'こうちょう',
            romaji: 'kouchou',
            meaning: 'director de la escuela'),
        Flashcard(
            kanji: '講堂',
            hiragana: 'こうどう',
            romaji: 'koudou',
            meaning: 'auditorio'),
        Flashcard(
            kanji: '郊外',
            hiragana: 'こうがい',
            romaji: 'kougai',
            meaning: 'suburbio'),
        Flashcard(
            kanji: '講義',
            hiragana: 'こうぎ',
            romaji: 'kougi',
            meaning: 'conferencia; clase'),
        Flashcard(
            kanji: '工業',
            hiragana: 'こうぎょう',
            romaji: 'kougyou',
            meaning: 'industria'),
        Flashcard(
            kanji: '工場',
            hiragana: 'こうじょう',
            romaji: 'koujou',
            meaning: 'fábrica'),
        Flashcard(
            kanji: '高校',
            hiragana: 'こうこう',
            romaji: 'koukou',
            meaning: 'preparatoria; secundaria superior'),
        Flashcard(
            kanji: '高校生',
            hiragana: 'こうこうせい',
            romaji: 'koukousei',
            meaning: 'estudiante de secundaria superior'),
        Flashcard(
            kanji: '公務員',
            hiragana: 'こうむいん',
            romaji: 'koumuin',
            meaning: 'funcionario público'),
        Flashcard(
            kanji: '高等学校',
            hiragana: 'こうとうがっこう',
            romaji: 'koutougakkou',
            meaning: 'preparatoria'),
        Flashcard(
            kanji: '交通',
            hiragana: 'こうつう',
            romaji: 'koutsuu',
            meaning: 'tráfico'),
        Flashcard(
            kanji: '怖い',
            hiragana: 'こわい',
            romaji: 'kowai',
            meaning: 'aterrador; temible'),
        Flashcard(
            kanji: '壊れる',
            hiragana: 'こわれる',
            romaji: 'kowareru',
            meaning: 'romperse'),
        Flashcard(
            kanji: '壊す', hiragana: 'こわす', romaji: 'kowasu', meaning: 'romper'),
        Flashcard(
            kanji: '首', hiragana: 'くび', romaji: 'kubi', meaning: 'cuello'),
        Flashcard(
            kanji: '下さる',
            hiragana: 'くださる',
            romaji: 'kudasaru',
            meaning: 'dar (respetuoso)'),
        Flashcard(kanji: '雲', hiragana: 'くも', romaji: 'kumo', meaning: 'nube'),
        Flashcard(
            kanji: '君',
            hiragana: 'くん',
            romaji: 'kun',
            meaning: 'sufijo para jóvenes varones (familiar)'),
        Flashcard(
            kanji: '比べる',
            hiragana: 'くらべる',
            romaji: 'kuraberu',
            meaning: 'comparar'),
        Flashcard(
            kanji: '暮れる',
            hiragana: 'くれる',
            romaji: 'kureru',
            meaning: 'oscurecer; anochecer'),
        Flashcard(
            kanji: '草', hiragana: 'くさ', romaji: 'kusa', meaning: 'hierba'),
        Flashcard(
            kanji: '空気', hiragana: 'くうき', romaji: 'kuuki', meaning: 'aire'),
        Flashcard(
            kanji: '空港',
            hiragana: 'くうこう',
            romaji: 'kuukou',
            meaning: 'aeropuerto'),
        Flashcard(
            kanji: '客',
            hiragana: 'きゃく',
            romaji: 'kyaku',
            meaning: 'invitado; cliente'),
        Flashcard(
            kanji: '教育',
            hiragana: 'きょういく',
            romaji: 'kyouiku',
            meaning: 'educación'),
        Flashcard(
            kanji: '教会',
            hiragana: 'きょうかい',
            romaji: 'kyoukai',
            meaning: 'iglesia'),
        Flashcard(
            kanji: '興味',
            hiragana: 'きょうみ',
            romaji: 'kyoumi',
            meaning: 'interés'),
        Flashcard(
            kanji: '競争',
            hiragana: 'きょうそう',
            romaji: 'kyousou',
            meaning: 'competencia'),
        Flashcard(
            kanji: '急',
            hiragana: 'きゅう',
            romaji: 'kyuu',
            meaning: 'repentino; abrupto'),
        Flashcard(
            kanji: '急行',
            hiragana: 'きゅうこう',
            romaji: 'kyuukou',
            meaning: 'tren expreso'),
        Flashcard(
            kanji: '間違える',
            hiragana: 'まちがえる',
            romaji: 'machigaeru',
            meaning: 'cometer un error'),
        Flashcard(
            kanji: '参る',
            hiragana: 'まいる',
            romaji: 'mairu',
            meaning: '(irrespetuoso) ir; venir'),
        Flashcard(
            kanji: '負ける', hiragana: 'まける', romaji: 'makeru', meaning: 'perder'),
        Flashcard(
            kanji: '漫画',
            hiragana: 'まんが',
            romaji: 'manga',
            meaning: 'manga; cómic'),
        Flashcard(
            kanji: '間に合う',
            hiragana: 'まにあう',
            romaji: 'maniau',
            meaning: 'llegar a tiempo'),
        Flashcard(
            kanji: '真ん中',
            hiragana: 'まんなか',
            romaji: 'mannaka',
            meaning: 'centro; medio'),
        Flashcard(
            kanji: '周り',
            hiragana: 'まわり',
            romaji: 'mawari',
            meaning: 'alrededor'),
        Flashcard(
            kanji: '回る',
            hiragana: 'まわる',
            romaji: 'mawaru',
            meaning: 'dar vueltas; girar'),
        Flashcard(
            kanji: 'まず',
            hiragana: 'まず',
            romaji: 'mazu',
            meaning: 'primero que nada'),
        Flashcard(
            kanji: '召し上がる',
            hiragana: 'めしあがる',
            romaji: 'meshiagaru',
            meaning: '(comida) comer; (bebida) beber'),
        Flashcard(
            kanji: '珍しい',
            hiragana: 'めずらしい',
            romaji: 'mezurashii',
            meaning: 'inusual; raro'),
        Flashcard(
            kanji: '見える',
            hiragana: 'みえる',
            romaji: 'mieru',
            meaning: 'ser visto; estar a la vista; parecer'),
        Flashcard(
            kanji: '港', hiragana: 'みなと', romaji: 'minato', meaning: 'puerto'),
        Flashcard(
            kanji: '味噌',
            hiragana: 'みそ',
            romaji: 'miso',
            meaning: 'pasta de soya fermentada'),
        Flashcard(
            kanji: '見つかる',
            hiragana: 'みつかる',
            romaji: 'mitsukaru',
            meaning: 'ser encontrado'),
        Flashcard(
            kanji: '見つける',
            hiragana: 'みつける',
            romaji: 'mitsukeru',
            meaning: 'encontrar'),
        Flashcard(
            kanji: '都', hiragana: 'みやこ', romaji: 'miyako', meaning: 'capital'),
        Flashcard(
            kanji: '湖', hiragana: 'みずうみ', romaji: 'mizuumi', meaning: 'lago'),
        Flashcard(
            kanji: '戻る',
            hiragana: 'もどる',
            romaji: 'modoru',
            meaning: 'volver; regresar'),
        Flashcard(
            kanji: '木綿', hiragana: 'もめん', romaji: 'momen', meaning: 'algodón'),
        Flashcard(
            kanji: '森', hiragana: 'もり', romaji: 'mori', meaning: 'bosque'),
        Flashcard(
            kanji: 'もし',
            hiragana: 'もし',
            romaji: 'moshi',
            meaning: 'si; en caso de'),
        Flashcard(
            kanji: '申し上げる',
            hiragana: 'もうしあげる',
            romaji: 'moushiageru',
            meaning: 'decir (respetuoso)'),
        Flashcard(
            kanji: '申す',
            hiragana: 'もうす',
            romaji: 'mousu',
            meaning: '(humble) llamarse; decir'),
        Flashcard(
            kanji: 'もうすぐ',
            hiragana: 'もうすぐ',
            romaji: 'mousugu',
            meaning: 'pronto'),
        Flashcard(
            kanji: '迎える',
            hiragana: 'むかえる',
            romaji: 'mukaeru',
            meaning: 'ir a buscar; recibir'),
        Flashcard(
            kanji: '昔',
            hiragana: 'むかし',
            romaji: 'mukashi',
            meaning: 'antiguamente; pasado'),
        Flashcard(
            kanji: '向かう',
            hiragana: 'むかう',
            romaji: 'mukau',
            meaning: 'dirigirse a; ir hacia'),
        Flashcard(
            kanji: '無理', hiragana: 'むり', romaji: 'muri', meaning: 'imposible'),
        Flashcard(
            kanji: '虫', hiragana: 'むし', romaji: 'mushi', meaning: 'insecto'),
        Flashcard(
            kanji: '息子', hiragana: 'むすこ', romaji: 'musuko', meaning: 'hijo'),
        Flashcard(
            kanji: '娘', hiragana: 'むすめ', romaji: 'musume', meaning: 'hija'),
        Flashcard(
            kanji: '投げる',
            hiragana: 'なげる',
            romaji: 'nageru',
            meaning: 'lanzar; arrojar'),
        Flashcard(
            kanji: '泣く', hiragana: 'なく', romaji: 'naku', meaning: 'llorar'),
        Flashcard(
            kanji: '無くなる',
            hiragana: 'なくなる',
            romaji: 'naku naru',
            meaning: 'desaparecer; perderse'),
        Flashcard(
            kanji: '亡くなる',
            hiragana: 'なくなる',
            romaji: 'nakunaru',
            meaning: 'fallecer; morir'),
        Flashcard(
            kanji: '生',
            hiragana: 'なま',
            romaji: 'nama',
            meaning: 'crudo; fresco'),
        Flashcard(
            kanji: '直る',
            hiragana: 'なおる',
            romaji: 'naoru',
            meaning: 'ser arreglado; ser reparado'),
        Flashcard(
            kanji: '治る',
            hiragana: 'なおる',
            romaji: 'naoru',
            meaning: 'sanar; curarse'),
        Flashcard(
            kanji: '慣れる',
            hiragana: 'なれる',
            romaji: 'nareru',
            meaning: 'acostumbrarse a'),
        Flashcard(
            kanji: '鳴る', hiragana: 'なる', romaji: 'naru', meaning: 'sonar'),
        Flashcard(
            kanji: 'なるほど',
            hiragana: 'なるほど',
            romaji: 'naruhodo',
            meaning: 'ya veo; entiendo'),
        Flashcard(
            kanji: '寝坊',
            hiragana: 'ねぼう',
            romaji: 'nebou',
            meaning: 'levantarse tarde; quedarse dormido'),
        Flashcard(
            kanji: '値段',
            hiragana: 'ねだん',
            romaji: 'nedan',
            meaning: 'precio; coste'),
        Flashcard(
            kanji: '眠い',
            hiragana: 'ねむい',
            romaji: 'nemui',
            meaning: 'soñoliento; adormecido'),
        Flashcard(
            kanji: '眠る', hiragana: 'ねむる', romaji: 'nemuru', meaning: 'dormir'),
        Flashcard(
            kanji: '熱', hiragana: 'ねつ', romaji: 'netsu', meaning: 'fiebre'),
        Flashcard(
            kanji: '苦い', hiragana: 'にがい', romaji: 'nigai', meaning: 'amargo'),
        Flashcard(
            kanji: '逃げる',
            hiragana: 'にげる',
            romaji: 'nigeru',
            meaning: 'escapar'),
        Flashcard(
            kanji: '二階建て',
            hiragana: 'にかいだて',
            romaji: 'nikaidate',
            meaning: 'edificio de dos pisos'),
        Flashcard(
            kanji: '人形',
            hiragana: 'にんぎょう',
            romaji: 'ningyou',
            meaning: 'muñeca'),
        Flashcard(
            kanji: '匂い', hiragana: 'におい', romaji: 'nioi', meaning: 'olor'),
        Flashcard(
            kanji: '似る', hiragana: 'にる', romaji: 'niru', meaning: 'parecerse'),
        Flashcard(
            kanji: '喉', hiragana: 'のど', romaji: 'nodo', meaning: 'garganta'),
        Flashcard(
            kanji: '残る',
            hiragana: 'のこる',
            romaji: 'nokoru',
            meaning: 'quedar; permanecer'),
        Flashcard(
            kanji: '乗り換える',
            hiragana: 'のりかえる',
            romaji: 'norikaeru',
            meaning: 'cambiar (de tren, autobús, etc.)'),
        Flashcard(
            kanji: '乗り物',
            hiragana: 'のりもの',
            romaji: 'norimono',
            meaning: 'vehículo'),
        Flashcard(
            kanji: '濡れる',
            hiragana: 'ぬれる',
            romaji: 'nureru',
            meaning: 'mojarse'),
        Flashcard(
            kanji: '塗る',
            hiragana: 'ぬる',
            romaji: 'nuru',
            meaning: 'pintar; enlucir'),
        Flashcard(
            kanji: '盗む', hiragana: 'ぬすむ', romaji: 'nusumu', meaning: 'robar'),
        Flashcard(
            kanji: '入学',
            hiragana: 'にゅうがく',
            romaji: 'nyuugaku',
            meaning: 'entrada a la escuela o universidad; matrícula'),
        Flashcard(
            kanji: '入院',
            hiragana: 'にゅういん',
            romaji: 'nyuuin',
            meaning: 'hospitalización'),
        Flashcard(
            kanji: '落ちる',
            hiragana: 'おちる',
            romaji: 'ochiru',
            meaning: 'caer; precipitarse'),
        Flashcard(
            kanji: '踊り', hiragana: 'おどり', romaji: 'odori', meaning: 'baile'),
        Flashcard(
            kanji: '驚く',
            hiragana: 'おどろく',
            romaji: 'odoroku',
            meaning: 'asombrarse; sorprenderse'),
        Flashcard(
            kanji: '踊る', hiragana: 'おどる', romaji: 'odoru', meaning: 'bailar'),
        Flashcard(
            kanji: 'お出でになる',
            hiragana: 'おいでになる',
            romaji: 'oide ni naru',
            meaning: '(ir respetuoso) ser'),
        Flashcard(
            kanji: 'お祝い',
            hiragana: 'おいわい',
            romaji: 'oiwai',
            meaning: 'celebración; felicitación'),
        Flashcard(
            kanji: 'お嬢さん',
            hiragana: 'おじょうさん',
            romaji: 'ojousan',
            meaning: '(se refiere a la hija de alguien) señorita'),
        Flashcard(
            kanji: '可笑しい',
            hiragana: 'おかしい',
            romaji: 'okashii',
            meaning: 'extraño; gracioso'),
        Flashcard(
            kanji: '行う',
            hiragana: 'おこなう',
            romaji: 'okonau',
            meaning: 'realizar; llevar a cabo'),
        Flashcard(
            kanji: '怒る',
            hiragana: 'おこる',
            romaji: 'okoru',
            meaning: 'enojarse; enfadarse'),
        Flashcard(
            kanji: '起こす',
            hiragana: 'おこす',
            romaji: 'okosu',
            meaning: 'despertar; causar'),
        Flashcard(
            kanji: '億',
            hiragana: 'おく',
            romaji: 'oku',
            meaning: 'cien millones'),
        Flashcard(
            kanji: '屋上',
            hiragana: 'おくじょう',
            romaji: 'okujou',
            meaning: 'azotea; terraza'),
        Flashcard(
            kanji: '遅れる',
            hiragana: 'おくれる',
            romaji: 'okureru',
            meaning: 'retrasarse'),
        Flashcard(
            kanji: '贈り物',
            hiragana: 'おくりもの',
            romaji: 'okurimono',
            meaning: 'regalo; presente'),
        Flashcard(
            kanji: '送る',
            hiragana: 'おくる',
            romaji: 'okuru',
            meaning: 'enviar; mandar'),
        Flashcard(
            kanji: 'お祭り',
            hiragana: 'おまつり',
            romaji: 'omatsuri',
            meaning: 'festival'),
        Flashcard(
            kanji: 'お見舞い',
            hiragana: 'おみまい',
            romaji: 'omimai',
            meaning: 'visitar a una persona enferma o afligida'),
        Flashcard(
            kanji: 'お土産',
            hiragana: 'おみやげ',
            romaji: 'omiyage',
            meaning: 'recuerdo; souvenir'),
        Flashcard(
            kanji: 'おもちゃ',
            hiragana: 'おもちゃ',
            romaji: 'omocha',
            meaning: 'juguete'),
        Flashcard(
            kanji: '思い出す',
            hiragana: 'おもいだす',
            romaji: 'omoidasu',
            meaning: 'recordar'),
        Flashcard(
            kanji: '表',
            hiragana: 'おもて',
            romaji: 'omote',
            meaning: 'parte delantera; cara'),
        Flashcard(
            kanji: 'オートバイ',
            hiragana: 'オートバイ',
            romaji: 'ootobai',
            meaning: 'motocicleta'),
        Flashcard(
            kanji: 'お礼',
            hiragana: 'おれい',
            romaji: 'orei',
            meaning: 'gracias; expresión de gratitud'),
        Flashcard(
            kanji: '折れる',
            hiragana: 'おれる',
            romaji: 'oreru',
            meaning: 'romperse; doblarse'),
        Flashcard(
            kanji: '下りる',
            hiragana: 'おりる',
            romaji: 'oriru',
            meaning: 'bajarse (de un vehículo); descender'),
        Flashcard(
            kanji: '折る',
            hiragana: 'おる',
            romaji: 'oru',
            meaning: 'romper; doblar'),
        Flashcard(
            kanji: '押し入れ',
            hiragana: 'おしいれ',
            romaji: 'oshiire',
            meaning: 'armario empotrado; ropero'),
        Flashcard(
            kanji: '仰る',
            hiragana: 'おっしゃる',
            romaji: 'ossharu',
            meaning: '(hablar respetuosamente) decir'),
        Flashcard(
            kanji: 'お宅',
            hiragana: 'おたく',
            romaji: 'otaku',
            meaning: 'su hogar; casa de alguien'),
        Flashcard(
            kanji: '音',
            hiragana: 'おと',
            romaji: 'oto',
            meaning: 'sonido; ruido'),
        Flashcard(
            kanji: '落とす',
            hiragana: 'おとす',
            romaji: 'otosu',
            meaning: 'dejar caer; soltar'),
        Flashcard(
            kanji: 'お釣り',
            hiragana: 'おつり',
            romaji: 'otsuri',
            meaning: 'cambio (de dinero)'),
        Flashcard(
            kanji: '夫',
            hiragana: 'おっと',
            romaji: 'otto',
            meaning: 'esposo; marido'),
        Flashcard(
            kanji: '終わり',
            hiragana: 'おわり',
            romaji: 'owari',
            meaning: 'fin; término'),
        Flashcard(kanji: '親', hiragana: 'おや', romaji: 'oya', meaning: 'padres'),
        Flashcard(
            kanji: '泳ぎ方',
            hiragana: 'およぎかた',
            romaji: 'oyogikata',
            meaning: 'manera de nadar'),
        Flashcard(
            kanji: 'パート',
            hiragana: 'パート',
            romaji: 'paato',
            meaning: 'trabajo a tiempo parcial'),
        Flashcard(
            kanji: 'パソコン',
            hiragana: 'パソコン',
            romaji: 'pasokon',
            meaning: 'ordenador personal; PC'),
        Flashcard(
            kanji: 'ピアノ', hiragana: 'ピアノ', romaji: 'piano', meaning: 'piano'),
        Flashcard(
            kanji: 'プレゼント',
            hiragana: 'プレゼント',
            romaji: 'purezento',
            meaning: 'regalo; obsequio'),
        Flashcard(
            kanji: '冷房',
            hiragana: 'れいぼう',
            romaji: 'reibou',
            meaning: 'aire acondicionado'),
        Flashcard(
            kanji: 'レジ',
            hiragana: 'レジ',
            romaji: 'reji',
            meaning: 'caja (en una tienda)'),
        Flashcard(
            kanji: '歴史',
            hiragana: 'れきし',
            romaji: 'rekishi',
            meaning: 'historia'),
        Flashcard(
            kanji: '連絡',
            hiragana: 'れんらく',
            romaji: 'renraku',
            meaning: 'contacto; ponerse en contacto'),
        Flashcard(
            kanji: 'レポート',
            hiragana: 'レポート',
            romaji: 'repooto',
            meaning: 'informe; reporte'),
        Flashcard(
            kanji: '利用',
            hiragana: 'りよう',
            romaji: 'riyou',
            meaning: 'uso; utilización'),
        Flashcard(
            kanji: '理由',
            hiragana: 'りゆう',
            romaji: 'riyuu',
            meaning: 'razón; motivo'),
        Flashcard(
            kanji: '留守', hiragana: 'るす', romaji: 'rusu', meaning: 'ausencia'),
        Flashcard(
            kanji: '旅館',
            hiragana: 'りょかん',
            romaji: 'ryokan',
            meaning: 'posada tradicional japonesa'),
        Flashcard(
            kanji: '両方',
            hiragana: 'りょうほう',
            romaji: 'ryouhou',
            meaning: 'ambos lados; ambos'),
        Flashcard(
            kanji: '寂しい',
            hiragana: 'さびしい',
            romaji: 'sabishii',
            meaning: 'solitario; solo'),
        Flashcard(
            kanji: '下がる',
            hiragana: 'さがる',
            romaji: 'sagaru',
            meaning: 'bajarse; descender'),
        Flashcard(
            kanji: '探す', hiragana: 'さがす', romaji: 'sagasu', meaning: 'buscar'),
        Flashcard(
            kanji: '下げる',
            hiragana: 'さげる',
            romaji: 'sageru',
            meaning: 'bajar; descender'),
        Flashcard(
            kanji: '最後',
            hiragana: 'さいご',
            romaji: 'saigo',
            meaning: 'último; final'),
        Flashcard(
            kanji: '最近',
            hiragana: 'さいきん',
            romaji: 'saikin',
            meaning: 'últimamente; recientemente'),
        Flashcard(
            kanji: '最初',
            hiragana: 'さいしょ',
            romaji: 'saisho',
            meaning: 'primero; principio'),
        Flashcard(
            kanji: '坂',
            hiragana: 'さか',
            romaji: 'saka',
            meaning: 'cuesta; pendiente'),
        Flashcard(
            kanji: '盛ん',
            hiragana: 'さかん',
            romaji: 'sakan',
            meaning: 'activo; próspero'),
        Flashcard(
            kanji: '昨夜', hiragana: 'さくや', romaji: 'sakuya', meaning: 'anoche'),
        Flashcard(
            kanji: 'サンダル',
            hiragana: 'サンダル',
            romaji: 'sandaru',
            meaning: 'sandalias'),
        Flashcard(
            kanji: 'サンドイッチ',
            hiragana: 'サンドイッチ',
            romaji: 'sandoicchi',
            meaning: 'sándwich'),
        Flashcard(
            kanji: '産業',
            hiragana: 'さんぎょう',
            romaji: 'sangyou',
            meaning: 'industria'),
        Flashcard(
            kanji: 'サラダ',
            hiragana: 'サラダ',
            romaji: 'sarada',
            meaning: 'ensalada'),
        Flashcard(
            kanji: '再来月',
            hiragana: 'さらいげつ',
            romaji: 'saraigetsu',
            meaning: 'mes que viene'),
        Flashcard(
            kanji: '再来週',
            hiragana: 'さらいしゅう',
            romaji: 'saraishuu',
            meaning: 'semana que viene; semana después de la próxima'),
        Flashcard(
            kanji: '差し上げる',
            hiragana: 'さしあげる',
            romaji: 'sashiageru',
            meaning: 'dar (con respeto)'),
        Flashcard(
            kanji: '騒ぐ',
            hiragana: 'さわぐ',
            romaji: 'sawagu',
            meaning: 'hacer ruido; estar emocionado'),
        Flashcard(
            kanji: '触る', hiragana: 'さわる', romaji: 'sawaru', meaning: 'tocar'),
        Flashcard(
            kanji: '生物',
            hiragana: 'せいぶつ',
            romaji: 'seibutsu',
            meaning: 'ser vivo'),
        Flashcard(
            kanji: '政治', hiragana: 'せいじ', romaji: 'seiji', meaning: 'política'),
        Flashcard(
            kanji: '生活',
            hiragana: 'せいかつ',
            romaji: 'seikatsu',
            meaning: 'vida diaria; subsistencia'),
        Flashcard(
            kanji: '生命',
            hiragana: 'せいめい',
            romaji: 'seimei',
            meaning: 'vida (como concepto biológico)'),
        Flashcard(
            kanji: '生産',
            hiragana: 'せいさん',
            romaji: 'seisan',
            meaning: 'producción'),
        Flashcard(
            kanji: '西洋',
            hiragana: 'せいよう',
            romaji: 'seiyou',
            meaning: 'occidente; países occidentales'),
        Flashcard(
            kanji: '世界', hiragana: 'せかい', romaji: 'sekai', meaning: 'mundo'),
        Flashcard(
            kanji: '席', hiragana: 'せき', romaji: 'seki', meaning: 'asiento'),
        Flashcard(kanji: '線', hiragana: 'せん', romaji: 'sen', meaning: 'línea'),
        Flashcard(
            kanji: '背中', hiragana: 'せなか', romaji: 'senaka', meaning: 'espalda'),
        Flashcard(
            kanji: '先輩',
            hiragana: 'せんぱい',
            romaji: 'senpai',
            meaning: 'persona mayor; senior'),
        Flashcard(
            kanji: '戦争', hiragana: 'せんそう', romaji: 'sensou', meaning: 'guerra'),
        Flashcard(
            kanji: '説明',
            hiragana: 'せつめい',
            romaji: 'setsumei',
            meaning: 'explicación'),
        Flashcard(
            kanji: '社長',
            hiragana: 'しゃちょう',
            romaji: 'shachou',
            meaning: 'presidente de la compañía; director general'),
        Flashcard(
            kanji: '社会',
            hiragana: 'しゃかい',
            romaji: 'shakai',
            meaning: 'sociedad'),
        Flashcard(kanji: '市', hiragana: 'し', romaji: 'shi', meaning: 'ciudad'),
        Flashcard(
            kanji: '試合',
            hiragana: 'しあい',
            romaji: 'shiai',
            meaning: 'partido; juego; competencia'),
        Flashcard(
            kanji: '叱る',
            hiragana: 'しかる',
            romaji: 'shikaru',
            meaning: 'regañar'),
        Flashcard(
            kanji: '仕方',
            hiragana: 'しかた',
            romaji: 'shikata',
            meaning: 'manera; método'),
        Flashcard(
            kanji: '試験', hiragana: 'しけん', romaji: 'shiken', meaning: 'examen'),
        Flashcard(
            kanji: 'しっかり',
            hiragana: 'しっかり',
            romaji: 'shikkari',
            meaning: 'firmemente; con fuerza'),
        Flashcard(kanji: '島', hiragana: 'しま', romaji: 'shima', meaning: 'isla'),
        Flashcard(
            kanji: '市民',
            hiragana: 'しみん',
            romaji: 'shimin',
            meaning: 'ciudadano'),
        Flashcard(
            kanji: '品物',
            hiragana: 'しなもの',
            romaji: 'shinamono',
            meaning: 'producto; artículo'),
        Flashcard(
            kanji: '新聞社',
            hiragana: 'しんぶんしゃ',
            romaji: 'shinbunsha',
            meaning: 'compañía de periódicos'),
        Flashcard(
            kanji: '親切',
            hiragana: 'しんせつ',
            romaji: 'shinsetsu',
            meaning: 'amable; bondadoso'),
        Flashcard(
            kanji: '失敗',
            hiragana: 'しっぱい',
            romaji: 'shippai',
            meaning: 'fracaso'),
        Flashcard(
            kanji: '調べる',
            hiragana: 'しらべる',
            romaji: 'shiraberu',
            meaning: 'investigar'),
        Flashcard(
            kanji: '知らせる',
            hiragana: 'しらせる',
            romaji: 'shiraseru',
            meaning: 'notificar'),
        Flashcard(
            kanji: '下着',
            hiragana: 'したぎ',
            romaji: 'shitagi',
            meaning: 'ropa interior'),
        Flashcard(
            kanji: '食料品',
            hiragana: 'しょくりょうひん',
            romaji: 'shokuryouhin',
            meaning: 'alimentos; comestibles'),
        Flashcard(
            kanji: '小学校',
            hiragana: 'しょうがっこう',
            romaji: 'shougakkou',
            meaning: 'escuela primaria'),
        Flashcard(
            kanji: '生じる',
            hiragana: 'しょうじる',
            romaji: 'shoujiru',
            meaning: 'producirse; originarse'),
        Flashcard(
            kanji: '紹介',
            hiragana: 'しょうかい',
            romaji: 'shoukai',
            meaning: 'introducción'),
        Flashcard(
            kanji: '将来',
            hiragana: 'しょうらい',
            romaji: 'shourai',
            meaning: 'futuro'),
        Flashcard(
            kanji: '小説',
            hiragana: 'しょうせつ',
            romaji: 'shousetsu',
            meaning: 'novela'),
        Flashcard(
            kanji: '趣味',
            hiragana: 'しゅみ',
            romaji: 'shumi',
            meaning: 'pasatiempo; afición'),
        Flashcard(
            kanji: '習慣',
            hiragana: 'しゅうかん',
            romaji: 'shuukan',
            meaning: 'costumbre; hábito'),
        Flashcard(
            kanji: '祖母', hiragana: 'そぼ', romaji: 'sobo', meaning: 'abuela'),
        Flashcard(
            kanji: '育てる',
            hiragana: 'そだてる',
            romaji: 'sodateru',
            meaning: 'criar; educar'),
        Flashcard(
            kanji: '祖父', hiragana: 'そふ', romaji: 'sofu', meaning: 'abuelo'),
        Flashcard(
            kanji: 'ソフト',
            hiragana: 'そふと',
            romaji: 'sofuto',
            meaning: 'software; suave'),
        Flashcard(
            kanji: 'そんな',
            hiragana: 'そんな',
            romaji: 'sonna',
            meaning: 'tal; así'),
        Flashcard(
            kanji: 'それで',
            hiragana: 'それで',
            romaji: 'sore de',
            meaning: 'por lo tanto; así que'),
        Flashcard(
            kanji: 'それほど',
            hiragana: 'それほど',
            romaji: 'sore hodo',
            meaning: 'tan; tanto'),
        Flashcard(
            kanji: 'そろそろ',
            hiragana: 'そろそろ',
            romaji: 'sorosoro',
            meaning: 'poco a poco; gradualmente'),
        Flashcard(
            kanji: '卒業',
            hiragana: 'そつぎょう',
            romaji: 'sotsugyou',
            meaning: 'graduación'),
        Flashcard(
            kanji: '相談',
            hiragana: 'そうだん',
            romaji: 'soudan',
            meaning: 'consulta; discusión'),
        Flashcard(
            kanji: '素晴らしい',
            hiragana: 'すばらしい',
            romaji: 'subarashii',
            meaning: 'maravilloso'),
        Flashcard(
            kanji: '滑る',
            hiragana: 'すべる',
            romaji: 'suberu',
            meaning: 'resbalar; deslizarse'),
        Flashcard(
            kanji: '凄い',
            hiragana: 'すごい',
            romaji: 'sugoi',
            meaning: 'tremendo; asombroso'),
        Flashcard(
            kanji: '水道',
            hiragana: 'すいどう',
            romaji: 'suidou',
            meaning: 'suministro de agua; agua corriente'),
        Flashcard(
            kanji: '水泳',
            hiragana: 'すいえい',
            romaji: 'suiei',
            meaning: 'natación'),
        Flashcard(
            kanji: 'すっかり',
            hiragana: 'すっかり',
            romaji: 'sukkari',
            meaning: 'completamente; totalmente'),
        Flashcard(
            kanji: '空く',
            hiragana: 'すく',
            romaji: 'suku',
            meaning: 'tener hambre'),
        Flashcard(
            kanji: 'スクリーン',
            hiragana: 'すくりーん',
            romaji: 'sukuriin',
            meaning: 'pantalla'),
        Flashcard(
            kanji: '隅', hiragana: 'すみ', romaji: 'sumi', meaning: 'rincón'),
        Flashcard(
            kanji: '済む',
            hiragana: 'すむ',
            romaji: 'sumu',
            meaning: 'terminar; acabar'),
        Flashcard(kanji: '砂', hiragana: 'すな', romaji: 'suna', meaning: 'arena'),
        Flashcard(
            kanji: 'すり', hiragana: 'すり', romaji: 'suri', meaning: 'carterista'),
        Flashcard(
            kanji: 'スーツケース',
            hiragana: 'すーつけーす',
            romaji: 'sustsukeesu',
            meaning: 'maleta; maletín'),
        Flashcard(
            kanji: '進む',
            hiragana: 'すすむ',
            romaji: 'susumu',
            meaning: 'avanzar; progresar'),
        Flashcard(
            kanji: 'ステーキ',
            hiragana: 'すてーき',
            romaji: 'suteeki',
            meaning: 'filete; steak'),
        Flashcard(
            kanji: 'ステレオ',
            hiragana: 'すてれお',
            romaji: 'sutereo',
            meaning: 'estéreo; sistema de sonido'),
        Flashcard(
            kanji: '捨てる',
            hiragana: 'すてる',
            romaji: 'suteru',
            meaning: 'tirar; desechar'),
        Flashcard(
            kanji: '数学',
            hiragana: 'すうがく',
            romaji: 'suugaku',
            meaning: 'matemáticas'),
        Flashcard(
            kanji: 'スーツ', hiragana: 'すーつ', romaji: 'suutsu', meaning: 'traje'),
        Flashcard(
            kanji: '正しい',
            hiragana: 'ただしい',
            romaji: 'tadashii',
            meaning: 'correcto; justo'),
        Flashcard(
            kanji: '退院',
            hiragana: 'たいいん',
            romaji: 'taiin',
            meaning: 'alta hospitalaria'),
        Flashcard(
            kanji: '台風', hiragana: 'たいふう', romaji: 'taifuu', meaning: 'tifón'),
        Flashcard(
            kanji: 'タイプ',
            hiragana: 'たいぷ',
            romaji: 'taipu',
            meaning: 'tipo; estilo'),
        Flashcard(
            kanji: 'たいてい',
            hiragana: 'たいてい',
            romaji: 'taitei',
            meaning: 'generalmente; por lo general'),
        Flashcard(
            kanji: 'たまに',
            hiragana: 'たまに',
            romaji: 'tamani',
            meaning: 'de vez en cuando; ocasionalmente'),
        Flashcard(
            kanji: '棚',
            hiragana: 'たな',
            romaji: 'tana',
            meaning: 'estante; repisa'),
        Flashcard(
            kanji: '誕生',
            hiragana: 'たんじょう',
            romaji: 'tanjou',
            meaning: 'nacimiento'),
        Flashcard(
            kanji: '楽しみ',
            hiragana: 'たのしみ',
            romaji: 'tanoshimi',
            meaning: 'expectativa; anticipación'),
        Flashcard(
            kanji: '倒れる',
            hiragana: 'たおれる',
            romaji: 'taoreru',
            meaning: 'caerse; desplomarse'),
        Flashcard(
            kanji: '足りる',
            hiragana: 'たりる',
            romaji: 'tariru',
            meaning: 'ser suficiente; bastar'),
        Flashcard(
            kanji: '足す',
            hiragana: 'たす',
            romaji: 'tasu',
            meaning: 'sumar; añadir'),
        Flashcard(
            kanji: '畳',
            hiragana: 'たたみ',
            romaji: 'tatami',
            meaning: 'tatami (esteras de paja japonesas)'),
        Flashcard(
            kanji: '建てる',
            hiragana: 'たてる',
            romaji: 'tateru',
            meaning: 'construir; erigir'),
        Flashcard(
            kanji: '訪ねる',
            hiragana: 'たずねる',
            romaji: 'tazuneru',
            meaning: 'visitar'),
        Flashcard(
            kanji: '尋ねる',
            hiragana: 'たずねる',
            romaji: 'tazuneru',
            meaning: 'preguntar; inquirir'),
        Flashcard(
            kanji: '手袋',
            hiragana: 'てぶくろ',
            romaji: 'tebukuro',
            meaning: 'guantes'),
        Flashcard(
            kanji: '丁寧',
            hiragana: 'ていねい',
            romaji: 'teinei',
            meaning: 'educado; cortés'),
        Flashcard(
            kanji: 'テキスト',
            hiragana: 'てきすと',
            romaji: 'tekisuto',
            meaning: 'texto; libro de texto'),
        Flashcard(
            kanji: '適当',
            hiragana: 'てきとう',
            romaji: 'tekitou',
            meaning: 'apropiado; adecuado'),
        Flashcard(
            kanji: '点',
            hiragana: 'てん',
            romaji: 'ten',
            meaning: 'punto; punto decimal'),
        Flashcard(
            kanji: '店員',
            hiragana: 'てんいん',
            romaji: 'ten in',
            meaning: 'dependiente; empleado de tienda'),
        Flashcard(
            kanji: 'テニス', hiragana: 'てにす', romaji: 'tenisu', meaning: 'tenis'),
        Flashcard(
            kanji: '天気予報',
            hiragana: 'てんきよほう',
            romaji: 'tenkiyohou',
            meaning: 'pronóstico del tiempo'),
        Flashcard(
            kanji: '展覧会',
            hiragana: 'てんらんかい',
            romaji: 'tenrankai',
            meaning: 'exposición; feria'),
        Flashcard(
            kanji: '寺', hiragana: 'てら', romaji: 'tera', meaning: 'templo'),
        Flashcard(
            kanji: '手伝う',
            hiragana: 'てつだう',
            romaji: 'tetsudau',
            meaning: 'ayudar'),
        Flashcard(
            kanji: '途中',
            hiragana: 'とちゅう',
            romaji: 'tochuu',
            meaning: 'en el camino; a medio camino'),
        Flashcard(
            kanji: '届ける',
            hiragana: 'とどける',
            romaji: 'todokeru',
            meaning: 'entregar; enviar'),
        Flashcard(
            kanji: '特急',
            hiragana: 'とっきゅう',
            romaji: 'tokkyuu',
            meaning: 'tren expreso limitado (más rápido que un expreso)'),
        Flashcard(
            kanji: '床屋',
            hiragana: 'とこや',
            romaji: 'tokoya',
            meaning: 'barbería'),
        Flashcard(
            kanji: '特別',
            hiragana: 'とくべつ',
            romaji: 'tokubetsu',
            meaning: 'especial; particular; extraordinario'),
        Flashcard(
            kanji: '特に',
            hiragana: 'とくに',
            romaji: 'tokuni',
            meaning: 'especialmente; en particular; expresamente'),
        Flashcard(
            kanji: '泊まる',
            hiragana: 'とまる',
            romaji: 'tomaru',
            meaning: 'alojarse; quedarse'),
        Flashcard(
            kanji: '止める',
            hiragana: 'とめる',
            romaji: 'tomeru',
            meaning: 'detener algo'),
        Flashcard(
            kanji: '遠く', hiragana: 'とおく', romaji: 'tooku', meaning: 'distante'),
        Flashcard(
            kanji: '通る',
            hiragana: 'とおる',
            romaji: 'tooru',
            meaning: 'pasar por; atravesar'),
        Flashcard(
            kanji: '取り替える',
            hiragana: 'とりかえる',
            romaji: 'torikaeru',
            meaning: 'cambiar; reemplazar'),
        Flashcard(
            kanji: '到頭',
            hiragana: 'とうとう',
            romaji: 'toutou',
            meaning: 'finalmente; después de todo'),
        Flashcard(
            kanji: '続ける',
            hiragana: 'つづける',
            romaji: 'tsudzukeru',
            meaning: 'continuar; seguir'),
        Flashcard(
            kanji: '続く',
            hiragana: 'つづく',
            romaji: 'tsudzuku',
            meaning: 'continuar'),
        Flashcard(
            kanji: '都合',
            hiragana: 'つごう',
            romaji: 'tsugou',
            meaning: 'conveniencia; circunstancias'),
        Flashcard(
            kanji: '捕まえる',
            hiragana: 'つかまえる',
            romaji: 'tsukamaeru',
            meaning: 'atrapar; capturar'),
        Flashcard(
            kanji: '漬ける',
            hiragana: 'つける',
            romaji: 'tsukeru',
            meaning: 'remojar; sumergir'),
        Flashcard(kanji: '月', hiragana: 'つき', romaji: 'tsuki', meaning: 'luna'),
        Flashcard(
            kanji: '付く',
            hiragana: 'つく',
            romaji: 'tsuku',
            meaning: 'estar adherido; estar presente'),
        Flashcard(
            kanji: '妻',
            hiragana: 'つま',
            romaji: 'tsuma',
            meaning: 'esposa (forma humilde)'),
        Flashcard(
            kanji: '連れる',
            hiragana: 'つれる',
            romaji: 'tsureru',
            meaning: 'llevar consigo'),
        Flashcard(
            kanji: '釣る', hiragana: 'つる', romaji: 'tsuru', meaning: 'pescar'),
        Flashcard(
            kanji: '伝える',
            hiragana: 'つたえる',
            romaji: 'tsutaeru',
            meaning: 'transmitir; comunicar'),
        Flashcard(
            kanji: '包む',
            hiragana: 'つつむ',
            romaji: 'tsutsumu',
            meaning: 'envolver'),
        Flashcard(kanji: '腕', hiragana: 'うで', romaji: 'ude', meaning: 'brazo'),
        Flashcard(
            kanji: '植える', hiragana: 'うえる', romaji: 'ueru', meaning: 'plantar'),
        Flashcard(
            kanji: '動く', hiragana: 'うごく', romaji: 'ugoku', meaning: 'moverse'),
        Flashcard(
            kanji: '伺う',
            hiragana: 'うかがう',
            romaji: 'ukagau',
            meaning: 'visitar (humilde)'),
        Flashcard(
            kanji: '受ける',
            hiragana: 'うける',
            romaji: 'ukeru',
            meaning: 'tomar (una lección o examen)'),
        Flashcard(
            kanji: '受付',
            hiragana: 'うけつけ',
            romaji: 'uketsuke',
            meaning: 'recepción'),
        Flashcard(
            kanji: '生まれ',
            hiragana: 'うまれ',
            romaji: 'umare',
            meaning: 'nacimiento'),
        Flashcard(
            kanji: '運転手',
            hiragana: 'うんてんしゅ',
            romaji: 'untenshu',
            meaning: 'conductor; chofer'),
        Flashcard(
            kanji: '裏', hiragana: 'うら', romaji: 'ura', meaning: 'reverso'),
        Flashcard(
            kanji: '嬉しい',
            hiragana: 'うれしい',
            romaji: 'ureshii',
            meaning: 'feliz; contento'),
        Flashcard(
            kanji: '売り場',
            hiragana: 'うりば',
            romaji: 'uriba',
            meaning: 'área de venta'),
        Flashcard(
            kanji: '嘘', hiragana: 'うそ', romaji: 'uso', meaning: 'mentira'),
        Flashcard(
            kanji: '打つ', hiragana: 'うつ', romaji: 'utsu', meaning: 'golpear'),
        Flashcard(
            kanji: '美しい',
            hiragana: 'うつくしい',
            romaji: 'utsukushii',
            meaning: 'hermoso'),
        Flashcard(
            kanji: '移る',
            hiragana: 'うつる',
            romaji: 'utsuru',
            meaning: 'mudarse; transferirse'),
        Flashcard(
            kanji: '写す',
            hiragana: 'うつす',
            romaji: 'utsusu',
            meaning: 'copiar; fotografiar'),
        Flashcard(
            kanji: 'ワープロ',
            hiragana: 'わーぷろ',
            romaji: 'waapuro',
            meaning: 'procesador de texto'),
        Flashcard(
            kanji: '別れる',
            hiragana: 'わかれる',
            romaji: 'wakareru',
            meaning: 'separarse'),
        Flashcard(
            kanji: '沸かす',
            hiragana: 'わかす',
            romaji: 'wakasu',
            meaning: 'hervir; calentar'),
        Flashcard(
            kanji: '沸く', hiragana: 'わく', romaji: 'waku', meaning: 'hervir'),
        Flashcard(
            kanji: '笑う',
            hiragana: 'わらう',
            romaji: 'warau',
            meaning: 'reírse; sonreír'),
        Flashcard(
            kanji: '割れる',
            hiragana: 'われる',
            romaji: 'wareru',
            meaning: 'romperse'),
        Flashcard(
            kanji: '割合',
            hiragana: 'わりあい',
            romaji: 'wariai',
            meaning: 'proporción; tasa'),
        Flashcard(
            kanji: '忘れ物',
            hiragana: 'わすれもの',
            romaji: 'wasuremono',
            meaning: 'objeto olvidado'),
        Flashcard(
            kanji: '焼ける',
            hiragana: 'やける',
            romaji: 'yakeru',
            meaning: 'quemarse; tostarse'),
        Flashcard(
            kanji: '焼く',
            hiragana: 'やく',
            romaji: 'yaku',
            meaning: 'hornear; asar'),
        Flashcard(
            kanji: '役に立つ',
            hiragana: 'やくにたつ',
            romaji: 'yakunitatsu',
            meaning: 'ser útil'),
        Flashcard(
            kanji: '約束',
            hiragana: 'やくそく',
            romaji: 'yakusoku',
            meaning: 'promesa'),
        Flashcard(
            kanji: '止む',
            hiragana: 'やむ',
            romaji: 'yamu',
            meaning: 'parar; cesar (de llover, etc.)'),
        Flashcard(
            kanji: 'やっぱり',
            hiragana: 'やっぱり',
            romaji: 'yappari',
            meaning: 'como pensaba; después de todo'),
        Flashcard(
            kanji: '優しい',
            hiragana: 'やさしい',
            romaji: 'yasashii',
            meaning: 'amable; gentil'),
        Flashcard(
            kanji: '痩せる',
            hiragana: 'やせる',
            romaji: 'yaseru',
            meaning: 'adelgazar; volverse delgado'),
        Flashcard(
            kanji: '柔らかい',
            hiragana: 'やわらかい',
            romaji: 'yawarakai',
            meaning: 'blando; suave'),
        Flashcard(
            kanji: '汚れる',
            hiragana: 'よごれる',
            romaji: 'yogoreru',
            meaning: 'ensuciarse'),
        Flashcard(
            kanji: '喜ぶ',
            hiragana: 'よろこぶ',
            romaji: 'yorokobu',
            meaning: 'alegrarse; estar contento'),
        Flashcard(
            kanji: '寄る',
            hiragana: 'よる',
            romaji: 'yoru',
            meaning: 'visitar; acercarse'),
        Flashcard(
            kanji: '予習',
            hiragana: 'よしゅう',
            romaji: 'yoshuu',
            meaning: 'preparación (para una lección)'),
        Flashcard(
            kanji: '予定',
            hiragana: 'よてい',
            romaji: 'yotei',
            meaning: 'plan; programa'),
        Flashcard(
            kanji: '用',
            hiragana: 'よう',
            romaji: 'you',
            meaning: 'tarea; negocio; propósito'),
        Flashcard(
            kanji: '用意',
            hiragana: 'ようい',
            romaji: 'youi',
            meaning: 'preparación; arreglo'),
        Flashcard(
            kanji: '用事',
            hiragana: 'ようじ',
            romaji: 'youji',
            meaning: 'asuntos que hacer; tareas'),
        Flashcard(
            kanji: '予約', hiragana: 'よやく', romaji: 'yoyaku', meaning: 'reserva'),
        Flashcard(
            kanji: '湯', hiragana: 'ゆ', romaji: 'yu', meaning: 'agua caliente'),
        Flashcard(kanji: '指', hiragana: 'ゆび', romaji: 'yubi', meaning: 'dedo'),
        Flashcard(
            kanji: '指輪',
            hiragana: 'ゆびわ',
            romaji: 'yubiwa',
            meaning: 'anillo (de dedo)'),
        Flashcard(kanji: '夢', hiragana: 'ゆめ', romaji: 'yume', meaning: 'sueño'),
        Flashcard(
            kanji: '揺れる',
            hiragana: 'ゆれる',
            romaji: 'yureru',
            meaning: 'mecerse; balancearse'),
        Flashcard(
            kanji: '残念',
            hiragana: 'ざんねん',
            romaji: 'zannen',
            meaning: 'lamentable; desafortunado'),
        Flashcard(
            kanji: '全然',
            hiragana: 'ぜんぜん',
            romaji: 'zenzen',
            meaning: 'en absoluto; nada en absoluto')
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
        // builder: (context) => HiraganaTestScreenJP(flashcards: _flashcards),
        builder: (context) => TestSelectionScreen(flashcards: flashcards),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.level}',
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
        label: Text(
          'Escoger test',
          style: TextStyle(color: Colors.black),
        ),
        icon: Icon(
          Icons.assignment,
          color: Colors.black,
        ),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}
