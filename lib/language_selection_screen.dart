import 'package:LongLaoshi/home_screen_chinese.dart';
import 'package:LongLaoshi/home_screen_japanese.dart';
import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Escoge un lenguaje!',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 5,
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                Image.asset(
                  'assets/images/language_selection.png',
                  height: 150,
                ),
                SizedBox(height: 40),
                Text(
                  '¡Bienvenido a Longlaoshi!\nAquí te daremos el empujón que necesitas para dominar el Japonés o el Chino',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    shadowColor: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.language, size: 28, color: Colors.white),
                      SizedBox(width: 10),
                      Text('Japonés',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),


                      SizedBox(width: 10),
                      Image.asset(
                        'assets/images/japan_flag.png',
                        height: 45,
                        width: 45,
                      ),
                    ],
                  ),
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
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 26),
                    textStyle: TextStyle(

                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    shadowColor: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.language, size: 28, color: Colors.white),
                      SizedBox(width: 12),
                      Text('Chino',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 12),
                      Image.asset(
                        'assets/images/china_flag.png',
                        height: 28,
                        width: 28,
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
