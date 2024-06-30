import 'package:flutter/material.dart';

class NhCapitulo7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capítulo 7'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.indigo],
            stops: [0.3, 0.7], // Adjust the stops as needed
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Conjugación de Verbos en Japonés',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              subtitle: Text(
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
                'Practica conjugar estos verbos en todas las formas mencionadas anteriormente. En el próximo capítulo, exploraremos más sobre el uso de verbos en diferentes contextos y cómo combinar oraciones usando partículas y conjugaciones verbales. ¡Sigue practicando y diviértete aprendiendo!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
