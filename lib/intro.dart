import 'package:example/home.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD3D1E8),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround
          ,
          children: [

            Container(
              width: 300,
              height: 300,
              child: Image(image: AssetImage("assets/logo.png"))
            ),



            MaterialButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
              },
            
              child: Container(
                margin: EdgeInsets.only(bottom: 200, top: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFFD3D1E8)
                ),
                width: 300,
                height: 100,
                child: Center(
                  child: Text(
                    "Start",
                    style: TextStyle(
                      color: Color(0xFF6A779E),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
