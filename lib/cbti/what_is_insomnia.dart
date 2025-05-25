import 'package:example/cbti/Causes.dart';
import 'package:example/cbti/Treatment.dart';
import 'package:flutter/material.dart';

class Insomnia extends StatefulWidget {
  const Insomnia({super.key});

  @override
  State<Insomnia> createState() => _InsomniaState();
}

class _InsomniaState extends State<Insomnia> {
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
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Color(0xFFD3D1E8),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        "What is Insomnia?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
              
                  Text(
                  """Insomnia is a sleep disorder that can be caused by multiple factors and manifest in different ways. 

                  There are 3 main groups of symptoms: Difficulty falling asleep, difficulty staying asleep, and being unable to fall asleep once you wake up.
                  """,
                  textAlign: TextAlign.justify,),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Causes())
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
                      "Causes",
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
                  MaterialPageRoute(builder: (context) => Treatment())
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
                      "Treatment",
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
          ],
        ),
      ),
    );
  }
}