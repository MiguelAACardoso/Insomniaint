import 'package:example/cbt-i_benefits.dart';
import 'package:example/sleep_101.dart';
import 'package:example/what_is_insomnia.dart';
import 'package:flutter/material.dart';

class Home_cbti extends StatefulWidget {
  const Home_cbti({super.key});

  @override
  State<Home_cbti> createState() => _Home_cbtiState();
}

class _Home_cbtiState extends State<Home_cbti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6D7DB2),
      appBar: AppBar(backgroundColor: Color(0xFF6D7DB2)),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Container(
              width: 300,
              height: 270,
              margin: EdgeInsets.only(bottom: 30, top: 30),
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFD3D1E8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "What is CBT-I?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  Text(
                    '''CBT-i - Cognitive Behavioral Therapy for Insomnia - is a non-medication treatment of insomnia that is based on scientific knowledge about sleep.\n 
                  The goals of CBT-i are to help you fall asleep, stay asleep, and improve your daytime functioning as a result of better sleep at night.''',
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            //Botao 1
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Insomnia())
                );

              },
              child: Container(
                width: 300,
                height: 75,
                padding: EdgeInsets.only(left: 30, right: 30),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFD3D1E8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "What is Insomnia?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Icon(Icons.search_outlined, size: 40),
                  ],
                ),
              ),
            ),

            //Botao 2
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sleep101())
                );
              },

              //Aparência do botão
              child: Container(
                width: 300,
                height: 75,
                padding: EdgeInsets.only(left: 30, right: 30),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFD3D1E8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sleep 101",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Icon(Icons.bed_outlined, size: 40),
                  ],
                ),
              ),
            ),

            //Botao 3
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Benefits())
                );

              },
              child: Container(
                width: 300,
                height: 75,
                padding: EdgeInsets.only(left: 30, right: 30),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFD3D1E8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "CBT-I Benefits",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Icon(Icons.star_border, size: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
