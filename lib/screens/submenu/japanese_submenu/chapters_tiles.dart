import 'package:LongLaoshi/screens/submenu/japanese_submenu/chapters_interface.dart';
import 'package:flutter/material.dart';

// A reusable widget for each chapter tile.
class ChapterTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String text;

  const ChapterTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.book, color: Colors.white),
      title: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChapterTemplate(
                title: title,
                subtitle: subtitle,
                text: text,
              ),
            ),
          );
        },
        child: Text(subtitle, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
