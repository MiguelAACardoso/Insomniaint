import 'package:flutter/material.dart';

class Benefits extends StatefulWidget {
  const Benefits({super.key});

  @override
  State<Benefits> createState() => _BenefitsState();
}

class _BenefitsState extends State<Benefits> {
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
                        "CBT-I Benefits",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
              
                  Text(
                  "",
                  textAlign: TextAlign.justify,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}