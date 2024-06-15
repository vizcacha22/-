import 'package:LongLaoshi/home_screen_chinese.dart';
import 'package:LongLaoshi/home_screen_japanese.dart';
import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escoge un lenguaje!!'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              SizedBox(height: 40),
              Text(
                'Bienvenido a Longlaoshi !\nAquí te daremos el empujón que necesitas para dominar el Japonés o el Chino',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreenJP()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent, // Color de fondo
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Japonés'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreenCN()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Color de fondo
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Chino'),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
