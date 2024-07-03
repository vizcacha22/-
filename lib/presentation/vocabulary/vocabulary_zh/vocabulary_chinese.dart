import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Flashcard {
  final String hanzi;
  final String pinyin;
  final String meaning;
  final String audioFilePath;
  bool showDetails;

  Flashcard({
    required this.hanzi,
    required this.pinyin,
    required this.meaning,
    required this.audioFilePath,
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
            flashcard.pinyin.toLowerCase().contains(query.toLowerCase()))
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
          title: Text(flashcard.hanzi),
          subtitle: Text('${flashcard.pinyin} - ${flashcard.meaning}'),
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
            flashcard.pinyin.toLowerCase().contains(query.toLowerCase()))
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
          title: Text(flashcard.hanzi),
          subtitle: Text(flashcard.pinyin),
          onTap: () {
            query = flashcard.pinyin;
            showResults(context);
          },
        );
      },
    );
  }
}

class VocabularyScreenZH extends StatefulWidget {
  final String level;

  const VocabularyScreenZH({Key? key, required this.level}) : super(key: key);

  @override
  VocabularyScreenState createState() => VocabularyScreenState();
}

class VocabularyScreenState extends State<VocabularyScreenZH> {
  late List<Flashcard> _flashcards;
  int? _selectedIndex;
  final ScrollController _scrollController = ScrollController();
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _flashcards = _generateFlashcards();
  }

  List<Flashcard> _generateFlashcards() {
    if (widget.level == 'HSK0') {
      return [
        Flashcard(
          hanzi: '吧',
          pinyin: 'bā',
          meaning: 'partícula modal',
          audioFilePath: 'sounds/吧.mp3',
        ),

        Flashcard(
          hanzi: '拔',
          pinyin: 'bá',
          meaning: 'extraer',
          audioFilePath: 'sounds/拔.mp3',
        ),

        Flashcard(
          hanzi: '把',
          pinyin: 'bǎ',
          meaning: 'agarrar',
          audioFilePath: 'sounds/把.mp3',
        ),

        Flashcard(
          hanzi: '爸',
          pinyin: 'bà',
          meaning: 'papá',
          audioFilePath: 'sounds/爸.mp3',
        ),

        Flashcard(
          hanzi: '波',
          pinyin: 'bō',
          meaning: 'ola',
          audioFilePath: 'sounds/波.mp3',
        ),

        Flashcard(
          hanzi: '博',
          pinyin: 'bó',
          meaning: 'amplio',
          audioFilePath: 'sounds/博.mp3',
        ),

        Flashcard(
          hanzi: '饽',
          pinyin: 'bǒ',
          meaning: 'torta de arroz',
          audioFilePath: 'sounds/饽.mp3',
        ),

        Flashcard(
          hanzi: '播',
          pinyin: 'bò',
          meaning: 'transmitir',
          audioFilePath: 'sounds/播.mp3',
        ),

        Flashcard(
          hanzi: '杯',
          pinyin: 'bēi',
          meaning: 'taza',
          audioFilePath: 'sounds/杯.mp3',
        ),

        Flashcard(
          hanzi: '北',
          pinyin: 'běi',
          meaning: 'norte',
          audioFilePath: 'sounds/北.mp3',
        ),

        Flashcard(
          hanzi: '背',
          pinyin: 'bèi',
          meaning: 'espalda',
          audioFilePath: 'sounds/背.mp3',
        ),

        Flashcard(
          hanzi: '白',
          pinyin: 'bái',
          meaning: 'blanco',
          audioFilePath: 'sounds/白.mp3',
        ),

        Flashcard(
          hanzi: '摆',
          pinyin: 'bǎi',
          meaning: 'colocar',
          audioFilePath: 'sounds/摆.mp3',
        ),

        Flashcard(
          hanzi: '百',
          pinyin: 'bǎi',
          meaning: 'cien',
          audioFilePath: 'sounds/百.mp3',
        ),

        Flashcard(
          hanzi: '包',
          pinyin: 'bāo',
          meaning: 'envolver',
          audioFilePath: 'sounds/包.mp3',
        ),

        Flashcard(
          hanzi: '薄',
          pinyin: 'báo',
          meaning: 'delgado',
          audioFilePath: 'sounds/薄.mp3',
        ),

        Flashcard(
          hanzi: '保',
          pinyin: 'bǎo',
          meaning: 'proteger',
          audioFilePath: 'sounds/保.mp3',
        ),

        Flashcard(
          hanzi: '报',
          pinyin: 'bào',
          meaning: 'informar',
          audioFilePath: 'sounds/报.mp3',
        ),

        Flashcard(
          hanzi: '般',
          pinyin: 'bān',
          meaning: 'clase',
          audioFilePath: 'sounds/般.mp3',
        ),

        Flashcard(
          hanzi: '班',
          pinyin: 'bān',
          meaning: 'grupo',
          audioFilePath: 'sounds/班.mp3',
        ),

        Flashcard(
          hanzi: '半',
          pinyin: 'bàn',
          meaning: 'mitad',
          audioFilePath: 'sounds/半.mp3',
        ),

        Flashcard(
          hanzi: '棒',
          pinyin: 'bàng',
          meaning: 'genial',
          audioFilePath: 'sounds/棒.mp3',
        ),

        Flashcard(
          hanzi: '帮',
          pinyin: 'bāng',
          meaning: 'ayudar',
          audioFilePath: 'sounds/帮.mp3',
        ),

        Flashcard(
          hanzi: '邦',
          pinyin: 'bāng',
          meaning: 'estado',
          audioFilePath: 'sounds/邦.mp3',
        ),

        Flashcard(
          hanzi: '本',
          pinyin: 'běn',
          meaning: 'libro',
          audioFilePath: 'sounds/本.mp3',
        ),

        Flashcard(
          hanzi: '笨',
          pinyin: 'bèn',
          meaning: 'torpe',
          audioFilePath: 'sounds/笨.mp3',
        ),

        Flashcard(
          hanzi: '崩',
          pinyin: 'bēng',
          meaning: 'colapsar',
          audioFilePath: 'sounds/崩.mp3',
        ),

        Flashcard(
          hanzi: '甭',
          pinyin: 'béng',
          meaning: 'no hay necesidad',
          audioFilePath: 'sounds/甭.mp3',
        ),

        Flashcard(
          hanzi: '病',
          pinyin: 'bìng',
          meaning: 'enfermedad',
          audioFilePath: 'sounds/病.mp3',
        ),

        Flashcard(
          hanzi: '冰',
          pinyin: 'bīng',
          meaning: 'hielo',
          audioFilePath: 'sounds/冰.mp3',
        ),

        Flashcard(
          hanzi: '补',
          pinyin: 'bǔ',
          meaning: 'reparar',
          audioFilePath: 'sounds/补.mp3',
        ),

        Flashcard(
          hanzi: '步',
          pinyin: 'bù',
          meaning: 'paso',
          audioFilePath: 'sounds/步.mp3',
        ),
        Flashcard(
  hanzi: '怕',
  pinyin: 'pà',
  meaning: 'tener miedo',
  audioFilePath: 'sounds/怕.mp3',
),

Flashcard(
  hanzi: '趴',
  pinyin: 'pā',
  meaning: 'tumbarse',
  audioFilePath: 'sounds/趴.mp3',
),

Flashcard(
  hanzi: '爬',
  pinyin: 'pá',
  meaning: 'escalar',
  audioFilePath: 'sounds/爬.mp3',
),

Flashcard(
  hanzi: '扒',
  pinyin: 'pá',
  meaning: 'despojar',
  audioFilePath: 'sounds/扒.mp3',
),

Flashcard(
  hanzi: '皮',
  pinyin: 'pí',
  meaning: 'piel',
  audioFilePath: 'sounds/皮.mp3',
),

Flashcard(
  hanzi: '批',
  pinyin: 'pī',
  meaning: 'aprobar',
  audioFilePath: 'sounds/批.mp3',
),

Flashcard(
  hanzi: '瓶',
  pinyin: 'píng',
  meaning: 'botella',
  audioFilePath: 'sounds/瓶.mp3',
),

Flashcard(
  hanzi: '平',
  pinyin: 'píng',
  meaning: 'plano',
  audioFilePath: 'sounds/平.mp3',
),

Flashcard(
  hanzi: '铺',
  pinyin: 'pù',
  meaning: 'tienda',
  audioFilePath: 'sounds/铺.mp3',
),

Flashcard(
  hanzi: '扑',
  pinyin: 'pū',
  meaning: 'arrojarse',
  audioFilePath: 'sounds/扑.mp3',
),

Flashcard(
  hanzi: '喷',
  pinyin: 'pēn',
  meaning: 'rociar',
  audioFilePath: 'sounds/喷.mp3',
),

Flashcard(
  hanzi: '朋',
  pinyin: 'péng',
  meaning: 'amigo',
  audioFilePath: 'sounds/朋.mp3',
),

Flashcard(
  hanzi: '碰',
  pinyin: 'pèng',
  meaning: 'chocar',
  audioFilePath: 'sounds/碰.mp3',
),

Flashcard(
  hanzi: '排',
  pinyin: 'pái',
  meaning: 'fila',
  audioFilePath: 'sounds/排.mp3',
),

Flashcard(
  hanzi: '派',
  pinyin: 'pài',
  meaning: 'enviar',
  audioFilePath: 'sounds/派.mp3',
),

Flashcard(
  hanzi: '牌',
  pinyin: 'pái',
  meaning: 'placa',
  audioFilePath: 'sounds/牌.mp3',
),

Flashcard(
  hanzi: '佩',
  pinyin: 'pèi',
  meaning: 'admirar',
  audioFilePath: 'sounds/佩.mp3',
),

Flashcard(
  hanzi: '陪',
  pinyin: 'péi',
  meaning: 'acompañar',
  audioFilePath: 'sounds/陪.mp3',
),

Flashcard(
  hanzi: '配',
  pinyin: 'pèi',
  meaning: 'acompañar',
  audioFilePath: 'sounds/配.mp3',
),

Flashcard(
  hanzi: '婆',
  pinyin: 'pó',
  meaning: 'abuela',
  audioFilePath: 'sounds/婆.mp3',
),

Flashcard(
  hanzi: '破',
  pinyin: 'pò',
  meaning: 'romper',
  audioFilePath: 'sounds/破.mp3',
),
Flashcard(
  hanzi: '妈',
  pinyin: 'mā',
  meaning: 'madre',
  audioFilePath: 'sounds/妈.mp3',
),

Flashcard(
  hanzi: '麻',
  pinyin: 'má',
  meaning: 'sésamo',
  audioFilePath: 'sounds/麻.mp3',
),

Flashcard(
  hanzi: '马',
  pinyin: 'mǎ',
  meaning: 'caballo',
  audioFilePath: 'sounds/马.mp3',
),

Flashcard(
  hanzi: '骂',
  pinyin: 'mà',
  meaning: 'regañar',
  audioFilePath: 'sounds/骂.mp3',
),

Flashcard(
  hanzi: '摸',
  pinyin: 'mō',
  meaning: 'tocar',
  audioFilePath: 'sounds/摸.mp3',
),

Flashcard(
  hanzi: '磨',
  pinyin: 'mó',
  meaning: 'pulir',
  audioFilePath: 'sounds/磨.mp3',
),

Flashcard(
  hanzi: '抹',
  pinyin: 'mǒ',
  meaning: 'untar',
  audioFilePath: 'sounds/抹.mp3',
),

Flashcard(
  hanzi: '末',
  pinyin: 'mò',
  meaning: 'final',
  audioFilePath: 'sounds/末.mp3',
),

Flashcard(
  hanzi: '没',
  pinyin: 'méi',
  meaning: 'no (negación)',
  audioFilePath: 'sounds/没.mp3',
),

Flashcard(
  hanzi: '美',
  pinyin: 'měi',
  meaning: 'hermoso',
  audioFilePath: 'sounds/美.mp3',
),

Flashcard(
  hanzi: '妹',
  pinyin: 'mèi',
  meaning: 'hermana menor',
  audioFilePath: 'sounds/妹.mp3',
),

Flashcard(
  hanzi: '买',
  pinyin: 'mǎi',
  meaning: 'comprar',
  audioFilePath: 'sounds/买.mp3',
),

Flashcard(
  hanzi: '卖',
  pinyin: 'mài',
  meaning: 'vender',
  audioFilePath: 'sounds/卖.mp3',
),

Flashcard(
  hanzi: '猫',
  pinyin: 'māo',
  meaning: 'gato',
  audioFilePath: 'sounds/猫.mp3',
),

Flashcard(
  hanzi: '毛',
  pinyin: 'máo',
  meaning: 'pelo',
  audioFilePath: 'sounds/毛.mp3',
),

Flashcard(
  hanzi: '矛',
  pinyin: 'máo',
  meaning: 'lanza',
  audioFilePath: 'sounds/矛.mp3',
),

Flashcard(
  hanzi: '满',
  pinyin: 'mǎn',
  meaning: 'lleno',
  audioFilePath: 'sounds/满.mp3',
),

Flashcard(
  hanzi: '慢',
  pinyin: 'màn',
  meaning: 'lento',
  audioFilePath: 'sounds/慢.mp3',
),

Flashcard(
  hanzi: '忙',
  pinyin: 'máng',
  meaning: 'ocupado',
  audioFilePath: 'sounds/忙.mp3',
),

Flashcard(
  hanzi: '茫',
  pinyin: 'máng',
  meaning: 'confuso',
  audioFilePath: 'sounds/茫.mp3',
),

Flashcard(
  hanzi: '门',
  pinyin: 'mén',
  meaning: 'puerta',
  audioFilePath: 'sounds/门.mp3',
),

Flashcard(
  hanzi: '闷',
  pinyin: 'mēn',
  meaning: 'aburrido',
  audioFilePath: 'sounds/闷.mp3',
),

Flashcard(
  hanzi: '梦',
  pinyin: 'mèng',
  meaning: 'sueño',
  audioFilePath: 'sounds/梦.mp3',
),

Flashcard(
  hanzi: '米',
  pinyin: 'mǐ',
  meaning: 'arroz',
  audioFilePath: 'sounds/米.mp3',
),

Flashcard(
  hanzi: '迷',
  pinyin: 'mí',
  meaning: 'perderse',
  audioFilePath: 'sounds/迷.mp3',
),

Flashcard(
  hanzi: '秘',
  pinyin: 'mì',
  meaning: 'secreto',
  audioFilePath: 'sounds/秘.mp3',
),

Flashcard(
  hanzi: '苗',
  pinyin: 'miáo',
  meaning: 'brote',
  audioFilePath: 'sounds/苗.mp3',
),

Flashcard(
  hanzi: '妙',
  pinyin: 'miào',
  meaning: 'maravilloso',
  audioFilePath: 'sounds/妙.mp3',
),

Flashcard(
  hanzi: '面',
  pinyin: 'miàn',
  meaning: 'cara',
  audioFilePath: 'sounds/面.mp3',
),

Flashcard(
  hanzi: '明',
  pinyin: 'míng',
  meaning: 'claro',
  audioFilePath: 'sounds/明.mp3',
),

Flashcard(
  hanzi: '木',
  pinyin: 'mù',
  meaning: 'madera',
  audioFilePath: 'sounds/木.mp3',
),
Flashcard(
  hanzi: '发',
  pinyin: 'fā',
  meaning: 'enviar',
  audioFilePath: 'sounds/发.mp3',
),

Flashcard(
  hanzi: '罚',
  pinyin: 'fá',
  meaning: 'castigar',
  audioFilePath: 'sounds/罚.mp3',
),

Flashcard(
  hanzi: '法',
  pinyin: 'fǎ',
  meaning: 'ley',
  audioFilePath: 'sounds/法.mp3',
),

Flashcard(
  hanzi: '乏',
  pinyin: 'fá',
  meaning: 'escasez',
  audioFilePath: 'sounds/乏.mp3',
),

Flashcard(
  hanzi: '否',
  pinyin: 'fǒu',
  meaning: 'no',
  audioFilePath: 'sounds/否.mp3',
),

Flashcard(
  hanzi: '费',
  pinyin: 'fèi',
  meaning: 'costo',
  audioFilePath: 'sounds/费.mp3',
),

Flashcard(
  hanzi: '肥',
  pinyin: 'féi',
  meaning: 'gordo',
  audioFilePath: 'sounds/肥.mp3',
),

Flashcard(
  hanzi: '分',
  pinyin: 'fēn',
  meaning: 'dividir',
  audioFilePath: 'sounds/分.mp3',
),

Flashcard(
  hanzi: '粉',
  pinyin: 'fěn',
  meaning: 'polvo',
  audioFilePath: 'sounds/粉.mp3',
),

Flashcard(
  hanzi: '奋',
  pinyin: 'fèn',
  meaning: 'esforzarse',
  audioFilePath: 'sounds/奋.mp3',
),

Flashcard(
  hanzi: '风',
  pinyin: 'fēng',
  meaning: 'viento',
  audioFilePath: 'sounds/风.mp3',
),

Flashcard(
  hanzi: '凤',
  pinyin: 'fèng',
  meaning: 'fénix',
  audioFilePath: 'sounds/凤.mp3',
),

Flashcard(
  hanzi: '伏',
  pinyin: 'fú',
  meaning: 'inclinarse',
  audioFilePath: 'sounds/伏.mp3',
),
Flashcard(
  hanzi: '大',
  pinyin: 'dà',
  meaning: 'grande',
  audioFilePath: 'sounds/大.mp3',
),

Flashcard(
  hanzi: '打',
  pinyin: 'dǎ',
  meaning: 'golpear',
  audioFilePath: 'sounds/打.mp3',
),

Flashcard(
  hanzi: '答',
  pinyin: 'dá',
  meaning: 'responder',
  audioFilePath: 'sounds/答.mp3',
),

Flashcard(
  hanzi: '达',
  pinyin: 'dá',
  meaning: 'alcanzar',
  audioFilePath: 'sounds/达.mp3',
),

Flashcard(
  hanzi: '的',
  pinyin: 'de',
  meaning: 'de (posesivo)',
  audioFilePath: 'sounds/的.mp3',
),

Flashcard(
  hanzi: '得',
  pinyin: 'dé',
  meaning: 'obtener',
  audioFilePath: 'sounds/得.mp3',
),

Flashcard(
  hanzi: '地',
  pinyin: 'dì',
  meaning: 'tierra',
  audioFilePath: 'sounds/地.mp3',
),

Flashcard(
  hanzi: '弟',
  pinyin: 'dì',
  meaning: 'hermano menor',
  audioFilePath: 'sounds/弟.mp3',
),

Flashcard(
  hanzi: '滴',
  pinyin: 'dī',
  meaning: 'gota',
  audioFilePath: 'sounds/滴.mp3',
),

Flashcard(
  hanzi: '低',
  pinyin: 'dī',
  meaning: 'bajo',
  audioFilePath: 'sounds/低.mp3',
),

Flashcard(
  hanzi: '导',
  pinyin: 'dǎo',
  meaning: 'guiar',
  audioFilePath: 'sounds/导.mp3',
),

Flashcard(
  hanzi: '岛',
  pinyin: 'dǎo',
  meaning: 'isla',
  audioFilePath: 'sounds/岛.mp3',
),

Flashcard(
  hanzi: '刀',
  pinyin: 'dāo',
  meaning: 'cuchillo',
  audioFilePath: 'sounds/刀.mp3',
),

Flashcard(
  hanzi: '到',
  pinyin: 'dào',
  meaning: 'llegar',
  audioFilePath: 'sounds/到.mp3',
),

Flashcard(
  hanzi: '倒',
  pinyin: 'dǎo',
  meaning: 'caer',
  audioFilePath: 'sounds/倒.mp3',
),

Flashcard(
  hanzi: '带',
  pinyin: 'dài',
  meaning: 'traer',
  audioFilePath: 'sounds/带.mp3',
),

Flashcard(
  hanzi: '待',
  pinyin: 'dài',
  meaning: 'esperar',
  audioFilePath: 'sounds/待.mp3',
),

Flashcard(
  hanzi: '呆',
  pinyin: 'dāi',
  meaning: 'estúpido',
  audioFilePath: 'sounds/呆.mp3',
),

Flashcard(
  hanzi: '单',
  pinyin: 'dān',
  meaning: 'único',
  audioFilePath: 'sounds/单.mp3',
),

Flashcard(
  hanzi: '但',
  pinyin: 'dàn',
  meaning: 'pero',
  audioFilePath: 'sounds/但.mp3',
),

Flashcard(
  hanzi: '蛋',
  pinyin: 'dàn',
  meaning: 'huevo',
  audioFilePath: 'sounds/蛋.mp3',
),

Flashcard(
  hanzi: '担',
  pinyin: 'dān',
  meaning: 'llevar',
  audioFilePath: 'sounds/担.mp3',
),

Flashcard(
  hanzi: '档',
  pinyin: 'dǎng',
  meaning: 'archivo',
  audioFilePath: 'sounds/档.mp3',
),

Flashcard(
  hanzi: '当',
  pinyin: 'dāng',
  meaning: 'cuando',
  audioFilePath: 'sounds/当.mp3',
),

Flashcard(
  hanzi: '等',
  pinyin: 'děng',
  meaning: 'esperar',
  audioFilePath: 'sounds/等.mp3',
),

Flashcard(
  hanzi: '灯',
  pinyin: 'dēng',
  meaning: 'luz',
  audioFilePath: 'sounds/灯.mp3',
),

Flashcard(
  hanzi: '冬',
  pinyin: 'dōng',
  meaning: 'invierno',
  audioFilePath: 'sounds/冬.mp3',
),

Flashcard(
  hanzi: '懂',
  pinyin: 'dǒng',
  meaning: 'entender',
  audioFilePath: 'sounds/懂.mp3',
),

Flashcard(
  hanzi: '动',
  pinyin: 'dòng',
  meaning: 'moverse',
  audioFilePath: 'sounds/动.mp3',
),

Flashcard(
  hanzi: '东',
  pinyin: 'dōng',
  meaning: 'este',
  audioFilePath: 'sounds/东.mp3',
),
Flashcard(
  hanzi: '他',
  pinyin: 'tā',
  meaning: 'él',
  audioFilePath: 'sounds/他.mp3',
),

Flashcard(
  hanzi: '她',
  pinyin: 'tā',
  meaning: 'ella',
  audioFilePath: 'sounds/她.mp3',
),

Flashcard(
  hanzi: '它',
  pinyin: 'tā',
  meaning: 'eso',
  audioFilePath: 'sounds/它.mp3',
),

Flashcard(
  hanzi: '塔',
  pinyin: 'tǎ',
  meaning: 'torre',
  audioFilePath: 'sounds/塔.mp3',
),

Flashcard(
  hanzi: '塌',
  pinyin: 'tā',
  meaning: 'colapsar',
  audioFilePath: 'sounds/塌.mp3',
),

Flashcard(
  hanzi: '太',
  pinyin: 'tài',
  meaning: 'demasiado',
  audioFilePath: 'sounds/太.mp3',
),

Flashcard(
  hanzi: '抬',
  pinyin: 'tái',
  meaning: 'levantar',
  audioFilePath: 'sounds/抬.mp3',
),

Flashcard(
  hanzi: '台',
  pinyin: 'tái',
  meaning: 'plataforma',
  audioFilePath: 'sounds/台.mp3',
),

Flashcard(
  hanzi: '态',
  pinyin: 'tài',
  meaning: 'actitud',
  audioFilePath: 'sounds/态.mp3',
),

Flashcard(
  hanzi: '唐',
  pinyin: 'táng',
  meaning: 'dinastía Tang',
  audioFilePath: 'sounds/唐.mp3',
),

Flashcard(
  hanzi: '堂',
  pinyin: 'táng',
  meaning: 'sala',
  audioFilePath: 'sounds/堂.mp3',
),

Flashcard(
  hanzi: '糖',
  pinyin: 'táng',
  meaning: 'azúcar',
  audioFilePath: 'sounds/糖.mp3',
),

Flashcard(
  hanzi: '汤',
  pinyin: 'tāng',
  meaning: 'sopa',
  audioFilePath: 'sounds/汤.mp3',
),

Flashcard(
  hanzi: '趟',
  pinyin: 'tàng',
  meaning: 'viaje',
  audioFilePath: 'sounds/趟.mp3',
),

Flashcard(
  hanzi: '头',
  pinyin: 'tóu',
  meaning: 'cabeza',
  audioFilePath: 'sounds/头.mp3',
),

Flashcard(
  hanzi: '偷',
  pinyin: 'tōu',
  meaning: 'robar',
  audioFilePath: 'sounds/偷.mp3',
),

Flashcard(
  hanzi: '投',
  pinyin: 'tóu',
  meaning: 'lanzar',
  audioFilePath: 'sounds/投.mp3',
),

Flashcard(
  hanzi: '套',
  pinyin: 'tào',
  meaning: 'set',
  audioFilePath: 'sounds/套.mp3',
),

Flashcard(
  hanzi: '拖',
  pinyin: 'tuō',
  meaning: 'arrastrar',
  audioFilePath: 'sounds/拖.mp3',
),

Flashcard(
  hanzi: '兔',
  pinyin: 'tù',
  meaning: 'conejo',
  audioFilePath: 'sounds/兔.mp3',
),

Flashcard(
  hanzi: '吐',
  pinyin: 'tǔ',
  meaning: 'escupir',
  audioFilePath: 'sounds/吐.mp3',
),

Flashcard(
  hanzi: '土',
  pinyin: 'tǔ',
  meaning: 'tierra',
  audioFilePath: 'sounds/土.mp3',
),

Flashcard(
  hanzi: '图',
  pinyin: 'tú',
  meaning: 'dibujo',
  audioFilePath: 'sounds/图.mp3',
),

Flashcard(
  hanzi: '团',
  pinyin: 'tuán',
  meaning: 'grupo',
  audioFilePath: 'sounds/团.mp3',
),

Flashcard(
  hanzi: '推',
  pinyin: 'tuī',
  meaning: 'empujar',
  audioFilePath: 'sounds/推.mp3',
),

Flashcard(
  hanzi: '腿',
  pinyin: 'tuǐ',
  meaning: 'pierna',
  audioFilePath: 'sounds/腿.mp3',
),

Flashcard(
  hanzi: '外',
  pinyin: 'wài',
  meaning: 'fuera',
  audioFilePath: 'sounds/外.mp3',
),

Flashcard(
  hanzi: '完',
  pinyin: 'wán',
  meaning: 'terminar',
  audioFilePath: 'sounds/完.mp3',
),

Flashcard(
  hanzi: '王',
  pinyin: 'wáng',
  meaning: 'rey',
  audioFilePath: 'sounds/王.mp3',
),

Flashcard(
  hanzi: '往',
  pinyin: 'wǎng',
  meaning: 'hacia',
  audioFilePath: 'sounds/往.mp3',
),

Flashcard(
  hanzi: '望',
  pinyin: 'wàng',
  meaning: 'esperanza',
  audioFilePath: 'sounds/望.mp3',
),

Flashcard(
  hanzi: '为',
  pinyin: 'wèi',
  meaning: 'para',
  audioFilePath: 'sounds/为.mp3',
),

Flashcard(
  hanzi: '位',
  pinyin: 'wèi',
  meaning: 'posición',
  audioFilePath: 'sounds/位.mp3',
),

Flashcard(
  hanzi: '未',
  pinyin: 'wèi',
  meaning: 'no',
  audioFilePath: 'sounds/未.mp3',
),

Flashcard(
  hanzi: '文',
  pinyin: 'wén',
  meaning: 'cultura',
  audioFilePath: 'sounds/文.mp3',
),

Flashcard(
  hanzi: '问',
  pinyin: 'wèn',
  meaning: 'preguntar',
  audioFilePath: 'sounds/问.mp3',
),

Flashcard(
  hanzi: '我',
  pinyin: 'wǒ',
  meaning: 'yo',
  audioFilePath: 'sounds/我.mp3',
),

Flashcard(
  hanzi: '屋',
  pinyin: 'wū',
  meaning: 'casa',
  audioFilePath: 'sounds/屋.mp3',
),

Flashcard(
  hanzi: '五',
  pinyin: 'wǔ',
  meaning: 'cinco',
  audioFilePath: 'sounds/五.mp3',
),

Flashcard(
  hanzi: '物',
  pinyin: 'wù',
  meaning: 'cosa',
  audioFilePath: 'sounds/物.mp3',
),
Flashcard(
  hanzi: '那',
  pinyin: 'nà',
  meaning: 'ese',
  audioFilePath: 'sounds/那.mp3',
),

Flashcard(
  hanzi: '哪',
  pinyin: 'nǎ',
  meaning: 'cuál',
  audioFilePath: 'sounds/哪.mp3',
),

Flashcard(
  hanzi: '拿',
  pinyin: 'ná',
  meaning: 'tomar',
  audioFilePath: 'sounds/拿.mp3',
),

Flashcard(
  hanzi: '呐',
  pinyin: 'nà',
  meaning: 'ah',
  audioFilePath: 'sounds/呐.mp3',
),

Flashcard(
  hanzi: '呢',
  pinyin: 'ne',
  meaning: 'partícula de pregunta',
  audioFilePath: 'sounds/呢.mp3',
),

Flashcard(
  hanzi: '内',
  pinyin: 'nèi',
  meaning: 'dentro',
  audioFilePath: 'sounds/内.mp3',
),

Flashcard(
  hanzi: '奶',
  pinyin: 'nǎi',
  meaning: 'leche',
  audioFilePath: 'sounds/奶.mp3',
),

Flashcard(
  hanzi: '男',
  pinyin: 'nán',
  meaning: 'hombre',
  audioFilePath: 'sounds/男.mp3',
),

Flashcard(
  hanzi: '难',
  pinyin: 'nán',
  meaning: 'difícil',
  audioFilePath: 'sounds/难.mp3',
),

Flashcard(
  hanzi: '南',
  pinyin: 'nán',
  meaning: 'sur',
  audioFilePath: 'sounds/南.mp3',
),

Flashcard(
  hanzi: '能',
  pinyin: 'néng',
  meaning: 'poder',
  audioFilePath: 'sounds/能.mp3',
),

Flashcard(
  hanzi: '哪',
  pinyin: 'nǎ',
  meaning: 'dónde',
  audioFilePath: 'sounds/哪.mp3',
),

Flashcard(
  hanzi: '嫩',
  pinyin: 'nèn',
  meaning: 'tierno',
  audioFilePath: 'sounds/嫩.mp3',
),

Flashcard(
  hanzi: '年',
  pinyin: 'nián',
  meaning: 'año',
  audioFilePath: 'sounds/年.mp3',
),

Flashcard(
  hanzi: '念',
  pinyin: 'niàn',
  meaning: 'leer',
  audioFilePath: 'sounds/念.mp3',
),

Flashcard(
  hanzi: '鸟',
  pinyin: 'niǎo',
  meaning: 'pájaro',
  audioFilePath: 'sounds/鸟.mp3',
),

Flashcard(
  hanzi: '尿',
  pinyin: 'niào',
  meaning: 'orina',
  audioFilePath: 'sounds/尿.mp3',
),

Flashcard(
  hanzi: '娘',
  pinyin: 'niáng',
  meaning: 'madre',
  audioFilePath: 'sounds/娘.mp3',
),

Flashcard(
  hanzi: '牛',
  pinyin: 'niú',
  meaning: 'vaca',
  audioFilePath: 'sounds/牛.mp3',
),

Flashcard(
  hanzi: '农',
  pinyin: 'nóng',
  meaning: 'agricultura',
  audioFilePath: 'sounds/农.mp3',
),

Flashcard(
  hanzi: '弄',
  pinyin: 'nòng',
  meaning: 'jugar',
  audioFilePath: 'sounds/弄.mp3',
),

Flashcard(
  hanzi: '奴',
  pinyin: 'nú',
  meaning: 'esclavo',
  audioFilePath: 'sounds/奴.mp3',
),

Flashcard(
  hanzi: '怒',
  pinyin: 'nù',
  meaning: 'ira',
  audioFilePath: 'sounds/怒.mp3',
),
Flashcard(
  hanzi: '拉',
  pinyin: 'lā',
  meaning: 'tirar',
  audioFilePath: 'sounds/拉.mp3',
),

Flashcard(
  hanzi: '啦',
  pinyin: 'la',
  meaning: 'partícula exclamativa',
  audioFilePath: 'sounds/啦.mp3',
),

Flashcard(
  hanzi: '辣',
  pinyin: 'là',
  meaning: 'picante',
  audioFilePath: 'sounds/辣.mp3',
),

Flashcard(
  hanzi: '来',
  pinyin: 'lái',
  meaning: 'venir',
  audioFilePath: 'sounds/来.mp3',
),

Flashcard(
  hanzi: '赖',
  pinyin: 'lài',
  meaning: 'depender',
  audioFilePath: 'sounds/赖.mp3',
),

Flashcard(
  hanzi: '蓝',
  pinyin: 'lán',
  meaning: 'azul',
  audioFilePath: 'sounds/蓝.mp3',
),

Flashcard(
  hanzi: '烂',
  pinyin: 'làn',
  meaning: 'podrido',
  audioFilePath: 'sounds/烂.mp3',
),

Flashcard(
  hanzi: '浪',
  pinyin: 'làng',
  meaning: 'ola',
  audioFilePath: 'sounds/浪.mp3',
),

Flashcard(
  hanzi: '老',
  pinyin: 'lǎo',
  meaning: 'viejo',
  audioFilePath: 'sounds/老.mp3',
),

Flashcard(
  hanzi: '了',
  pinyin: 'le',
  meaning: 'partícula de finalización',
  audioFilePath: 'sounds/了.mp3',
),

Flashcard(
  hanzi: '乐',
  pinyin: 'lè',
  meaning: 'feliz',
  audioFilePath: 'sounds/乐.mp3',
),

Flashcard(
  hanzi: '冷',
  pinyin: 'lěng',
  meaning: 'frío',
  audioFilePath: 'sounds/冷.mp3',
),

Flashcard(
  hanzi: '里',
  pinyin: 'lǐ',
  meaning: 'dentro',
  audioFilePath: 'sounds/里.mp3',
),

Flashcard(
  hanzi: '礼',
  pinyin: 'lǐ',
  meaning: 'rito',
  audioFilePath: 'sounds/礼.mp3',
),

Flashcard(
  hanzi: '立',
  pinyin: 'lì',
  meaning: 'pararse',
  audioFilePath: 'sounds/立.mp3',
),

Flashcard(
  hanzi: '利',
  pinyin: 'lì',
  meaning: 'beneficio',
  audioFilePath: 'sounds/利.mp3',
),

Flashcard(
  hanzi: '历',
  pinyin: 'lì',
  meaning: 'historia',
  audioFilePath: 'sounds/历.mp3',
),

Flashcard(
  hanzi: '连',
  pinyin: 'lián',
  meaning: 'incluso',
  audioFilePath: 'sounds/连.mp3',
),

Flashcard(
  hanzi: '脸',
  pinyin: 'liǎn',
  meaning: 'cara',
  audioFilePath: 'sounds/脸.mp3',
),

Flashcard(
  hanzi: '两',
  pinyin: 'liǎng',
  meaning: 'dos',
  audioFilePath: 'sounds/两.mp3',
),

Flashcard(
  hanzi: '凉',
  pinyin: 'liáng',
  meaning: 'fresco',
  audioFilePath: 'sounds/凉.mp3',
),

Flashcard(
  hanzi: '亮',
  pinyin: 'liàng',
  meaning: 'brillante',
  audioFilePath: 'sounds/亮.mp3',
),

Flashcard(
  hanzi: '了',
  pinyin: 'le',
  meaning: 'finalización',
  audioFilePath: 'sounds/了.mp3',
),

Flashcard(
  hanzi: '了',
  pinyin: 'le',
  meaning: 'partícula modal',
  audioFilePath: 'sounds/了.mp3',
),

Flashcard(
  hanzi: '累',
  pinyin: 'lèi',
  meaning: 'cansado',
  audioFilePath: 'sounds/累.mp3',
),

Flashcard(
  hanzi: '里',
  pinyin: 'lǐ',
  meaning: 'dentro',
  audioFilePath: 'sounds/里.mp3',
),

Flashcard(
  hanzi: '礼',
  pinyin: 'lǐ',
  meaning: 'rito',
  audioFilePath: 'sounds/礼.mp3',
),

Flashcard(
  hanzi: '历',
  pinyin: 'lì',
  meaning: 'historia',
  audioFilePath: 'sounds/历.mp3',
),

Flashcard(
  hanzi: '利',
  pinyin: 'lì',
  meaning: 'beneficio',
  audioFilePath: 'sounds/利.mp3',
),

Flashcard(
  hanzi: '连',
pinyin: 'lián',
meaning: 'incluso',
audioFilePath: 'sounds/连.mp3',
),

Flashcard(
hanzi: '脸',
pinyin: 'liǎn',
meaning: 'cara',
audioFilePath: 'sounds/脸.mp3',
),

Flashcard(
hanzi: '两',
pinyin: 'liǎng',
meaning: 'dos',
audioFilePath: 'sounds/两.mp3',
),

Flashcard(
hanzi: '凉',
pinyin: 'liáng',
meaning: 'fresco',
audioFilePath: 'sounds/凉.mp3',
),

Flashcard(
hanzi: '亮',
pinyin: 'liàng',
meaning: 'brillante',
audioFilePath: 'sounds/亮.mp3',
),
Flashcard(
  hanzi: '改',
  pinyin: 'gǎi',
  meaning: 'cambiar',
  audioFilePath: 'sounds/改.mp3',
),

Flashcard(
  hanzi: '概',
  pinyin: 'gài',
  meaning: 'general',
  audioFilePath: 'sounds/概.mp3',
),

Flashcard(
  hanzi: '干',
  pinyin: 'gān',
  meaning: 'hacer',
  audioFilePath: 'sounds/干.mp3',
),

Flashcard(
  hanzi: '感',
  pinyin: 'gǎn',
  meaning: 'sentir',
  audioFilePath: 'sounds/感.mp3',
),

Flashcard(
  hanzi: '刚',
  pinyin: 'gāng',
  meaning: 'justo',
  audioFilePath: 'sounds/刚.mp3',
),

Flashcard(
  hanzi: '钢',
  pinyin: 'gāng',
  meaning: 'acero',
  audioFilePath: 'sounds/钢.mp3',
),

Flashcard(
  hanzi: '高',
  pinyin: 'gāo',
  meaning: 'alto',
  audioFilePath: 'sounds/高.mp3',
),

Flashcard(
  hanzi: '告',
  pinyin: 'gào',
  meaning: 'decir',
  audioFilePath: 'sounds/告.mp3',
),

Flashcard(
  hanzi: '格',
  pinyin: 'gé',
  meaning: 'patrón',
  audioFilePath: 'sounds/格.mp3',
),

Flashcard(
  hanzi: '各',
  pinyin: 'gè',
  meaning: 'cada',
  audioFilePath: 'sounds/各.mp3',
),

Flashcard(
  hanzi: '给',
  pinyin: 'gěi',
  meaning: 'dar',
  audioFilePath: 'sounds/给.mp3',
),

Flashcard(
  hanzi: '根',
  pinyin: 'gēn',
  meaning: 'raíz',
  audioFilePath: 'sounds/根.mp3',
),

Flashcard(
  hanzi: '更',
  pinyin: 'gèng',
  meaning: 'más',
  audioFilePath: 'sounds/更.mp3',
),

Flashcard(
  hanzi: '工',
  pinyin: 'gōng',
  meaning: 'trabajo',
  audioFilePath: 'sounds/工.mp3',
),

Flashcard(
  hanzi: '公',
  pinyin: 'gōng',
  meaning: 'público',
  audioFilePath: 'sounds/公.mp3',
),

Flashcard(
  hanzi: '共',
  pinyin: 'gòng',
  meaning: 'juntos',
  audioFilePath: 'sounds/共.mp3',
),

Flashcard(
  hanzi: '功',
  pinyin: 'gōng',
  meaning: 'logro',
  audioFilePath: 'sounds/功.mp3',
),

Flashcard(
  hanzi: '够',
  pinyin: 'gòu',
  meaning: 'suficiente',
  audioFilePath: 'sounds/够.mp3',
),

Flashcard(
  hanzi: '狗',
  pinyin: 'gǒu',
  meaning: 'perro',
  audioFilePath: 'sounds/狗.mp3',
),

Flashcard(
  hanzi: '估',
  pinyin: 'gū',
  meaning: 'estimar',
  audioFilePath: 'sounds/估.mp3',
),

Flashcard(
  hanzi: '顾',
  pinyin: 'gù',
  meaning: 'cuidar',
  audioFilePath: 'sounds/顾.mp3',
),

Flashcard(
  hanzi: '挂',
  pinyin: 'guà',
  meaning: 'colgar',
  audioFilePath: 'sounds/挂.mp3',
),
Flashcard(
  hanzi: '卡',
  pinyin: 'kǎ',
  meaning: 'tarjeta',
  audioFilePath: 'sounds/卡.mp3',
),

Flashcard(
  hanzi: '开',
  pinyin: 'kāi',
  meaning: 'abrir',
  audioFilePath: 'sounds/开.mp3',
),

Flashcard(
  hanzi: '看',
  pinyin: 'kàn',
  meaning: 'ver',
  audioFilePath: 'sounds/看.mp3',
),

Flashcard(
  hanzi: '康',
  pinyin: 'kāng',
  meaning: 'salud',
  audioFilePath: 'sounds/康.mp3',
),

Flashcard(
  hanzi: '考',
  pinyin: 'kǎo',
  meaning: 'examen',
  audioFilePath: 'sounds/考.mp3',
),

Flashcard(
  hanzi: '可',
  pinyin: 'kě',
  meaning: 'poder',
  audioFilePath: 'sounds/可.mp3',
),

Flashcard(
  hanzi: '克',
  pinyin: 'kè',
  meaning: 'superar',
  audioFilePath: 'sounds/克.mp3',
),

Flashcard(
  hanzi: '客',
  pinyin: 'kè',
  meaning: 'cliente',
  audioFilePath: 'sounds/客.mp3',
),

Flashcard(
  hanzi: '空',
  pinyin: 'kōng',
  meaning: 'vacío',
  audioFilePath: 'sounds/空.mp3',
),

Flashcard(
  hanzi: '口',
  pinyin: 'kǒu',
  meaning: 'boca',
  audioFilePath: 'sounds/口.mp3',
),

Flashcard(
  hanzi: '苦',
  pinyin: 'kǔ',
  meaning: 'amargo',
  audioFilePath: 'sounds/苦.mp3',
),

Flashcard(
  hanzi: '哭',
  pinyin: 'kū',
  meaning: 'llorar',
  audioFilePath: 'sounds/哭.mp3',
),

Flashcard(
  hanzi: '库',
  pinyin: 'kù',
  meaning: 'almacén',
  audioFilePath: 'sounds/库.mp3',
),

Flashcard(
  hanzi: '裤',
  pinyin: 'kù',
  meaning: 'pantalones',
  audioFilePath: 'sounds/裤.mp3',
),

Flashcard(
  hanzi: '夸',
  pinyin: 'kuā',
  meaning: 'alabar',
  audioFilePath: 'sounds/夸.mp3',
),

Flashcard(
  hanzi: '块',
  pinyin: 'kuài',
  meaning: 'trozo',
  audioFilePath: 'sounds/块.mp3',
),

Flashcard(
  hanzi: '快',
  pinyin: 'kuài',
  meaning: 'rápido',
  audioFilePath: 'sounds/快.mp3',
),

Flashcard(
  hanzi: '宽',
  pinyin: 'kuān',
  meaning: 'ancho',
  audioFilePath: 'sounds/宽.mp3',
),

Flashcard(
  hanzi: '况',
  pinyin: 'kuàng',
  meaning: 'condición',
  audioFilePath: 'sounds/况.mp3',
),

Flashcard(
  hanzi: '筷',
  pinyin: 'kuài',
  meaning: 'palillos',
  audioFilePath: 'sounds/筷.mp3',
),
Flashcard(
  hanzi: '哈',
  pinyin: 'hā',
  meaning: 'ja',
  audioFilePath: 'sounds/哈.mp3',
),

Flashcard(
  hanzi: '海',
  pinyin: 'hǎi',
  meaning: 'mar',
  audioFilePath: 'sounds/海.mp3',
),

Flashcard(
  hanzi: '还',
  pinyin: 'hái',
  meaning: 'aún',
  audioFilePath: 'sounds/还.mp3',
),

Flashcard(
  hanzi: '害',
  pinyin: 'hài',
  meaning: 'daño',
  audioFilePath: 'sounds/害.mp3',
),

Flashcard(
  hanzi: '汉',
  pinyin: 'hàn',
  meaning: 'chino',
  audioFilePath: 'sounds/汉.mp3',
),

Flashcard(
  hanzi: '行',
  pinyin: 'háng',
  meaning: 'camino',
  audioFilePath: 'sounds/行.mp3',
),

Flashcard(
  hanzi: '号',
  pinyin: 'hào',
  meaning: 'número',
  audioFilePath: 'sounds/号.mp3',
),

Flashcard(
  hanzi: '喝',
  pinyin: 'hē',
  meaning: 'beber',
  audioFilePath: 'sounds/喝.mp3',
),

Flashcard(
  hanzi: '合',
  pinyin: 'hé',
  meaning: 'juntar',
  audioFilePath: 'sounds/合.mp3',
),

Flashcard(
  hanzi: '和',
  pinyin: 'hé',
  meaning: 'y',
  audioFilePath: 'sounds/和.mp3',
),

Flashcard(
  hanzi: '黑',
  pinyin: 'hēi',
  meaning: 'negro',
  audioFilePath: 'sounds/黑.mp3',
),

Flashcard(
  hanzi: '很',
  pinyin: 'hěn',
  meaning: 'muy',
  audioFilePath: 'sounds/很.mp3',
),

Flashcard(
  hanzi: '红',
  pinyin: 'hóng',
  meaning: 'rojo',
  audioFilePath: 'sounds/红.mp3',
),

Flashcard(
  hanzi: '后',
  pinyin: 'hòu',
  meaning: 'después',
  audioFilePath: 'sounds/后.mp3',
),

Flashcard(
  hanzi: '互',
  pinyin: 'hù',
  meaning: 'mutuo',
  audioFilePath: 'sounds/互.mp3',
),

Flashcard(
  hanzi: '护',
  pinyin: 'hù',
  meaning: 'proteger',
  audioFilePath: 'sounds/护.mp3',
),

Flashcard(
  hanzi: '华',
  pinyin: 'huá',
  meaning: 'esplendor',
  audioFilePath: 'sounds/华.mp3',
),

Flashcard(
  hanzi: '画',
  pinyin: 'huà',
  meaning: 'dibujar',
  audioFilePath: 'sounds/画.mp3',
),

Flashcard(
  hanzi: '怀',
  pinyin: 'huái',
  meaning: 'tener',
  audioFilePath: 'sounds/怀.mp3',
),
Flashcard(
  hanzi: '家',
  pinyin: 'jiā',
  meaning: 'casa',
  audioFilePath: 'sounds/家.mp3',
),

Flashcard(
  hanzi: '间',
  pinyin: 'jiān',
  meaning: 'entre',
  audioFilePath: 'sounds/间.mp3',
),

Flashcard(
  hanzi: '简',
  pinyin: 'jiǎn',
  meaning: 'simple',
  audioFilePath: 'sounds/简.mp3',
),

Flashcard(
  hanzi: '见',
  pinyin: 'jiàn',
  meaning: 'ver',
  audioFilePath: 'sounds/见.mp3',
),

Flashcard(
  hanzi: '讲',
  pinyin: 'jiǎng',
  meaning: 'hablar',
  audioFilePath: 'sounds/讲.mp3',
),

Flashcard(
  hanzi: '将',
  pinyin: 'jiāng',
  meaning: 'voluntad',
  audioFilePath: 'sounds/将.mp3',
),

Flashcard(
  hanzi: '强',
  pinyin: 'qiáng',
  meaning: 'fuerte',
  audioFilePath: 'sounds/强.mp3',
),

Flashcard(
  hanzi: '江',
  pinyin: 'jiāng',
  meaning: 'río',
  audioFilePath: 'sounds/江.mp3',
),

Flashcard(
  hanzi: '教',
  pinyin: 'jiāo',
  meaning: 'enseñar',
  audioFilePath: 'sounds/教.mp3',
),

Flashcard(
  hanzi: '叫',
  pinyin: 'jiào',
  meaning: 'llamar',
  audioFilePath: 'sounds/叫.mp3',
),

Flashcard(
  hanzi: '接',
  pinyin: 'jiē',
  meaning: 'recibir',
  audioFilePath: 'sounds/接.mp3',
),

Flashcard(
  hanzi: '节',
  pinyin: 'jié',
  meaning: 'sección',
  audioFilePath: 'sounds/节.mp3',
),

Flashcard(
  hanzi: '结',
  pinyin: 'jié',
  meaning: 'nudo',
  audioFilePath: 'sounds/结.mp3',
),

Flashcard(
  hanzi: '姐',
  pinyin: 'jiě',
  meaning: 'hermana mayor',
  audioFilePath: 'sounds/姐.mp3',
),

Flashcard(
  hanzi: '解',
  pinyin: 'jiě',
  meaning: 'resolver',
  audioFilePath: 'sounds/解.mp3',
),

Flashcard(
  hanzi: '借',
  pinyin: 'jiè',
  meaning: 'prestar',
  audioFilePath: 'sounds/借.mp3',
),

Flashcard(
  hanzi: '界',
  pinyin: 'jiè',
  meaning: 'límite',
  audioFilePath: 'sounds/界.mp3',
),

Flashcard(
  hanzi: '戒',
  pinyin: 'jiè',
  meaning: 'abstenerse',
  audioFilePath: 'sounds/戒.mp3',
),

Flashcard(
  hanzi: '今',
  pinyin: 'jīn',
  meaning: 'ahora',
  audioFilePath: 'sounds/今.mp3',
),

Flashcard(
  hanzi: '金',
  pinyin: 'jīn',
  meaning: 'oro',
  audioFilePath: 'sounds/金.mp3',
),
Flashcard(
  hanzi: '去',
  pinyin: 'qù',
  meaning: 'ir',
  audioFilePath: 'sounds/去.mp3',
),

Flashcard(
  hanzi: '起',
  pinyin: 'qǐ',
  meaning: 'levantarse',
  audioFilePath: 'sounds/起.mp3',
),

Flashcard(
  hanzi: '汽',
  pinyin: 'qì',
  meaning: 'vapor',
  audioFilePath: 'sounds/汽.mp3',
),

Flashcard(
  hanzi: '气',
  pinyin: 'qì',
  meaning: 'aire',
  audioFilePath: 'sounds/气.mp3',
),

Flashcard(
  hanzi: '钱',
  pinyin: 'qián',
  meaning: 'dinero',
  audioFilePath: 'sounds/钱.mp3',
),

Flashcard(
  hanzi: '前',
  pinyin: 'qián',
  meaning: 'anterior',
  audioFilePath: 'sounds/前.mp3',
),

Flashcard(
  hanzi: '千',
  pinyin: 'qiān',
  meaning: 'mil',
  audioFilePath: 'sounds/千.mp3',
),

Flashcard(
  hanzi: '签',
  pinyin: 'qiān',
  meaning: 'firmar',
  audioFilePath: 'sounds/签.mp3',
),

Flashcard(
  hanzi: '强',
  pinyin: 'qiáng',
  meaning: 'fuerte',
  audioFilePath: 'sounds/强.mp3',
),

Flashcard(
  hanzi: '墙',
  pinyin: 'qiáng',
  meaning: 'muro',
  audioFilePath: 'sounds/墙.mp3',
),

Flashcard(
  hanzi: '桥',
  pinyin: 'qiáo',
  meaning: 'puente',
  audioFilePath: 'sounds/桥.mp3',
),

Flashcard(
  hanzi: '亲',
  pinyin: 'qīn',
  meaning: 'familiar',
  audioFilePath: 'sounds/亲.mp3',
),

Flashcard(
  hanzi: '青',
  pinyin: 'qīng',
  meaning: 'verde',
  audioFilePath: 'sounds/青.mp3',
),

Flashcard(
  hanzi: '请',
  pinyin: 'qǐng',
  meaning: 'invitar',
  audioFilePath: 'sounds/请.mp3',
),

Flashcard(
  hanzi: '情',
  pinyin: 'qíng',
  meaning: 'sentimiento',
  audioFilePath: 'sounds/情.mp3',
),

Flashcard(
  hanzi: '轻',
  pinyin: 'qīng',
  meaning: 'ligero',
  audioFilePath: 'sounds/轻.mp3',
),

Flashcard(
  hanzi: '清',
  pinyin: 'qīng',
  meaning: 'claro',
  audioFilePath: 'sounds/清.mp3',
),

Flashcard(
  hanzi: '穷',
  pinyin: 'qióng',
  meaning: 'pobre',
  audioFilePath: 'sounds/穷.mp3',
),

Flashcard(
  hanzi: '求',
  pinyin: 'qiú',
  meaning: 'buscar',
  audioFilePath: 'sounds/求.mp3',
),

Flashcard(
  hanzi: '区',
  pinyin: 'qū',
  meaning: 'distrito',
  audioFilePath: 'sounds/区.mp3',
),
Flashcard(
  hanzi: '下',
  pinyin: 'xià',
  meaning: 'abajo',
  audioFilePath: 'sounds/下.mp3',
),

Flashcard(
  hanzi: '夏',
  pinyin: 'xià',
  meaning: 'verano',
  audioFilePath: 'sounds/夏.mp3',
),

Flashcard(
  hanzi: '先',
  pinyin: 'xiān',
  meaning: 'primero',
  audioFilePath: 'sounds/先.mp3',
),

Flashcard(
  hanzi: '现',
  pinyin: 'xiàn',
  meaning: 'actual',
  audioFilePath: 'sounds/现.mp3',
),

Flashcard(
  hanzi: '相',
  pinyin: 'xiāng',
  meaning: 'mutuo',
  audioFilePath: 'sounds/相.mp3',
),

Flashcard(
  hanzi: '想',
  pinyin: 'xiǎng',
  meaning: 'pensar',
  audioFilePath: 'sounds/想.mp3',
),

Flashcard(
  hanzi: '小',
  pinyin: 'xiǎo',
  meaning: 'pequeño',
  audioFilePath: 'sounds/小.mp3',
),

Flashcard(
  hanzi: '笑',
  pinyin: 'xiào',
  meaning: 'reír',
  audioFilePath: 'sounds/笑.mp3',
),

Flashcard(
  hanzi: '些',
  pinyin: 'xiē',
  meaning: 'algunos',
  audioFilePath: 'sounds/些.mp3',
),

Flashcard(
  hanzi: '写',
  pinyin: 'xiě',
  meaning: 'escribir',
  audioFilePath: 'sounds/写.mp3',
),

Flashcard(
  hanzi: '斜',
  pinyin: 'xié',
  meaning: 'inclinado',
  audioFilePath: 'sounds/斜.mp3',
),

Flashcard(
  hanzi: '谢',
  pinyin: 'xiè',
  meaning: 'agradecer',
  audioFilePath: 'sounds/谢.mp3',
),

Flashcard(
  hanzi: '心',
  pinyin: 'xīn',
  meaning: 'corazón',
  audioFilePath: 'sounds/心.mp3',
),

Flashcard(
  hanzi: '新',
  pinyin: 'xīn',
  meaning: 'nuevo',
  audioFilePath: 'sounds/新.mp3',
),

Flashcard(
  hanzi: '星',
  pinyin: 'xīng',
  meaning: 'estrella',
  audioFilePath: 'sounds/星.mp3',
),

Flashcard(
  hanzi: '行',
  pinyin: 'xíng',
  meaning: 'andar',
  audioFilePath: 'sounds/行.mp3',
),

Flashcard(
  hanzi: '兄',
  pinyin: 'xiōng',
  meaning: 'hermano mayor',
  audioFilePath: 'sounds/兄.mp3',
),

Flashcard(
  hanzi: '胸',
  pinyin: 'xiōng',
  meaning: 'pecho',
  audioFilePath: 'sounds/胸.mp3',
),

Flashcard(
  hanzi: '雄',
  pinyin: 'xióng',
  meaning: 'macho',
  audioFilePath: 'sounds/雄.mp3',
),
Flashcard(
  hanzi: '再',
  pinyin: 'zài',
  meaning: 'otra vez',
  audioFilePath: 'sounds/再.mp3',
),

Flashcard(
  hanzi: '在',
  pinyin: 'zài',
  meaning: 'estar',
  audioFilePath: 'sounds/在.mp3',
),

Flashcard(
  hanzi: '早',
  pinyin: 'zǎo',
  meaning: 'temprano',
  audioFilePath: 'sounds/早.mp3',
),

Flashcard(
  hanzi: '造',
  pinyin: 'zào',
  meaning: 'crear',
  audioFilePath: 'sounds/造.mp3',
),

Flashcard(
  hanzi: '怎',
  pinyin: 'zěn',
  meaning: 'cómo',
  audioFilePath: 'sounds/怎.mp3',
),

Flashcard(
  hanzi: '增',
  pinyin: 'zēng',
  meaning: 'aumentar',
  audioFilePath: 'sounds/增.mp3',
),

Flashcard(
  hanzi: '则',
  pinyin: 'zé',
  meaning: 'entonces',
  audioFilePath: 'sounds/则.mp3',
),

Flashcard(
  hanzi: '责',
  pinyin: 'zé',
  meaning: 'responsabilidad',
  audioFilePath: 'sounds/责.mp3',
),

Flashcard(
  hanzi: '择',
  pinyin: 'zé',
  meaning: 'elegir',
  audioFilePath: 'sounds/择.mp3',
),

Flashcard(
  hanzi: '贼',
  pinyin: 'zéi',
  meaning: 'ladrón',
  audioFilePath: 'sounds/贼.mp3',
),

Flashcard(
  hanzi: '怎',
  pinyin: 'zěn',
  meaning: 'cómo',
  audioFilePath: 'sounds/怎.mp3',
),

Flashcard(
  hanzi: '曾',
  pinyin: 'céng',
  meaning: 'anteriormente',
  audioFilePath: 'sounds/曾.mp3',
),

Flashcard(
  hanzi: '走',
  pinyin: 'zǒu',
  meaning: 'caminar',
  audioFilePath: 'sounds/走.mp3',
),

Flashcard(
  hanzi: '租',
  pinyin: 'zū',
  meaning: 'alquilar',
  audioFilePath: 'sounds/租.mp3',
),

Flashcard(
  hanzi: '组',
  pinyin: 'zǔ',
  meaning: 'grupo',
  audioFilePath: 'sounds/组.mp3',
),

Flashcard(
  hanzi: '足',
  pinyin: 'zú',
  meaning: 'pie',
  audioFilePath: 'sounds/足.mp3',
),

Flashcard(
  hanzi: '祖',
  pinyin: 'zǔ',
  meaning: 'ancestro',
  audioFilePath: 'sounds/祖.mp3',
),

Flashcard(
  hanzi: '阻',
  pinyin: 'zǔ',
  meaning: 'bloquear',
  audioFilePath: 'sounds/阻.mp3',
),

Flashcard(
  hanzi: '嘴',
  pinyin: 'zuǐ',
  meaning: 'boca',
  audioFilePath: 'sounds/嘴.mp3',
),
Flashcard(
  hanzi: '吃',
  pinyin: 'chī',
  meaning: 'comer',
  audioFilePath: 'sounds/吃.mp3',
),

Flashcard(
  hanzi: '车',
  pinyin: 'chē',
  meaning: 'carro',
  audioFilePath: 'sounds/车.mp3',
),

Flashcard(
  hanzi: '茶',
  pinyin: 'chá',
  meaning: 'té',
  audioFilePath: 'sounds/茶.mp3',
),

Flashcard(
  hanzi: '厂',
  pinyin: 'chǎng',
  meaning: 'fábrica',
  audioFilePath: 'sounds/厂.mp3',
),

Flashcard(
  hanzi: '长',
  pinyin: 'cháng',
  meaning: 'largo',
  audioFilePath: 'sounds/长.mp3',
),

Flashcard(
  hanzi: '场',
  pinyin: 'chǎng',
  meaning: 'campo',
  audioFilePath: 'sounds/场.mp3',
),

Flashcard(
  hanzi: '唱',
  pinyin: 'chàng',
  meaning: 'cantar',
  audioFilePath: 'sounds/唱.mp3',
),

Flashcard(
  hanzi: '超',
  pinyin: 'chāo',
  meaning: 'exceder',
  audioFilePath: 'sounds/超.mp3',
),

Flashcard(
  hanzi: '成',
  pinyin: 'chéng',
  meaning: 'convertir',
  audioFilePath: 'sounds/成.mp3',
),

Flashcard(
  hanzi: '吃',
  pinyin: 'chī',
  meaning: 'comer',
  audioFilePath: 'sounds/吃.mp3',
),

Flashcard(
  hanzi: '迟',
  pinyin: 'chí',
  meaning: 'tarde',
  audioFilePath: 'sounds/迟.mp3',
),

Flashcard(
  hanzi: '重',
  pinyin: 'chóng',
  meaning: 'pesado',
  audioFilePath: 'sounds/重.mp3',
),

Flashcard(
  hanzi: '抽',
  pinyin: 'chōu',
  meaning: 'extraer',
  audioFilePath: 'sounds/抽.mp3',
),

Flashcard(
  hanzi: '出',
  pinyin: 'chū',
  meaning: 'salir',
  audioFilePath: 'sounds/出.mp3',
),

Flashcard(
  hanzi: '处',
  pinyin: 'chù',
  meaning: 'lugar',
  audioFilePath: 'sounds/处.mp3',
),

Flashcard(
  hanzi: '川',
  pinyin: 'chuān',
  meaning: 'río',
  audioFilePath: 'sounds/川.mp3',
),

Flashcard(
  hanzi: '船',
  pinyin: 'chuán',
  meaning: 'barco',
  audioFilePath: 'sounds/船.mp3',
),

Flashcard(
  hanzi: '穿',
  pinyin: 'chuān',
  meaning: 'vestir',
  audioFilePath: 'sounds/穿.mp3',
),

Flashcard(
  hanzi: '创',
  pinyin: 'chuàng',
  meaning: 'crear',
  audioFilePath: 'sounds/创.mp3',
),

Flashcard(
  hanzi: '春',
  pinyin: 'chūn',
  meaning: 'primavera',
  audioFilePath: 'sounds/春.mp3',
),
Flashcard(
  hanzi: '才',
  pinyin: 'cái',
  meaning: 'solo',
  audioFilePath: 'sounds/才.mp3',
),

Flashcard(
  hanzi: '菜',
  pinyin: 'cài',
  meaning: 'verdura',
  audioFilePath: 'sounds/菜.mp3',
),

Flashcard(
  hanzi: '测',
  pinyin: 'cè',
  meaning: 'medir',
  audioFilePath: 'sounds/测.mp3',
),

Flashcard(
  hanzi: '层',
  pinyin: 'céng',
  meaning: 'nivel',
  audioFilePath: 'sounds/层.mp3',
),

Flashcard(
  hanzi: '差',
  pinyin: 'chā',
  meaning: 'diferencia',
  audioFilePath: 'sounds/差.mp3',
),

Flashcard(
  hanzi: '查',
  pinyin: 'chá',
  meaning: 'investigar',
  audioFilePath: 'sounds/查.mp3',
),

Flashcard(
  hanzi: '成',
  pinyin: 'chéng',
  meaning: 'convertirse',
  audioFilePath: 'sounds/成.mp3',
),

Flashcard(
  hanzi: '成',
  pinyin: 'chéng',
  meaning: 'éxito',
  audioFilePath: 'sounds/成.mp3',
),

Flashcard(
  hanzi: '吃',
  pinyin: 'chī',
  meaning: 'comer',
  audioFilePath: 'sounds/吃.mp3',
),

Flashcard(
  hanzi: '初',
  pinyin: 'chū',
  meaning: 'primero',
  audioFilePath: 'sounds/初.mp3',
),

Flashcard(
  hanzi: '出',
  pinyin: 'chū',
  meaning: 'salir',
  audioFilePath: 'sounds/出.mp3',
),

Flashcard(
  hanzi: '错',
  pinyin: 'cuò',
  meaning: 'error',
  audioFilePath: 'sounds/错.mp3',
),

Flashcard(
  hanzi: '次',
  pinyin: 'cì',
  meaning: 'vez',
  audioFilePath: 'sounds/次.mp3',
),

Flashcard(
  hanzi: '聪',
  pinyin: 'cōng',
  meaning: 'inteligente',
  audioFilePath: 'sounds/聪.mp3',
),

Flashcard(
  hanzi: '从',
  pinyin: 'cóng',
  meaning: 'desde',
  audioFilePath: 'sounds/从.mp3',
),

Flashcard(
  hanzi: '错',
  pinyin: 'cuò',
  meaning: 'equivocarse',
  audioFilePath: 'sounds/错.mp3',
),

Flashcard(
  hanzi: '材',
  pinyin: 'cái',
  meaning: 'material',
  audioFilePath: 'sounds/材.mp3',
),

Flashcard(
  hanzi: '藏',
  pinyin: 'cáng',
  meaning: 'ocultar',
  audioFilePath: 'sounds/藏.mp3',
),
Flashcard(
  hanzi: '三',
  pinyin: 'sān',
  meaning: 'tres',
  audioFilePath: 'sounds/三.mp3',
),

Flashcard(
  hanzi: '山',
  pinyin: 'shān',
  meaning: 'montaña',
  audioFilePath: 'sounds/山.mp3',
),

Flashcard(
  hanzi: '扇',
  pinyin: 'shàn',
  meaning: 'abanico',
  audioFilePath: 'sounds/扇.mp3',
),

Flashcard(
  hanzi: '色',
  pinyin: 'sè',
  meaning: 'color',
  audioFilePath: 'sounds/色.mp3',
),

Flashcard(
  hanzi: '岁',
  pinyin: 'suì',
  meaning: 'edad',
  audioFilePath: 'sounds/岁.mp3',
),

Flashcard(
  hanzi: '说',
  pinyin: 'shuō',
  meaning: 'hablar',
  audioFilePath: 'sounds/说.mp3',
),

Flashcard(
  hanzi: '实',
  pinyin: 'shí',
  meaning: 'real',
  audioFilePath: 'sounds/实.mp3',
),

Flashcard(
  hanzi: '事',
  pinyin: 'shì',
  meaning: 'asunto',
  audioFilePath: 'sounds/事.mp3',
),

Flashcard(
  hanzi: '是',
  pinyin: 'shì',
  meaning: 'ser',
  audioFilePath: 'sounds/是.mp3',
),

Flashcard(
  hanzi: '手',
  pinyin: 'shǒu',
  meaning: 'mano',
  audioFilePath: 'sounds/手.mp3',
),

Flashcard(
  hanzi: '书',
  pinyin: 'shū',
  meaning: 'libro',
  audioFilePath: 'sounds/书.mp3',
),

Flashcard(
  hanzi: '水',
  pinyin: 'shuǐ',
  meaning: 'agua',
  audioFilePath: 'sounds/水.mp3',
),

Flashcard(
  hanzi: '算',
  pinyin: 'suàn',
  meaning: 'calcular',
  audioFilePath: 'sounds/算.mp3',
),

Flashcard(
  hanzi: '虽',
  pinyin: 'suī',
  meaning: 'aunque',
  audioFilePath: 'sounds/虽.mp3',
),

Flashcard(
  hanzi: '思',
  pinyin: 'sī',
  meaning: 'pensar',
  audioFilePath: 'sounds/思.mp3',
),

Flashcard(
  hanzi: '四',
  pinyin: 'sì',
  meaning: 'cuatro',
  audioFilePath: 'sounds/四.mp3',
),

Flashcard(
  hanzi: '松',
  pinyin: 'sōng',
  meaning: 'pino',
  audioFilePath: 'sounds/松.mp3',
),

Flashcard(
  hanzi: '送',
  pinyin: 'sòng',
  meaning: 'enviar',
  audioFilePath: 'sounds/送.mp3',
),

Flashcard(
  hanzi: '孙',
  pinyin: 'sūn',
  meaning: 'nieto',
  audioFilePath: 'sounds/孙.mp3',
),
Flashcard(
  hanzi: '一',
  pinyin: 'yī',
  meaning: 'uno',
  audioFilePath: 'sounds/一.mp3',
),

Flashcard(
  hanzi: '衣',
  pinyin: 'yī',
  meaning: 'ropa',
  audioFilePath: 'sounds/衣.mp3',
),

Flashcard(
  hanzi: '医',
  pinyin: 'yī',
  meaning: 'médico',
  audioFilePath: 'sounds/医.mp3',
),

Flashcard(
  hanzi: '以',
  pinyin: 'yǐ',
  meaning: 'con',
  audioFilePath: 'sounds/以.mp3',
),

Flashcard(
  hanzi: '意',
  pinyin: 'yì',
  meaning: 'idea',
  audioFilePath: 'sounds/意.mp3',
),

Flashcard(
  hanzi: '因',
  pinyin: 'yīn',
  meaning: 'porque',
  audioFilePath: 'sounds/因.mp3',
),

Flashcard(
  hanzi: '音',
  pinyin: 'yīn',
  meaning: 'sonido',
  audioFilePath: 'sounds/音.mp3',
),

Flashcard(
  hanzi: '银',
  pinyin: 'yín',
  meaning: 'plata',
  audioFilePath: 'sounds/银.mp3',
),

Flashcard(
  hanzi: '应',
  pinyin: 'yīng',
  meaning: 'deber',
  audioFilePath: 'sounds/应.mp3',
),

Flashcard(
  hanzi: '影',
  pinyin: 'yǐng',
  meaning: 'sombra',
  audioFilePath: 'sounds/影.mp3',
),

Flashcard(
  hanzi: '永',
  pinyin: 'yǒng',
  meaning: 'eterno',
  audioFilePath: 'sounds/永.mp3',
),

Flashcard(
  hanzi: '用',
  pinyin: 'yòng',
  meaning: 'usar',
  audioFilePath: 'sounds/用.mp3',
),

Flashcard(
  hanzi: '友',
  pinyin: 'yǒu',
  meaning: 'amigo',
  audioFilePath: 'sounds/友.mp3',
),

Flashcard(
  hanzi: '有',
  pinyin: 'yǒu',
  meaning: 'tener',
  audioFilePath: 'sounds/有.mp3',
),

Flashcard(
  hanzi: '游',
  pinyin: 'yóu',
  meaning: 'nadar',
  audioFilePath: 'sounds/游.mp3',
),

Flashcard(
  hanzi: '又',
  pinyin: 'yòu',
  meaning: 'de nuevo',
  audioFilePath: 'sounds/又.mp3',
),

Flashcard(
  hanzi: '于',
  pinyin: 'yú',
  meaning: 'en',
  audioFilePath: 'sounds/于.mp3',
),

Flashcard(
  hanzi: '雨',
  pinyin: 'yǔ',
  meaning: 'lluvia',
  audioFilePath: 'sounds/雨.mp3',
),

Flashcard(
  hanzi: '鱼',
  pinyin: 'yú',
  meaning: 'pez',
  audioFilePath: 'sounds/鱼.mp3',
),
Flashcard(
  hanzi: '中',
  pinyin: 'zhōng',
  meaning: 'medio',
  audioFilePath: 'sounds/中.mp3',
),

Flashcard(
  hanzi: '种',
  pinyin: 'zhǒng',
  meaning: 'tipo',
  audioFilePath: 'sounds/种.mp3',
),

Flashcard(
  hanzi: '重',
  pinyin: 'zhòng',
  meaning: 'pesado',
  audioFilePath: 'sounds/重.mp3',
),

Flashcard(
  hanzi: '周',
  pinyin: 'zhōu',
  meaning: 'semana',
  audioFilePath: 'sounds/周.mp3',
),

Flashcard(
  hanzi: '主',
  pinyin: 'zhǔ',
  meaning: 'principal',
  audioFilePath: 'sounds/主.mp3',
),

Flashcard(
  hanzi: '注',
  pinyin: 'zhù',
  meaning: 'nota',
  audioFilePath: 'sounds/注.mp3',
),

Flashcard(
  hanzi: '住',
  pinyin: 'zhù',
  meaning: 'vivir',
  audioFilePath: 'sounds/住.mp3',
),

Flashcard(
  hanzi: '竹',
  pinyin: 'zhú',
  meaning: 'bambú',
  audioFilePath: 'sounds/竹.mp3',
),

Flashcard(
  hanzi: '猪',
  pinyin: 'zhū',
  meaning: 'cerdo',
  audioFilePath: 'sounds/猪.mp3',
),

Flashcard(
  hanzi: '抓',
  pinyin: 'zhuā',
  meaning: 'agarrar',
  audioFilePath: 'sounds/抓.mp3',
),

Flashcard(
  hanzi: '转',
  pinyin: 'zhuǎn',
  meaning: 'girar',
  audioFilePath: 'sounds/转.mp3',
),

Flashcard(
  hanzi: '准',
  pinyin: 'zhǔn',
  meaning: 'aprobado',
  audioFilePath: 'sounds/准.mp3',
),

Flashcard(
  hanzi: '装',
  pinyin: 'zhuāng',
  meaning: 'vestir',
  audioFilePath: 'sounds/装.mp3',
),

Flashcard(
  hanzi: '妆',
  pinyin: 'zhuāng',
  meaning: 'maquillaje',
  audioFilePath: 'sounds/妆.mp3',
),

Flashcard(
  hanzi: '庄',
  pinyin: 'zhuāng',
  meaning: 'granja',
  audioFilePath: 'sounds/庄.mp3',
),

Flashcard(
  hanzi: '壮',
  pinyin: 'zhuàng',
  meaning: 'fuerte',
  audioFilePath: 'sounds/壮.mp3',
),

Flashcard(
  hanzi: '追',
  pinyin: 'zhuī',
  meaning: 'perseguir',
  audioFilePath: 'sounds/追.mp3',
),

Flashcard(
  hanzi: '赚',
  pinyin: 'zhuàn',
  meaning: 'ganar',
  audioFilePath: 'sounds/赚.mp3',
),

Flashcard(
  hanzi: '准备',
  pinyin: 'zhǔn bèi',
  meaning: 'preparar',
  audioFilePath: 'sounds/准备.mp3',
),
      ];
    }
    if (widget.level == 'HSK1') {
      return [
Flashcard(
  hanzi: '爱',
  pinyin: 'ài',
  meaning: 'amar',
  audioFilePath: 'sounds/爱.mp3',
),
Flashcard(
  hanzi: '八',
  pinyin: 'bā',
  meaning: 'ocho',
  audioFilePath: 'sounds/八.mp3',
),
Flashcard(
  hanzi: '爸爸',
  pinyin: 'bàba',
  meaning: 'padre',
  audioFilePath: 'sounds/爸爸.mp3',
),
Flashcard(
  hanzi: '杯子',
  pinyin: 'bēizi',
  meaning: 'vaso, taza',
  audioFilePath: 'sounds/杯子.mp3',
),
Flashcard(
  hanzi: '北京',
  pinyin: 'Běijīng',
  meaning: 'Pekín',
  audioFilePath: 'sounds/北京.mp3',
),
Flashcard(
  hanzi: '本',
  pinyin: 'běn',
  meaning: 'clasificador para libros',
  audioFilePath: 'sounds/本.mp3',
),
Flashcard(
  hanzi: '不',
  pinyin: 'bù',
  meaning: 'no',
  audioFilePath: 'sounds/不.mp3',
),
Flashcard(
  hanzi: '菜',
  pinyin: 'cài',
  meaning: 'plato, comida, verdura',
  audioFilePath: 'sounds/菜.mp3',
),
Flashcard(
  hanzi: '茶',
  pinyin: 'chá',
  meaning: 'té',
  audioFilePath: 'sounds/茶.mp3',
),
Flashcard(
  hanzi: '吃',
  pinyin: 'chī',
  meaning: 'comer',
  audioFilePath: 'sounds/吃.mp3',
),
Flashcard(
  hanzi: '出租车',
  pinyin: 'chūzūchē',
  meaning: 'taxi',
  audioFilePath: 'sounds/出租车.mp3',
),
Flashcard(
  hanzi: '打电话',
  pinyin: 'dǎ diànhuà',
  meaning: 'llamar por teléfono',
  audioFilePath: 'sounds/打电话.mp3',
),
Flashcard(
  hanzi: '大',
  pinyin: 'dà',
  meaning: 'grande',
  audioFilePath: 'sounds/大.mp3',
),
Flashcard(
  hanzi: '的',
  pinyin: 'de',
  meaning: 'partícula posesiva',
  audioFilePath: 'sounds/的.mp3',
),
Flashcard(
  hanzi: '点',
  pinyin: 'diǎn',
  meaning: 'hora',
  audioFilePath: 'sounds/点.mp3',
),
Flashcard(
  hanzi: '电脑',
  pinyin: 'diànnǎo',
  meaning: 'ordenador',
  audioFilePath: 'sounds/电脑.mp3',
),
Flashcard(
  hanzi: '电视',
  pinyin: 'diànshì',
  meaning: 'televisión',
  audioFilePath: 'sounds/电视.mp3',
),
Flashcard(
  hanzi: '电影',
  pinyin: 'diànyǐng',
  meaning: 'película',
  audioFilePath: 'sounds/电影.mp3',
),
Flashcard(
  hanzi: '东西',
  pinyin: 'dōngxi',
  meaning: 'cosa',
  audioFilePath: 'sounds/东西.mp3',
),
Flashcard(
  hanzi: '都',
  pinyin: 'dōu',
  meaning: 'todos',
  audioFilePath: 'sounds/都.mp3',
),
Flashcard(
  hanzi: '读',
  pinyin: 'dú',
  meaning: 'leer',
  audioFilePath: 'sounds/读.mp3',
),
Flashcard(
  hanzi: '对不起',
  pinyin: 'duìbuqǐ',
  meaning: 'lo siento',
  audioFilePath: 'sounds/对不起.mp3',
),
Flashcard(
  hanzi: '多',
  pinyin: 'duō',
  meaning: 'mucho',
  audioFilePath: 'sounds/多.mp3',
),
Flashcard(
  hanzi: '多少',
  pinyin: 'duōshao',
  meaning: 'cuánto',
  audioFilePath: 'sounds/多少.mp3',
),
Flashcard(
  hanzi: '儿子',
  pinyin: 'érzi',
  meaning: 'hijo',
  audioFilePath: 'sounds/儿子.mp3',
),
Flashcard(
  hanzi: '二',
  pinyin: 'èr',
  meaning: 'dos',
  audioFilePath: 'sounds/二.mp3',
),
Flashcard(
  hanzi: '饭馆',
  pinyin: 'fànguǎn',
  meaning: 'restaurante',
  audioFilePath: 'sounds/饭馆.mp3',
),
Flashcard(
  hanzi: '飞机',
  pinyin: 'fēijī',
  meaning: 'avión',
  audioFilePath: 'sounds/飞机.mp3',
),
Flashcard(
  hanzi: '分钟',
  pinyin: 'fēnzhōng',
  meaning: 'minuto',
  audioFilePath: 'sounds/分钟.mp3',
),
Flashcard(
  hanzi: '高兴',
  pinyin: 'gāoxìng',
  meaning: 'feliz',
  audioFilePath: 'sounds/高兴.mp3',
),
Flashcard(
  hanzi: '个',
  pinyin: 'gè',
  meaning: 'clasificador general',
  audioFilePath: 'sounds/个.mp3',
),
Flashcard(
  hanzi: '工作',
  pinyin: 'gōngzuò',
  meaning: 'trabajo',
  audioFilePath: 'sounds/工作.mp3',
),
Flashcard(
  hanzi: '狗',
  pinyin: 'gǒu',
  meaning: 'perro',
  audioFilePath: 'sounds/狗.mp3',
),
Flashcard(
  hanzi: '汉语',
  pinyin: 'Hànyǔ',
  meaning: 'chino (idioma)',
  audioFilePath: 'sounds/汉语.mp3',
),
Flashcard(
  hanzi: '好',
  pinyin: 'hǎo',
  meaning: 'bueno',
  audioFilePath: 'sounds/好.mp3',
),
Flashcard(
  hanzi: '号',
  pinyin: 'hào',
  meaning: 'día (del mes)',
  audioFilePath: 'sounds/号.mp3',
),
Flashcard(
  hanzi: '喝',
  pinyin: 'hē',
  meaning: 'beber',
  audioFilePath: 'sounds/喝.mp3',
),
Flashcard(
  hanzi: '和',
  pinyin: 'hé',
  meaning: 'y',
  audioFilePath: 'sounds/和.mp3',
),
Flashcard(
  hanzi: '很',
  pinyin: 'hěn',
  meaning: 'muy',
  audioFilePath: 'sounds/很.mp3',
),
Flashcard(
  hanzi: '后面',
  pinyin: 'hòumiàn',
  meaning: 'detrás',
  audioFilePath: 'sounds/后面.mp3',
),
Flashcard(
  hanzi: '回',
  pinyin: 'huí',
  meaning: 'volver',
  audioFilePath: 'sounds/回.mp3',
),
Flashcard(
  hanzi: '会',
  pinyin: 'huì',
  meaning: 'saber (hacer algo)',
  audioFilePath: 'sounds/会.mp3',
),
Flashcard(
  hanzi: '火车站',
  pinyin: 'huǒchēzhàn',
  meaning: 'estación de tren',
  audioFilePath: 'sounds/火车站.mp3',
),
Flashcard(
  hanzi: '几',
  pinyin: 'jǐ',
  meaning: 'cuántos',
  audioFilePath: 'sounds/几.mp3',
),
Flashcard(
  hanzi: '家',
  pinyin: 'jiā',
  meaning: 'casa',
  audioFilePath: 'sounds/家.mp3',
),
Flashcard(
  hanzi: '叫',
  pinyin: 'jiào',
  meaning: 'llamarse',
  audioFilePath: 'sounds/叫.mp3',
),
Flashcard(
  hanzi: '今天',
  pinyin: 'jīntiān',
  meaning: 'hoy',
  audioFilePath: 'sounds/今天.mp3',
),
Flashcard(
  hanzi: '九',
  pinyin: 'jiǔ',
  meaning: 'nueve',
  audioFilePath: 'sounds/九.mp3',
),
Flashcard(
  hanzi: '开',
  pinyin: 'kāi',
  meaning: 'abrir, conducir',
  audioFilePath: 'sounds/开.mp3',
),
Flashcard(
  hanzi: '看',
  pinyin: 'kàn',
  meaning: 'ver, mirar',
  audioFilePath: 'sounds/看.mp3',
),
Flashcard(
  hanzi: '看见',
  pinyin: 'kànjiàn',
  meaning: 'ver (alcanzar a ver)',
  audioFilePath: 'sounds/看见.mp3',
),
Flashcard(
  hanzi: '块',
  pinyin: 'kuài',
  meaning: 'clasificador para dinero',
  audioFilePath: 'sounds/块.mp3',
),
Flashcard(
  hanzi: '来',
  pinyin: 'lái',
  meaning: 'venir',
  audioFilePath: 'sounds/来.mp3',
),
Flashcard(
  hanzi: '老师',
  pinyin: 'lǎoshī',
  meaning: 'maestro',
  audioFilePath: 'sounds/老师.mp3',
),
Flashcard(
  hanzi: '了',
  pinyin: 'le',
  meaning: 'partícula de pasado',
  audioFilePath: 'sounds/了.mp3',
),
Flashcard(
  hanzi: '冷',
  pinyin: 'lěng',
  meaning: 'frío',
  audioFilePath: 'sounds/冷.mp3',
),
Flashcard(
  hanzi: '里',
  pinyin: 'lǐ',
  meaning: 'dentro',
  audioFilePath: 'sounds/里.mp3',
),
Flashcard(
  hanzi: '六',
  pinyin: 'liù',
  meaning: 'seis',
  audioFilePath: 'sounds/六.mp3',
),
Flashcard(
  hanzi: '妈妈',
  pinyin: 'māma',
  meaning: 'madre',
  audioFilePath: 'sounds/妈妈.mp3',
),
Flashcard(
  hanzi: '吗',
  pinyin: 'ma',
  meaning: 'partícula interrogativa',
  audioFilePath: 'sounds/吗.mp3',
),
Flashcard(
  hanzi: '买',
  pinyin: 'mǎi',
  meaning: 'comprar',
  audioFilePath: 'sounds/买.mp3',
),
Flashcard(
  hanzi: '猫',
  pinyin: 'māo',
  meaning: 'gato',
  audioFilePath: 'sounds/猫.mp3',
),
Flashcard(
  hanzi: '没',
  pinyin: 'méi',
  meaning: 'no tener',
  audioFilePath: 'sounds/没.mp3',
),
Flashcard(
  hanzi: '没有',
  pinyin: 'méiyǒu',
  meaning: 'no tener',
  audioFilePath: 'sounds/没有.mp3',
),
Flashcard(
  hanzi: '米饭',
  pinyin: 'mǐfàn',
  meaning: 'arroz cocido',
  audioFilePath: 'sounds/米饭.mp3',
),
Flashcard(
  hanzi: '明天',
  pinyin: 'míngtiān',
  meaning: 'mañana',
  audioFilePath: 'sounds/明天.mp3',
),
Flashcard(
  hanzi: '名字',
  pinyin: 'míngzi',
  meaning: 'nombre',
  audioFilePath: 'sounds/名字.mp3',
),
Flashcard(
  hanzi: '哪',
  pinyin: 'nǎ',
  meaning: 'cuál',
  audioFilePath: 'sounds/哪.mp3',
),
Flashcard(
  hanzi: '那',
  pinyin: 'nà',
  meaning: 'eso',
  audioFilePath: 'sounds/那.mp3',
),
Flashcard(
  hanzi: '呢',
  pinyin: 'ne',
  meaning: 'partícula interrogativa',
  audioFilePath: 'sounds/呢.mp3',
),
Flashcard(
  hanzi: '能',
  pinyin: 'néng',
  meaning: 'poder',
  audioFilePath: 'sounds/能.mp3',
),
Flashcard(
  hanzi: '你',
  pinyin: 'nǐ',
  meaning: 'tú',
  audioFilePath: 'sounds/你.mp3',
),
Flashcard(
  hanzi: '年',
  pinyin: 'nián',
  meaning: 'año',
  audioFilePath: 'sounds/年.mp3',
),
Flashcard(
  hanzi: '女儿',
  pinyin: 'nǚ´ér',
  meaning: 'hija',
  audioFilePath: 'sounds/女儿.mp3',
),
Flashcard(
  hanzi: '朋友',
  pinyin: 'péngyou',
  meaning: 'amigo',
  audioFilePath: 'sounds/朋友.mp3',
),
Flashcard(
  hanzi: '漂亮',
  pinyin: 'piàoliang',
  meaning: 'bonita',
  audioFilePath: 'sounds/漂亮.mp3',
),
Flashcard(
  hanzi: '苹果',
  pinyin: 'píngguǒ',
  meaning: 'manzana',
  audioFilePath: 'sounds/苹果.mp3',
),
Flashcard(
  hanzi: '七',
  pinyin: 'qī',
  meaning: 'siete',
  audioFilePath: 'sounds/七.mp3',
),
Flashcard(
  hanzi: '钱',
  pinyin: 'qián',
  meaning: 'dinero',
  audioFilePath: 'sounds/钱.mp3',
),
Flashcard(
  hanzi: '前面',
  pinyin: 'qiánmiàn',
  meaning: 'delante',
  audioFilePath: 'sounds/前面.mp3',
),
Flashcard(
  hanzi: '请',
  pinyin: 'qǐng',
  meaning: 'por favor',
  audioFilePath: 'sounds/请.mp3',
),
Flashcard(
  hanzi: '去',
  pinyin: 'qù',
  meaning: 'ir',
  audioFilePath: 'sounds/去.mp3',
),
Flashcard(
  hanzi: '热',
  pinyin: 'rè',
  meaning: 'calor',
  audioFilePath: 'sounds/热.mp3',
),
Flashcard(
  hanzi: '人',
  pinyin: 'rén',
  meaning: 'persona',
  audioFilePath: 'sounds/人.mp3',
),
Flashcard(
  hanzi: '认识',
  pinyin: 'rènshi',
  meaning: 'conocer',
  audioFilePath: 'sounds/认识.mp3',
),
Flashcard(
  hanzi: '三',
  pinyin: 'sān',
  meaning: 'tres',
  audioFilePath: 'sounds/三.mp3',
),
Flashcard(
  hanzi: '商店',
  pinyin: 'shāngdiàn',
  meaning: 'tienda',
  audioFilePath: 'sounds/商店.mp3',
),
Flashcard(
  hanzi: '上',
  pinyin: 'shàng',
  meaning: 'encima',
  audioFilePath: 'sounds/上.mp3',
),
Flashcard(
  hanzi: '上午',
  pinyin: 'shàngwǔ',
  meaning: 'mañana',
  audioFilePath: 'sounds/上午.mp3',
),
Flashcard(
  hanzi: '少',
  pinyin: 'shǎo',
  meaning: 'poco',
  audioFilePath: 'sounds/少.mp3',
),
Flashcard(
  hanzi: '谁',
  pinyin: 'shéi',
  meaning: 'quién',
  audioFilePath: 'sounds/谁.mp3',
),
Flashcard(
  hanzi: '什么',
  pinyin: 'shénme',
  meaning: 'qué',
  audioFilePath: 'sounds/什么.mp3',
),
Flashcard(
  hanzi: '十',
  pinyin: 'shí',
  meaning: 'diez',
  audioFilePath: 'sounds/十.mp3',
),
Flashcard(
  hanzi: '时候',
  pinyin: 'shíhou',
  meaning: 'tiempo, momento',
  audioFilePath: 'sounds/时候.mp3',
),
Flashcard(
  hanzi: '是',
  pinyin: 'shì',
  meaning: 'ser',
  audioFilePath: 'sounds/是.mp3',
),
Flashcard(
  hanzi: '书',
  pinyin: 'shū',
  meaning: 'libro',
  audioFilePath: 'sounds/书.mp3',
),
Flashcard(
  hanzi: '水',
  pinyin: 'shuǐ',
  meaning: 'agua',
  audioFilePath: 'sounds/水.mp3',
),
Flashcard(
  hanzi: '水果',
  pinyin: 'shuǐguǒ',
  meaning: 'fruta',
  audioFilePath: 'sounds/水果.mp3',
),
Flashcard(
  hanzi: '睡觉',
  pinyin: 'shuìjiào',
  meaning: 'dormir',
  audioFilePath: 'sounds/睡觉.mp3',
),
Flashcard(
  hanzi: '说',
  pinyin: 'shuō',
  meaning: 'decir',
  audioFilePath: 'sounds/说.mp3',
),
Flashcard(
  hanzi: '四',
  pinyin: 'sì',
  meaning: 'cuatro',
  audioFilePath: 'sounds/四.mp3',
),
Flashcard(
  hanzi: '岁',
  pinyin: 'suì',
  meaning: 'año (de edad)',
  audioFilePath: 'sounds/岁.mp3',
),
Flashcard(
  hanzi: '他',
  pinyin: 'tā',
  meaning: 'él',
  audioFilePath: 'sounds/他.mp3',
),
Flashcard(
  hanzi: '她',
  pinyin: 'tā',
  meaning: 'ella',
  audioFilePath: 'sounds/她.mp3',
),
Flashcard(
  hanzi: '太',
  pinyin: 'tài',
  meaning: 'demasiado',
  audioFilePath: 'sounds/太.mp3',
),
Flashcard(
  hanzi: '天气',
  pinyin: 'tiānqì',
  meaning: 'clima',
  audioFilePath: 'sounds/天气.mp3',
),
Flashcard(
  hanzi: '听',
  pinyin: 'tīng',
  meaning: 'escuchar',
  audioFilePath: 'sounds/听.mp3',
),
Flashcard(
  hanzi: '同学',
  pinyin: 'tóngxué',
  meaning: 'compañero de clase',
  audioFilePath: 'sounds/同学.mp3',
),
Flashcard(
  hanzi: '喂',
  pinyin: 'wèi',
  meaning: 'hola (por teléfono)',
  audioFilePath: 'sounds/喂.mp3',
),
Flashcard(
  hanzi: '我',
  pinyin: 'wǒ',
  meaning: 'yo',
  audioFilePath: 'sounds/我.mp3',
),
Flashcard(
  hanzi: '我们',
  pinyin: 'wǒmen',
  meaning: 'nosotros',
  audioFilePath: 'sounds/我们.mp3',
),
Flashcard(
  hanzi: '五',
  pinyin: 'wǔ',
  meaning: 'cinco',
  audioFilePath: 'sounds/五.mp3',
),
Flashcard(
  hanzi: '喜欢',
  pinyin: 'xǐhuan',
  meaning: 'gustar',
  audioFilePath: 'sounds/喜欢.mp3',
),
Flashcard(
  hanzi: '下',
  pinyin: 'xià',
  meaning: 'debajo',
  audioFilePath: 'sounds/下.mp3',
),
Flashcard(
  hanzi: '下午',
  pinyin: 'xiàwǔ',
  meaning: 'tarde (después del mediodía)',
  audioFilePath: 'sounds/下午.mp3',
),
Flashcard(
  hanzi: '下雨',
  pinyin: 'xiàyǔ',
  meaning: 'llover',
  audioFilePath: 'sounds/下雨.mp3',
),
Flashcard(
  hanzi: '先生',
  pinyin: 'xiānsheng',
  meaning: 'señor',
  audioFilePath: 'sounds/先生.mp3',
),
Flashcard(
  hanzi: '现在',
  pinyin: 'xiànzài',
  meaning: 'ahora',
  audioFilePath: 'sounds/现在.mp3',
),
Flashcard(
  hanzi: '想',
  pinyin: 'xiǎng',
  meaning: 'querer, pensar',
  audioFilePath: 'sounds/想.mp3',
),
Flashcard(
  hanzi: '小',
  pinyin: 'xiǎo',
  meaning: 'pequeño',
  audioFilePath: 'sounds/小.mp3',
),
Flashcard(
  hanzi: '小姐',
  pinyin: 'xiǎojie',
  meaning: 'señorita',
  audioFilePath: 'sounds/小姐.mp3',
),
Flashcard(
  hanzi: '些',
  pinyin: 'xiē',
  meaning: 'algunos',
  audioFilePath: 'sounds/些.mp3',
),
Flashcard(
  hanzi: '写',
  pinyin: 'xiě',
  meaning: 'escribir',
  audioFilePath: 'sounds/写.mp3',
),
Flashcard(
  hanzi: '谢谢',
  pinyin: 'xièxie',
  meaning: 'gracias',
  audioFilePath: 'sounds/谢谢.mp3',
),
Flashcard(
  hanzi: '星期',
  pinyin: 'xīngqī',
  meaning: 'semana',
  audioFilePath: 'sounds/星期.mp3',
),
Flashcard(
  hanzi: '学生',
  pinyin: 'xuésheng',
  meaning: 'estudiante',
  audioFilePath: 'sounds/学生.mp3',
),
Flashcard(
  hanzi: '学习',
  pinyin: 'xuéxí',
  meaning: 'estudiar',
  audioFilePath: 'sounds/学习.mp3',
),
Flashcard(
  hanzi: '学校',
  pinyin: 'xuéxiào',
  meaning: 'escuela',
  audioFilePath: 'sounds/学校.mp3',
),
Flashcard(
  hanzi: '一',
  pinyin: 'yī',
  meaning: 'uno',
  audioFilePath: 'sounds/一.mp3',
),
Flashcard(
  hanzi: '衣服',
  pinyin: 'yīfu',
  meaning: 'ropa',
  audioFilePath: 'sounds/衣服.mp3',
),
Flashcard(
  hanzi: '医生',
  pinyin: 'yīshēng',
  meaning: 'doctor',
  audioFilePath: 'sounds/医生.mp3',
),
Flashcard(
  hanzi: '医院',
  pinyin: 'yīyuàn',
  meaning: 'hospital',
  audioFilePath: 'sounds/医院.mp3',
),
Flashcard(
  hanzi: '椅子',
  pinyin: 'yǐzi',
  meaning: 'silla',
  audioFilePath: 'sounds/椅子.mp3',
),
Flashcard(
  hanzi: '有',
  pinyin: 'yǒu',
  meaning: 'tener',
  audioFilePath: 'sounds/有.mp3',
),
Flashcard(
  hanzi: '月',
  pinyin: 'yuè',
  meaning: 'mes',
  audioFilePath: 'sounds/月.mp3',
),
Flashcard(
  hanzi: '在',
  pinyin: 'zài',
  meaning: 'en',
  audioFilePath: 'sounds/在.mp3',
),
Flashcard(
  hanzi: '再见',
  pinyin: 'zàijiàn',
  meaning: 'adiós',
  audioFilePath: 'sounds/再见.mp3',
),
Flashcard(
  hanzi: '怎么',
  pinyin: 'zěnme',
  meaning: 'cómo',
  audioFilePath: 'sounds/怎么.mp3',
),
Flashcard(
  hanzi: '怎么样',
  pinyin: 'zěnmeyàng',
  meaning: 'qué tal',
  audioFilePath: 'sounds/怎么样.mp3',
),
Flashcard(
  hanzi: '这',
  pinyin: 'zhè',
  meaning: 'esto',
  audioFilePath: 'sounds/这.mp3',
),
Flashcard(
  hanzi: '中国',
  pinyin: 'Zhōngguó',
  meaning: 'China',
  audioFilePath: 'sounds/中国.mp3',
),
Flashcard(
  hanzi: '中午',
  pinyin: 'zhōngwǔ',
  meaning: 'mediodía',
  audioFilePath: 'sounds/中午.mp3',
),
Flashcard(
  hanzi: '住',
  pinyin: 'zhù',
  meaning: 'vivir',
  audioFilePath: 'sounds/住.mp3',
),
Flashcard(
  hanzi: '桌子',
  pinyin: 'zhuōzi',
  meaning: 'mesa',
  audioFilePath: 'sounds/桌子.mp3',
),
Flashcard(
  hanzi: '字',
  pinyin: 'zì',
  meaning: 'carácter',
  audioFilePath: 'sounds/字.mp3',
),
Flashcard(
  hanzi: '昨天',
  pinyin: 'zuótiān',
  meaning: 'ayer',
  audioFilePath: 'sounds/昨天.mp3',
),
Flashcard(
  hanzi: '做',
  pinyin: 'zuò',
  meaning: 'hacer',
  audioFilePath: 'sounds/做.mp3',
),
Flashcard(
  hanzi: '坐',
  pinyin: 'zuò',
  meaning: 'sentarse',
  audioFilePath: 'sounds/坐.mp3',
),
Flashcard(
  hanzi: '作',
  pinyin: 'zuò',
  meaning: 'trabajo, tarea',
  audioFilePath: 'sounds/作.mp3',
),
Flashcard(
  hanzi: '作业',
  pinyin: 'zuòyè',
  meaning: 'tarea',
  audioFilePath: 'sounds/作业.mp3',
),
Flashcard(
  hanzi: '昨天',
  pinyin: 'zuótiān',
  meaning: 'ayer',
  audioFilePath: 'sounds/昨天.mp3',
),
Flashcard(
  hanzi: '走',
  pinyin: 'zǒu',
  meaning: 'caminar',
  audioFilePath: 'sounds/走.mp3',
),
Flashcard(
  hanzi: '朋友',
  pinyin: 'péngyǒu',
  meaning: 'amigo',
  audioFilePath: 'sounds/朋友.mp3',
)
      ];
    }
  if (widget.level == 'HSK2') {
      return [
Flashcard(
  hanzi: '说',
  pinyin: 'shuō',
  meaning: 'decir',
  audioFilePath: 'sounds/说.mp3',
),
Flashcard(
  hanzi: '写',
  pinyin: 'xiě',
  meaning: 'escribir',
  audioFilePath: 'sounds/写.mp3',
),
Flashcard(
  hanzi: '买',
  pinyin: 'mǎi',
  meaning: 'comprar',
  audioFilePath: 'sounds/买.mp3',
),
Flashcard(
  hanzi: '家',
  pinyin: 'jiā',
  meaning: 'casa',
  audioFilePath: 'sounds/家.mp3',
),
Flashcard(
  hanzi: '菜',
  pinyin: 'cài',
  meaning: 'comida',
  audioFilePath: 'sounds/菜.mp3',
),
Flashcard(
  hanzi: '再',
  pinyin: 'zài',
  meaning: 'otra vez',
  audioFilePath: 'sounds/再.mp3',
),
Flashcard(
  hanzi: '错',
  pinyin: 'cuò',
  meaning: 'error',
  audioFilePath: 'sounds/错.mp3',
),
Flashcard(
  hanzi: '比',
  pinyin: 'bǐ',
  meaning: 'comparar',
  audioFilePath: 'sounds/比.mp3',
),
Flashcard(
  hanzi: '票',
  pinyin: 'piào',
  meaning: 'billete',
  audioFilePath: 'sounds/票.mp3',
),
Flashcard(
  hanzi: '课',
  pinyin: 'kè',
  meaning: 'lección',
  audioFilePath: 'sounds/课.mp3',
),
Flashcard(
  hanzi: '考',
  pinyin: 'kǎo',
  meaning: 'examinar',
  audioFilePath: 'sounds/考.mp3',
),
Flashcard(
  hanzi: '问',
  pinyin: 'wèn',
  meaning: 'preguntar',
  audioFilePath: 'sounds/问.mp3',
),
Flashcard(
  hanzi: '懂',
  pinyin: 'dǒng',
  meaning: 'entender',
  audioFilePath: 'sounds/懂.mp3',
),
Flashcard(
  hanzi: '帮',
  pinyin: 'bāng',
  meaning: 'ayudar',
  audioFilePath: 'sounds/帮.mp3',
),
Flashcard(
  hanzi: '找',
  pinyin: 'zhǎo',
  meaning: 'buscar',
  audioFilePath: 'sounds/找.mp3',
),
Flashcard(
  hanzi: '给',
  pinyin: 'gěi',
  meaning: 'dar',
  audioFilePath: 'sounds/给.mp3',
),
Flashcard(
  hanzi: '进',
  pinyin: 'jìn',
  meaning: 'entrar',
  audioFilePath: 'sounds/进.mp3',
),
Flashcard(
  hanzi: '等',
  pinyin: 'děng',
  meaning: 'esperar',
  audioFilePath: 'sounds/等.mp3',
),
Flashcard(
  hanzi: '换',
  pinyin: 'huàn',
  meaning: 'cambiar',
  audioFilePath: 'sounds/换.mp3',
),
Flashcard(
  hanzi: '穿',
  pinyin: 'chuān',
  meaning: 'vestir',
  audioFilePath: 'sounds/穿.mp3',
),
Flashcard(
  hanzi: '送',
  pinyin: 'sòng',
  meaning: 'enviar',
  audioFilePath: 'sounds/送.mp3',
),
Flashcard(
  hanzi: '到',
  pinyin: 'dào',
  meaning: 'llegar',
  audioFilePath: 'sounds/到.mp3',
),
Flashcard(
  hanzi: '路',
  pinyin: 'lù',
  meaning: 'camino',
  audioFilePath: 'sounds/路.mp3',
),
Flashcard(
  hanzi: '票',
  pinyin: 'piào',
  meaning: 'billete',
  audioFilePath: 'sounds/票.mp3',
),
Flashcard(
  hanzi: '完',
  pinyin: 'wán',
  meaning: 'terminar',
  audioFilePath: 'sounds/完.mp3',
),
Flashcard(
  hanzi: '准备',
  pinyin: 'zhǔnbèi',
  meaning: 'preparar',
  audioFilePath: 'sounds/准备.mp3',
),
Flashcard(
  hanzi: '试',
  pinyin: 'shì',
  meaning: 'probar',
  audioFilePath: 'sounds/试.mp3',
),
Flashcard(
  hanzi: '慢',
  pinyin: 'màn',
  meaning: 'lento',
  audioFilePath: 'sounds/慢.mp3',
),
Flashcard(
  hanzi: '快',
  pinyin: 'kuài',
  meaning: 'rápido',
  audioFilePath: 'sounds/快.mp3',
),
Flashcard(
  hanzi: '远',
  pinyin: 'yuǎn',
  meaning: 'lejos',
  audioFilePath: 'sounds/远.mp3',
)
  ];
  }
  if (widget.level == 'HSK3') {
      return [
Flashcard(
  hanzi: '带',
  pinyin: 'dài',
  meaning: 'llevar',
  audioFilePath: 'sounds/带.mp3',
),
Flashcard(
  hanzi: '起',
  pinyin: 'qǐ',
  meaning: 'levantarse',
  audioFilePath: 'sounds/起.mp3',
),
Flashcard(
  hanzi: '车',
  pinyin: 'chē',
  meaning: 'coche',
  audioFilePath: 'sounds/车.mp3',
),
Flashcard(
  hanzi: '张',
  pinyin: 'zhāng',
  meaning: 'abrir',
  audioFilePath: 'sounds/张.mp3',
),
Flashcard(
  hanzi: '愿意',
  pinyin: 'yuànyì',
  meaning: 'desear',
  audioFilePath: 'sounds/愿意.mp3',
),
Flashcard(
  hanzi: '需要',
  pinyin: 'xūyào',
  meaning: 'necesitar',
  audioFilePath: 'sounds/需要.mp3',
),
Flashcard(
  hanzi: '帮助',
  pinyin: 'bāngzhù',
  meaning: 'ayuda',
  audioFilePath: 'sounds/帮助.mp3',
),
Flashcard(
  hanzi: '会议',
  pinyin: 'huìyì',
  meaning: 'reunión',
  audioFilePath: 'sounds/会议.mp3',
),
Flashcard(
  hanzi: '礼物',
  pinyin: 'lǐwù',
  meaning: 'regalo',
  audioFilePath: 'sounds/礼物.mp3',
),
Flashcard(
  hanzi: '机场',
  pinyin: 'jīchǎng',
  meaning: 'aeropuerto',
  audioFilePath: 'sounds/机场.mp3',
),
Flashcard(
  hanzi: '小心',
  pinyin: 'xiǎoxīn',
  meaning: 'tener cuidado',
  audioFilePath: 'sounds/小心.mp3',
),
Flashcard(
  hanzi: '超市',
  pinyin: 'chāoshì',
  meaning: 'supermercado',
  audioFilePath: 'sounds/超市.mp3',
),
Flashcard(
  hanzi: '总是',
  pinyin: 'zǒngshì',
  meaning: 'siempre',
  audioFilePath: 'sounds/总是.mp3',
),
Flashcard(
  hanzi: '努力',
  pinyin: 'nǔlì',
  meaning: 'esforzarse',
  audioFilePath: 'sounds/努力.mp3',
),
Flashcard(
  hanzi: '声音',
  pinyin: 'shēngyīn',
  meaning: 'sonido',
  audioFilePath: 'sounds/声音.mp3',
),
Flashcard(
  hanzi: '新鲜',
  pinyin: 'xīnxiān',
  meaning: 'fresco',
  audioFilePath: 'sounds/新鲜.mp3',
),
Flashcard(
  hanzi: '裤子',
  pinyin: 'kùzi',
  meaning: 'pantalones',
  audioFilePath: 'sounds/裤子.mp3',
),
Flashcard(
  hanzi: '裙子',
  pinyin: 'qúnzi',
  meaning: 'falda',
  audioFilePath: 'sounds/裙子.mp3',
),
Flashcard(
  hanzi: '方便',
  pinyin: 'fāngbiàn',
  meaning: 'conveniente',
  audioFilePath: 'sounds/方便.mp3',
),
Flashcard(
  hanzi: '历史',
  pinyin: 'lìshǐ',
  meaning: 'historia',
  audioFilePath: 'sounds/历史.mp3',
),
Flashcard(
  hanzi: '季节',
  pinyin: 'jìjié',
  meaning: 'estación',
  audioFilePath: 'sounds/季节.mp3',
),
Flashcard(
  hanzi: '音乐',
  pinyin: 'yīnyuè',
  meaning: 'música',
  audioFilePath: 'sounds/音乐.mp3',
),
Flashcard(
  hanzi: '健康',
  pinyin: 'jiànkāng',
  meaning: 'salud',
  audioFilePath: 'sounds/健康.mp3',
),
Flashcard(
  hanzi: '数学',
  pinyin: 'shùxué',
  meaning: 'matemáticas',
  audioFilePath: 'sounds/数学.mp3',
),
Flashcard(
  hanzi: '特别',
  pinyin: 'tèbié',
  meaning: 'especial',
  audioFilePath: 'sounds/特别.mp3',
),
Flashcard(
  hanzi: '照顾',
  pinyin: 'zhàogu',
  meaning: 'cuidar',
  audioFilePath: 'sounds/照顾.mp3',
),
Flashcard(
  hanzi: '复习',
  pinyin: 'fùxí',
  meaning: 'repasar',
  audioFilePath: 'sounds/复习.mp3',
),
Flashcard(
  hanzi: '留学',
  pinyin: 'liúxué',
  meaning: 'estudiar en el extranjero',
  audioFilePath: 'sounds/留学.mp3',
),
Flashcard(
  hanzi: '环境',
  pinyin: 'huánjìng',
  meaning: 'medio ambiente',
  audioFilePath: 'sounds/环境.mp3',
),
Flashcard(
  hanzi: '机会',
  pinyin: 'jīhuì',
  meaning: 'oportunidad',
  audioFilePath: 'sounds/机会.mp3',
)
  ];
  }
  if (widget.level == 'HSK4') {
      return [
Flashcard(
  hanzi: '爱情',
  pinyin: 'àiqíng',
  meaning: 'amor',
  audioFilePath: 'sounds/爱情.mp3',
),
Flashcard(
  hanzi: '安排',
  pinyin: 'ānpái',
  meaning: 'organizar',
  audioFilePath: 'sounds/安排.mp3',
),
Flashcard(
  hanzi: '安全',
  pinyin: 'ānquán',
  meaning: 'seguridad',
  audioFilePath: 'sounds/安全.mp3',
),
Flashcard(
  hanzi: '抱歉',
  pinyin: 'bàoqiàn',
  meaning: 'disculpa',
  audioFilePath: 'sounds/抱歉.mp3',
),
Flashcard(
  hanzi: '保护',
  pinyin: 'bǎohù',
  meaning: 'proteger',
  audioFilePath: 'sounds/保护.mp3',
),
Flashcard(
  hanzi: '报名',
  pinyin: 'bàomíng',
  meaning: 'registrarse',
  audioFilePath: 'sounds/报名.mp3',
),
Flashcard(
  hanzi: '不仅',
  pinyin: 'bùjǐn',
  meaning: 'no solo',
  audioFilePath: 'sounds/不仅.mp3',
),
Flashcard(
  hanzi: '才',
  pinyin: 'cái',
  meaning: 'apenas',
  audioFilePath: 'sounds/才.mp3',
),
Flashcard(
  hanzi: '材料',
  pinyin: 'cáiliào',
  meaning: 'material',
  audioFilePath: 'sounds/材料.mp3',
),
Flashcard(
  hanzi: '成绩',
  pinyin: 'chéngjì',
  meaning: 'resultado',
  audioFilePath: 'sounds/成绩.mp3',
),
Flashcard(
  hanzi: '出差',
  pinyin: 'chūchāi',
  meaning: 'viaje de negocios',
  audioFilePath: 'sounds/出差.mp3',
),
Flashcard(
  hanzi: '打折',
  pinyin: 'dǎzhé',
  meaning: 'descuento',
  audioFilePath: 'sounds/打折.mp3',
),
Flashcard(
  hanzi: '大约',
  pinyin: 'dàyuē',
  meaning: 'aproximadamente',
  audioFilePath: 'sounds/大约.mp3',
),
Flashcard(
  hanzi: '代表',
  pinyin: 'dàibiǎo',
  meaning: 'representar',
  audioFilePath: 'sounds/代表.mp3',
),
Flashcard(
  hanzi: '打算',
  pinyin: 'dǎsuàn',
  meaning: 'planear',
  audioFilePath: 'sounds/打算.mp3',
),
Flashcard(
  hanzi: '发展',
  pinyin: 'fāzhǎn',
  meaning: 'desarrollar',
  audioFilePath: 'sounds/发展.mp3',
),
Flashcard(
  hanzi: '方法',
  pinyin: 'fāngfǎ',
  meaning: 'método',
  audioFilePath: 'sounds/方法.mp3',
),
Flashcard(
  hanzi: '房东',
  pinyin: 'fángdōng',
  meaning: 'casero',
  audioFilePath: 'sounds/房东.mp3',
),
Flashcard(
  hanzi: '否则',
  pinyin: 'fǒuzé',
  meaning: 'de lo contrario',
  audioFilePath: 'sounds/否则.mp3',
),
Flashcard(
  hanzi: '父母',
  pinyin: 'fùmǔ',
  meaning: 'padres',
  audioFilePath: 'sounds/父母.mp3',
),
Flashcard(
  hanzi: '付款',
  pinyin: 'fùkuǎn',
  meaning: 'pagar',
  audioFilePath: 'sounds/付款.mp3',
),
Flashcard(
  hanzi: '复印',
  pinyin: 'fùyìn',
  meaning: 'fotocopiar',
  audioFilePath: 'sounds/复印.mp3',
),
Flashcard(
  hanzi: '广告',
  pinyin: 'guǎnggào',
  meaning: 'anuncio',
  audioFilePath: 'sounds/广告.mp3',
),
Flashcard(
  hanzi: '过程',
  pinyin: 'guòchéng',
  meaning: 'proceso',
  audioFilePath: 'sounds/过程.mp3',
),
Flashcard(
  hanzi: '护照',
  pinyin: 'hùzhào',
  meaning: 'pasaporte',
  audioFilePath: 'sounds/护照.mp3',
),
Flashcard(
  hanzi: '回忆',
  pinyin: 'huíyì',
  meaning: 'recordar',
  audioFilePath: 'sounds/回忆.mp3',
),
Flashcard(
  hanzi: '活动',
  pinyin: 'huódòng',
  meaning: 'actividad',
  audioFilePath: 'sounds/活动.mp3',
),
Flashcard(
  hanzi: '获得',
  pinyin: 'huòdé',
  meaning: 'obtener',
  audioFilePath: 'sounds/获得.mp3',
),
Flashcard(
  hanzi: '积累',
  pinyin: 'jīlěi',
  meaning: 'acumular',
  audioFilePath: 'sounds/积累.mp3',
),
Flashcard(
  hanzi: '继续',
  pinyin: 'jìxù',
  meaning: 'continuar',
  audioFilePath: 'sounds/继续.mp3',
)
  ];
  }
  if (widget.level == 'HSK5') {
      return [
Flashcard(
  hanzi: '爱护',
  pinyin: 'àihù',
  meaning: 'cuidar',
  audioFilePath: 'sounds/爱护.mp3',
),
Flashcard(
  hanzi: '爱惜',
  pinyin: 'àixī',
  meaning: 'valorar',
  audioFilePath: 'sounds/爱惜.mp3',
),
Flashcard(
  hanzi: '爱心',
  pinyin: 'àixīn',
  meaning: 'compasión',
  audioFilePath: 'sounds/爱心.mp3',
),
Flashcard(
  hanzi: '安慰',
  pinyin: 'ānwèi',
  meaning: 'consolar',
  audioFilePath: 'sounds/安慰.mp3',
),
Flashcard(
  hanzi: '安装',
  pinyin: 'ānzhuāng',
  meaning: 'instalar',
  audioFilePath: 'sounds/安装.mp3',
),
Flashcard(
  hanzi: '熬夜',
  pinyin: 'áoyè',
  meaning: 'trasnochar',
  audioFilePath: 'sounds/熬夜.mp3',
),
Flashcard(
  hanzi: '把握',
  pinyin: 'bǎwò',
  meaning: 'sujetar',
  audioFilePath: 'sounds/把握.mp3',
),
Flashcard(
  hanzi: '摆',
  pinyin: 'bǎi',
  meaning: 'colocar',
  audioFilePath: 'sounds/摆.mp3',
),
Flashcard(
  hanzi: '班主任',
  pinyin: 'bānzhǔrèn',
  meaning: 'tutor de clase',
  audioFilePath: 'sounds/班主任.mp3',
),
Flashcard(
  hanzi: '办理',
  pinyin: 'bànlǐ',
  meaning: 'gestionar',
  audioFilePath: 'sounds/办理.mp3',
),
Flashcard(
  hanzi: '傍晚',
  pinyin: 'bàngwǎn',
  meaning: 'atardecer',
  audioFilePath: 'sounds/傍晚.mp3',
),
Flashcard(
  hanzi: '包裹',
  pinyin: 'bāoguǒ',
  meaning: 'paquete',
  audioFilePath: 'sounds/包裹.mp3',
),
Flashcard(
  hanzi: '包子',
  pinyin: 'bāozi',
  meaning: 'bollo relleno',
  audioFilePath: 'sounds/包子.mp3',
),
Flashcard(
  hanzi: '宝贝',
  pinyin: 'bǎobèi',
  meaning: 'tesoro',
  audioFilePath: 'sounds/宝贝.mp3',
),
Flashcard(
  hanzi: '保持',
  pinyin: 'bǎochí',
  meaning: 'mantener',
  audioFilePath: 'sounds/保持.mp3',
),
Flashcard(
  hanzi: '保存',
  pinyin: 'bǎocún',
  meaning: 'conservar',
  audioFilePath: 'sounds/保存.mp3',
),
Flashcard(
  hanzi: '报到',
  pinyin: 'bàodào',
  meaning: 'registrarse',
  audioFilePath: 'sounds/报到.mp3',
),
Flashcard(
  hanzi: '报道',
  pinyin: 'bàodào',
  meaning: 'reportar',
  audioFilePath: 'sounds/报道.mp3',
),
Flashcard(
  hanzi: '报社',
  pinyin: 'bàoshè',
  meaning: 'oficina de periódico',
  audioFilePath: 'sounds/报社.mp3',
),
Flashcard(
  hanzi: '抱怨',
  pinyin: 'bàoyuàn',
  meaning: 'quejarse',
  audioFilePath: 'sounds/抱怨.mp3',
),
Flashcard(
  hanzi: '背',
  pinyin: 'bēi',
  meaning: 'llevar a la espalda',
  audioFilePath: 'sounds/背.mp3',
),
Flashcard(
  hanzi: '背',
  pinyin: 'bèi',
  meaning: 'espalda',
  audioFilePath: 'sounds/背.mp3',
),
Flashcard(
  hanzi: '背景',
  pinyin: 'bèijǐng',
  meaning: 'fondo',
  audioFilePath: 'sounds/背景.mp3',
),
Flashcard(
  hanzi: '被子',
  pinyin: 'bèizi',
  meaning: 'manta',
  audioFilePath: 'sounds/被子.mp3',
),
Flashcard(
  hanzi: '本科',
  pinyin: 'běnkē',
  meaning: 'licenciatura',
  audioFilePath: 'sounds/本科.mp3',
),
Flashcard(
  hanzi: '本领',
  pinyin: 'běnlǐng',
  meaning: 'habilidad',
  audioFilePath: 'sounds/本领.mp3',
),
Flashcard(
  hanzi: '本质',
  pinyin: 'běnzhì',
  meaning: 'esencia',
  audioFilePath: 'sounds/本质.mp3',
),
Flashcard(
  hanzi: '彼此',
  pinyin: 'bǐcǐ',
  meaning: 'mutuamente',
  audioFilePath: 'sounds/彼此.mp3',
),
Flashcard(
  hanzi: '比例',
  pinyin: 'bǐlì',
  meaning: 'proporción',
  audioFilePath: 'sounds/比例.mp3',
),
Flashcard(
  hanzi: '必然',
  pinyin: 'bìrán',
  meaning: 'inevitable',
  audioFilePath: 'sounds/必然.mp3',
)
  ];
  }
  if (widget.level == 'HSK6') {
      return [
Flashcard(
  hanzi: '爱不释手',
  pinyin: 'àibùshìshǒu',
  meaning: 'encantar',
  audioFilePath: 'sounds/爱不释手.mp3',
),
Flashcard(
  hanzi: '爱戴',
  pinyin: 'àidài',
  meaning: 'apreciar',
  audioFilePath: 'sounds/爱戴.mp3',
),
Flashcard(
  hanzi: '安居乐业',
  pinyin: 'ānjūlèyè',
  meaning: 'vivir y trabajar felizmente',
  audioFilePath: 'sounds/安居乐业.mp3',
),
Flashcard(
  hanzi: '安宁',
  pinyin: 'ānníng',
  meaning: 'tranquilidad',
  audioFilePath: 'sounds/安宁.mp3',
),
Flashcard(
  hanzi: '安详',
  pinyin: 'ānxiáng',
  meaning: 'sereno',
  audioFilePath: 'sounds/安详.mp3',
),
Flashcard(
  hanzi: '安置',
  pinyin: 'ānzhì',
  meaning: 'colocar',
  audioFilePath: 'sounds/安置.mp3',
),
Flashcard(
  hanzi: '昂贵',
  pinyin: 'ángguì',
  meaning: 'caro',
  audioFilePath: 'sounds/昂贵.mp3',
),
Flashcard(
  hanzi: '熬',
  pinyin: 'áo',
  meaning: 'soportar',
  audioFilePath: 'sounds/熬.mp3',
),
Flashcard(
  hanzi: '奥秘',
  pinyin: 'àomì',
  meaning: 'misterio',
  audioFilePath: 'sounds/奥秘.mp3',
),
Flashcard(
  hanzi: '巴不得',
  pinyin: 'bābùdé',
  meaning: 'anhelar',
  audioFilePath: 'sounds/巴不得.mp3',
),
Flashcard(
  hanzi: '巴结',
  pinyin: 'bājie',
  meaning: 'halagar',
  audioFilePath: 'sounds/巴结.mp3',
),
Flashcard(
  hanzi: '拔苗助长',
  pinyin: 'bámiáozhùzhǎng',
  meaning: 'precipitarse',
  audioFilePath: 'sounds/拔苗助长.mp3',
),
Flashcard(
  hanzi: '把关',
  pinyin: 'bǎguān',
  meaning: 'controlar',
  audioFilePath: 'sounds/把关.mp3',
),
Flashcard(
  hanzi: '把手',
  pinyin: 'bǎshou',
  meaning: 'manija',
  audioFilePath: 'sounds/把手.mp3',
),
Flashcard(
  hanzi: '罢工',
  pinyin: 'bàgōng',
  meaning: 'huelga',
  audioFilePath: 'sounds/罢工.mp3',
),
Flashcard(
  hanzi: '霸道',
  pinyin: 'bàdào',
  meaning: 'arrogante',
  audioFilePath: 'sounds/霸道.mp3',
),
Flashcard(
  hanzi: '摆脱',
  pinyin: 'bǎituō',
  meaning: 'deshacerse de',
  audioFilePath: 'sounds/摆脱.mp3',
),
Flashcard(
  hanzi: '拜访',
  pinyin: 'bàifǎng',
  meaning: 'visitar',
  audioFilePath: 'sounds/拜访.mp3',
),
Flashcard(
  hanzi: '拜年',
  pinyin: 'bàinián',
  meaning: 'felicitar el año nuevo',
  audioFilePath: 'sounds/拜年.mp3',
),
Flashcard(
  hanzi: '拜托',
  pinyin: 'bàituō',
  meaning: 'encargar',
  audioFilePath: 'sounds/拜托.mp3',
),
Flashcard(
  hanzi: '颁布',
  pinyin: 'bānbù',
  meaning: 'promulgar',
  audioFilePath: 'sounds/颁布.mp3',
),
Flashcard(
  hanzi: '颁发',
  pinyin: 'bānfā',
  meaning: 'otorgar',
  audioFilePath: 'sounds/颁发.mp3',
),
Flashcard(
  hanzi: '伴侣',
  pinyin: 'bànlǚ',
  meaning: 'compañero',
  audioFilePath: 'sounds/伴侣.mp3',
),
Flashcard(
  hanzi: '伴随',
  pinyin: 'bànsuí',
  meaning: 'acompañar',
  audioFilePath: 'sounds/伴随.mp3',
),
Flashcard(
  hanzi: '半途而废',
  pinyin: 'bàntúérfèi',
  meaning: 'abandonar a mitad de camino',
  audioFilePath: 'sounds/半途而废.mp3',
),
Flashcard(
  hanzi: '扮演',
  pinyin: 'bànyǎn',
  meaning: 'representar',
  audioFilePath: 'sounds/扮演.mp3',
),
Flashcard(
  hanzi: '绑架',
  pinyin: 'bǎngjià',
  meaning: 'secuestrar',
  audioFilePath: 'sounds/绑架.mp3',
),
Flashcard(
  hanzi: '榜样',
  pinyin: 'bǎngyàng',
  meaning: 'modelo',
  audioFilePath: 'sounds/榜样.mp3',
),
Flashcard(
  hanzi: '磅',
  pinyin: 'bàng',
  meaning: 'libra',
  audioFilePath: 'sounds/磅.mp3',
),
Flashcard(
  hanzi: '包庇',
  pinyin: 'bāobì',
  meaning: 'encubrir',
  audioFilePath: 'sounds/包庇.mp3',
)
  ];
  }
  if (widget.level == 'HSK7') {
      return [
Flashcard(
  hanzi: '爱戴',
  pinyin: 'àidài',
  meaning: 'querer y respetar',
  audioFilePath: 'sounds/爱戴.mp3',
),
Flashcard(
  hanzi: '安宁',
  pinyin: 'ānníng',
  meaning: 'paz y tranquilidad',
  audioFilePath: 'sounds/安宁.mp3',
),
Flashcard(
  hanzi: '安详',
  pinyin: 'ānxiáng',
  meaning: 'tranquilo y sereno',
  audioFilePath: 'sounds/安详.mp3',
),
Flashcard(
  hanzi: '安置',
  pinyin: 'ānzhì',
  meaning: 'colocar; organizar',
  audioFilePath: 'sounds/安置.mp3',
),
Flashcard(
  hanzi: '奥秘',
  pinyin: 'àomì',
  meaning: 'misterio',
  audioFilePath: 'sounds/奥秘.mp3',
),
Flashcard(
  hanzi: '把关',
  pinyin: 'bǎguān',
  meaning: 'controlar',
  audioFilePath: 'sounds/把关.mp3',
),
Flashcard(
  hanzi: '把手',
  pinyin: 'bǎshou',
  meaning: 'manija',
  audioFilePath: 'sounds/把手.mp3',
),
Flashcard(
  hanzi: '罢工',
  pinyin: 'bàgōng',
  meaning: 'huelga',
  audioFilePath: 'sounds/罢工.mp3',
),
Flashcard(
  hanzi: '摆脱',
  pinyin: 'bǎituō',
  meaning: 'deshacerse de',
  audioFilePath: 'sounds/摆脱.mp3',
),
Flashcard(
  hanzi: '拜年',
  pinyin: 'bàinián',
  meaning: 'felicitar el año nuevo',
  audioFilePath: 'sounds/拜年.mp3',
),
Flashcard(
  hanzi: '拜托',
  pinyin: 'bàituō',
  meaning: 'encargar',
  audioFilePath: 'sounds/拜托.mp3',
),
Flashcard(
  hanzi: '颁布',
  pinyin: 'bānbù',
  meaning: 'promulgar',
  audioFilePath: 'sounds/颁布.mp3',
),
Flashcard(
  hanzi: '颁发',
  pinyin: 'bānfā',
  meaning: 'otorgar',
  audioFilePath: 'sounds/颁发.mp3',
),
Flashcard(
  hanzi: '伴侣',
  pinyin: 'bànlǚ',
  meaning: 'compañero',
  audioFilePath: 'sounds/伴侣.mp3',
),
Flashcard(
  hanzi: '伴随',
  pinyin: 'bànsuí',
  meaning: 'acompañar',
  audioFilePath: 'sounds/伴随.mp3',
),
Flashcard(
  hanzi: '半途而废',
  pinyin: 'bàntúérfèi',
  meaning: 'abandonar a mitad de camino',
  audioFilePath: 'sounds/半途而废.mp3',
),
Flashcard(
  hanzi: '扮演',
  pinyin: 'bànyǎn',
  meaning: 'representar',
  audioFilePath: 'sounds/扮演.mp3',
),
Flashcard(
  hanzi: '绑架',
  pinyin: 'bǎngjià',
  meaning: 'secuestrar',
  audioFilePath: 'sounds/绑架.mp3',
),
Flashcard(
  hanzi: '榜样',
  pinyin: 'bǎngyàng',
  meaning: 'modelo',
  audioFilePath: 'sounds/榜样.mp3',
),
Flashcard(
  hanzi: '磅',
  pinyin: 'bàng',
  meaning: 'libra',
  audioFilePath: 'sounds/磅.mp3',
),
Flashcard(
  hanzi: '包庇',
  pinyin: 'bāobì',
  meaning: 'encubrir',
  audioFilePath: 'sounds/包庇.mp3',
),
Flashcard(
  hanzi: '包袱',
  pinyin: 'bāofu',
  meaning: 'carga',
  audioFilePath: 'sounds/包袱.mp3',
),
Flashcard(
  hanzi: '薄',
  pinyin: 'báo',
  meaning: 'delgado',
  audioFilePath: 'sounds/薄.mp3',
),
Flashcard(
  hanzi: '保管',
  pinyin: 'bǎoguǎn',
  meaning: 'custodiar',
  audioFilePath: 'sounds/保管.mp3',
),
Flashcard(
  hanzi: '保留',
  pinyin: 'bǎoliú',
  meaning: 'mantener',
  audioFilePath: 'sounds/保留.mp3',
),
Flashcard(
  hanzi: '保密',
  pinyin: 'bǎomì',
  meaning: 'mantener en secreto',
  audioFilePath: 'sounds/保密.mp3',
),
Flashcard(
  hanzi: '保姆',
  pinyin: 'bǎomǔ',
  meaning: 'niñera',
  audioFilePath: 'sounds/保姆.mp3',
),
Flashcard(
  hanzi: '保守',
  pinyin: 'bǎoshǒu',
  meaning: 'conservador',
  audioFilePath: 'sounds/保守.mp3',
),
Flashcard(
  hanzi: '保卫',
  pinyin: 'bǎowèi',
  meaning: 'defender',
  audioFilePath: 'sounds/保卫.mp3',
),
Flashcard(
  hanzi: '保养',
  pinyin: 'bǎoyǎng',
  meaning: 'mantener',
  audioFilePath: 'sounds/保养.mp3',
),
Flashcard(
  hanzi: '保重',
  pinyin: 'bǎozhòng',
  meaning: 'cuidarse',
  audioFilePath: 'sounds/保重.mp3',
)
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

  void _playAudio(String filePath) async {
    await _audioPlayer.play(AssetSource(filePath));
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
      index * 55.0, 
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    setState(() {
      _selectedIndex = index;
      _flashcards[index].showDetails = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.level}',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red.shade50,
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
                    ? Colors.redAccent.shade200
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
                          flashcard.pinyin,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          flashcard.meaning,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        IconButton(
                          icon: Icon(Icons.volume_up, color: Colors.white),
                          onPressed: () => _playAudio(flashcard.audioFilePath),
                      ),
                      ]
                      else ...[                         
                      Text(
                          flashcard.hanzi,
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        IconButton(
                          icon: Icon(Icons.volume_up, color: Colors.white),
                          onPressed: () => _playAudio(flashcard.audioFilePath),
                        ),
                      ]
                    ],
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