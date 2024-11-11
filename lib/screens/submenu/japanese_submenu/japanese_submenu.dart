import 'package:LongLaoshi/screens/submenu/japanese_submenu/chapters_tiles.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.indigo],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: child,
    );
  }
}

class LearningJapaneseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Japonés'),
        backgroundColor: Colors.indigoAccent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: GradientBackground(
        child: ListView(
          children: [
            Text(
              'Guía para ser un autodidacta en el Japonés',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 16),
            ChapterTile(
              title: 'Capítulo 1',
              subtitle: '1. Dedicación y esfuerzo',
              text:
                  '¡Hola! Hoy quiero hablarte sobre una forma interesante de aprender un idioma, especialmente uno con un sistema de escritura completamente diferente al nuestro, como es el japonés. Nuestro equipo ha desarrollado un método que creemos que es el más efectivo para dominar un nuevo idioma. Aprender japonés requiere tiempo, disciplina y constancia, pero con el enfoque correcto, el éxito está al alcance de tu mano.\n\nPrimero, es importante entender que dominar el japonés no sucederá de la noche a la mañana. Este proceso exige dedicación y esfuerzo constante. Sin embargo, si estás comprometido y dispuesto a mantener una rutina de aprendizaje, te propongo un método simple pero poderoso.\n\nLa clave está en la regularidad y la consistencia. Te recomiendo programar sesiones cortas de estudio, de entre 30 minutos y 1 hora, todos los días. Aunque puedas sentirte motivado para empezar con maratones de estudio de 4 horas, no es lo más efectivo. Nuestro objetivo es convertir el aprendizaje en un hábito diario, de manera que incluso en los días en los que te sientas menos motivado, sigas adelante con tu estudio.\n\nEste es un camino largo, y te tomará tiempo llegar a leer, escribir, escuchar y hablar japonés con fluidez. Sin embargo, cada pequeño paso te acercará a tu meta. Recuerda que cada esfuerzo que hagas será recompensado, y cada sesión de estudio te llevará un paso más cerca de dominar este fascinante idioma.\n\nAsí que, ¿estás listo para empezar este emocionante viaje? Con perseverancia y dedicación, aprender japonés puede ser una experiencia increíblemente gratificante. ¡Vamos juntos en esta aventura!',
            ),
            ChapterTile(
              title: 'Capítulo 2',
              subtitle: '2. La escritura japonesa',
              text:
                  'El primer paso para aprender japonés es familiarizarte con su escritura, que se compone de tres sistemas: Hiragana, Katakana y Kanji.\n\nPara comenzar, aprenderás estos sistemas de escritura a través del romaji, la transcripción de los caracteres japoneses usando el alfabeto romano. Por ejemplo, "arigatou" es el romaji de "ありがとう", que está escrito en hiragana y significa "gracias".\n\n¿Por qué tantas formas de escribir japonés?\nCada sistema de escritura tiene su propio propósito y uso en el idioma japonés. Aquí te explico brevemente cómo se utiliza cada uno:\n\nHiragana\nEste silabario se utiliza principalmente para palabras de origen japonés. Ya has visto un ejemplo con "ありがとう".\n\nKatakana\nEste silabario se emplea para escribir palabras extranjeras que se han incorporado al japonés. Algunos ejemplos son:\n\n"パン" (pan), que significa "pan".\n\n"テーブル" (teeburu), que significa "mesa" y proviene de la palabra inglesa "table".\n\nKanji\nLos kanjis son caracteres chinos adoptados por los japoneses para "simplificar" la escritura. Aunque puede parecer contradictorio, los kanjis facilitan la lectura al permitir que los lectores identifiquen palabras en un texto, ya que en japonés no hay espacios entre las palabras. Por ejemplo:\n\n"あしたはあめがふるだろう" es más difícil de leer que...\n"明日は雨が降るだろう", donde los kanjis ayudan a diferenciar las palabras. Este ejemplo se lee "ashita wa ame ga furudarou" y significa "mañana lloverá".\n\nAprenderás los kanjis junto con el vocabulario, ya que el significado de un kanji puede variar según el hiragana que lo acompañe. Aprender palabras completas te ayudará no solo a leer kanjis, sino también a acelerar tu proceso de aprendizaje del idioma.\n\nSobre nuestras herramientas:\nEn nuestra plataforma, encontrarás recursos para aprender los silabarios Hiragana y Katakana. Te recomiendo dedicar aproximadamente dos semanas, o el tiempo que necesites, para aprenderlos a fondo, tanto en lectura como en escritura. Si bien la práctica de la escritura la dejo a tu curiosidad y espíritu investigador, es esencial que te sientas cómodo con estos silabarios, ya que los verás frecuentemente.\n\nDeslizando un poco más a la derecha, encontrarás la sección de vocabulario. Para hacer el aprendizaje más entretenido, hemos creado un test donde puedes practicar la escritura de palabras reales usando los silabarios. Si aciertas, verás cómo se escribe en kanji y su significado.\n\nSin más que agregar, te deseo mucha diversión en este emocionante viaje de aprender japonés. ¡Ánimo y disfruta del proceso!',
            ),
            ChapterTile(
              title: 'Capítulo 3',
              subtitle: '3. Un poquito de palabras',
              text:
                  '¡Ahora empieza lo emocionante! Suponiendo que ya puedes leer hiragana y katakana (y con un poco de suerte, también escribirlos), podemos avanzar a aprender reglas gramaticales y vocabulario. '
                  'Es recomendable estudiar ambos simultáneamente y, si tienes tiempo, sumergirte en el idioma consumiendo medios en japonés. En YouTube, puedes encontrar varios canales interesantes buscando "input comprensible japonés".\n\n'
                  'En la sección de vocabulario, hemos clasificado todo en niveles, desde el más básico "N5" hasta el más difícil "N1".',
            ),
            ChapterTile(
                title: 'Capítulo 4',
                subtitle: '4. Introducción a la Gramática Básica',
                text:
                    'En este capítulo, vamos a comenzar con las bases de la gramática japonesa. Aprenderemos a formar oraciones simples, la estructura básica de las frases y cómo utilizar partículas esenciales. Estos conceptos son fundamentales para construir una base sólida en tu aprendizaje del japonés.\n\n'
                    'Primero, hablemos de la estructura básica de una oración en japonés. A diferencia del español, la estructura típica de una oración en japonés es Sujeto + Objeto + Verbo. Por ejemplo:\n\n'
                    '    私はりんごを食べます。\n'
                    '    (Watashi wa ringo o tabemasu)\n'
                    '    Yo como una manzana.\n\n'
                    'Observa que el verbo "tabemasu" (comer) viene al final de la oración. Además, las partículas "wa" y "o" son cruciales para entender la función de cada palabra en la oración. "Wa" marca el tema de la oración, mientras que "o" indica el objeto directo.\n\n'
                    'Pasemos a algunas partículas esenciales:\n\n'
                    '    - は (wa): Marca el tema de la oración.\n'
                    '    - を (o): Marca el objeto directo.\n'
                    '    - に (ni): Indica destino o dirección.\n'
                    '    - で (de): Indica el lugar donde ocurre una acción.\n\n'
                    'Ejemplos:\n\n'
                    '    学校に行きます。\n'
                    '    (Gakkou ni ikimasu)\n'
                    '    Voy a la escuela.\n\n'
                    '    レストランで食べます。\n'
                    '    (Resutoran de tabemasu)\n'
                    '    Como en el restaurante.\n\n'
                    'Recuerda, practicar es clave. Intenta crear tus propias oraciones usando estas estructuras y partículas. Con el tiempo, te sentirás más cómodo y tu comprensión mejorará.\n\n'
                    'En el próximo capítulo, profundizaremos más en verbos y sus conjugaciones. ¡Sigue adelante y diviértete aprendiendo!'),
            ChapterTile(
                title: 'Capítulo 5',
                subtitle: '5. Conjugación de Verbos Básicos',
                text:
                    'En este capítulo, vamos a explorar la conjugación de verbos básicos en japonés. Aprenderemos las formas más comunes y cómo usarlas en oraciones. Los verbos son una parte esencial del idioma y entender sus conjugaciones te ayudará a comunicarte de manera más efectiva.\n\n'
                    'Primero, hablemos de las tres formas verbales básicas que necesitas conocer:\n\n'
                    '    1. Forma Masu (ます形): Esta es la forma cortés y se utiliza en situaciones formales.\n'
                    '    2. Forma Diccionario (辞書形): Esta es la forma de diccionario o forma base del verbo.\n'
                    '    3. Forma Te (て形): Esta forma se utiliza para conectar oraciones y formar comandos o peticiones.\n\n'
                    'Ejemplos de Conjugación\n\n'
                    '    - Verbo: 食べる (taberu) - Comer\n\n'
                    '        - Forma Masu: 食べます (tabemasu)\n'
                    '        - Forma Diccionario: 食べる (taberu)\n'
                    '        - Forma Te: 食べて (tabete)\n\n'
                    '    - Verbo: 行く (iku) - Ir\n\n'
                    '        - Forma Masu: 行きます (ikimasu)\n'
                    '        - Forma Diccionario: 行く (iku)\n'
                    '        - Forma Te: 行って (itte)\n\n'
                    'Usando las Formas Verbales en Oraciones\n\n'
                    '    - Forma Masu: 私はパンを食べます。\n'
                    '      (Watashi wa pan o tabemasu) - Yo como pan.\n\n'
                    '    - Forma Diccionario: 明日、友達と映画を見に行く。\n'
                    '      (Ashita, tomodachi to eiga o mi ni iku) - Mañana voy a ver una película con un amigo.\n\n'
                    '    - Forma Te: ここで待ってください。\n'
                    '      (Koko de matte kudasai) - Por favor, espera aquí.\n\n'
                    'Recuerda, practicar las conjugaciones es clave para dominar el uso de los verbos. Intenta crear tus propias oraciones usando estas formas verbales y sigue practicando diariamente.\n\n'),
            ChapterTile(
                title: 'Capítulo 6',
                subtitle: '6. Uso de Partículas en Japonés',
                text:
                    'Las partículas son elementos esenciales en el japonés que nos permiten indicar las relaciones entre palabras en una oración. En este capítulo, aprenderemos algunas de las partículas más comunes y su uso.\n\n'
                    'Partículas Principales\n\n'
                    '1. Partícula は (wa)\n'
                    '   - Indica el tema de la oración.\n'
                    '   - Ejemplo: 私は学生です。\n'
                    '     (Watashi wa gakusei desu) - Yo soy estudiante.\n\n'
                    '2. Partícula が (ga)\n'
                    '   - Indica el sujeto de la oración.\n'
                    '   - Ejemplo: 猫が好きです。\n'
                    '     (Neko ga suki desu) - Me gustan los gatos.\n\n'
                    '3. Partícula を (wo/o)\n'
                    '   - Indica el objeto directo de la acción.\n'
                    '   - Ejemplo: パンを食べます。\n'
                    '     (Pan o tabemasu) - Como pan.\n\n'
                    '4. Partícula に (ni)\n'
                    '   - Indica dirección, lugar, tiempo, o propósito.\n'
                    '   - Ejemplo: 学校に行きます。\n'
                    '     (Gakkou ni ikimasu) - Voy a la escuela.\n\n'
                    '5. Partícula で (de)\n'
                    '   - Indica el lugar donde se realiza una acción o el medio por el cual se hace algo.\n'
                    '   - Ejemplo: バスで行きます。\n'
                    '     (Basu de ikimasu) - Voy en autobús.\n\n'
                    'Ejemplos en Oraciones\n\n'
                    '    - 私は毎日図書館で勉強します。\n'
                    '      (Watashi wa mainichi toshokan de benkyou shimasu) - Estudio en la biblioteca todos los días.\n\n'
                    '    - 友達が映画を見ます。\n'
                    '      (Tomodachi ga eiga o mimasu) - Mi amigo ve una película.\n\n'
                    '    - 彼は明日東京に行きます。\n'
                    '      (Kare wa ashita Toukyou ni ikimasu) - Él va a Tokio mañana.\n\n'
                    'Práctica de Partículas\n\n'
                    'Intenta formar oraciones usando estas partículas para describir tus actividades diarias. Practicar su uso en contextos variados te ayudará a familiarizarte con ellas y a mejorar tu fluidez.\n\n'),
            ChapterTile(
                title: 'Capítulo 7',
                subtitle: '7. Conjugación de Verbos en Japonés',
                text:
                    'En este capítulo, nos centraremos en los verbos y sus conjugaciones. Los verbos son esenciales en cualquier idioma, y el japonés no es una excepción. A continuación, te explicaremos cómo funcionan los verbos en japonés y te mostraremos algunas de las conjugaciones más importantes.\n\n'
                    'Tipos de Verbos\n\n'
                    '1. Verbos del Grupo 1 (五段動詞 / Godan Doushi)\n'
                    '   - También conocidos como verbos de clase 1 o u-verbs.\n'
                    '   - Ejemplo: 話す (hanasu) - hablar.\n\n'
                    '2. Verbos del Grupo 2 (一段動詞 / Ichidan Doushi)\n'
                    '   - También conocidos como verbos de clase 2 o ru-verbs.\n'
                    '   - Ejemplo: 食べる (taberu) - comer.\n\n'
                    '3. Verbos Irregulares\n'
                    '   - Hay pocos verbos irregulares en japonés, siendo los más comunes する (suru) - hacer y 来る (kuru) - venir.\n\n'
                    'Conjugaciones Básicas\n\n'
                    'Presente/Futuro Afirmativo\n'
                    '   - Grupo 1: ます形 (masu-kei) - Forma polite\n'
                    '   - Ejemplo: 話す -> 話します (hanasu -> hanashimasu)\n\n'
                    '   - Grupo 2: ます形 (masu-kei) - Forma polite\n'
                    '   - Ejemplo: 食べる -> 食べます (taberu -> tabemasu)\n\n'
                    '   - Irregular: します (shimasu) / 来ます (kimasu)\n\n'
                    'Presente/Futuro Negativo\n'
                    '   - Grupo 1: ません形 (masen-kei) - Forma polite negativa\n'
                    '   - Ejemplo: 話す -> 話しません (hanasu -> hanashimasen)\n\n'
                    '   - Grupo 2: ません形 (masen-kei) - Forma polite negativa\n'
                    '   - Ejemplo: 食べる -> 食べません (taberu -> tabemasen)\n\n'
                    '   - Irregular: しません (shimasen) / 来ません (kimasen)\n\n'
                    'Pasado Afirmativo\n'
                    '   - Grupo 1: ました形 (mashita-kei) - Forma polite pasada\n'
                    '   - Ejemplo: 話す -> 話しました (hanasu -> hanashimashita)\n\n'
                    '   - Grupo 2: ました形 (mashita-kei) - Forma polite pasada\n'
                    '   - Ejemplo: 食べる -> 食べました (taberu -> tabemashita)\n\n'
                    '   - Irregular: しました (shimashita) / 来ました (kimashita)\n\n'
                    'Pasado Negativo\n'
                    '   - Grupo 1: ませんでした形 (masen deshita-kei) - Forma polite pasada negativa\n'
                    '   - Ejemplo: 話す -> 話しませんでした (hanasu -> hanashimasen deshita)\n\n'
                    '   - Grupo 2: ませんでした形 (masen deshita-kei) - Forma polite pasada negativa\n'
                    '   - Ejemplo: 食べる -> 食べませんでした (taberu -> tabemasen deshita)\n\n'
                    '   - Irregular: しませんでした (shimasen deshita) / 来ませんでした (kimasen deshita)\n\n'
                    'Ejemplos y Práctica\n\n'
                    'Intenta conjugar los siguientes verbos en las formas presentadas:\n'
                    '   - 見る (miru) - ver.\n'
                    '   - 書く (kaku) - escribir.\n'
                    '   - 飲む (nomu) - beber.\n\n'
                    'Practica conjugar estos verbos en todas las formas mencionadas anteriormente. En el próximo capítulo, exploraremos más sobre el uso de verbos en diferentes contextos y cómo combinar oraciones usando partículas y conjugaciones verbales. ¡Sigue practicando y diviértete aprendiendo!')
          ],
        ),
      ),
    );
  }
}
