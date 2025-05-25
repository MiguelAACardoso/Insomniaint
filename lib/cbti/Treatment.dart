import 'package:flutter/material.dart';

class Treatment extends StatefulWidget {
  const Treatment({super.key});

  @override
  State<Treatment> createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
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
              height: 400,
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
                        "Treatment",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
              
                  Text(
                  """Insomnia is treated with talk therapy or medication, or a combination of both. The most effective treatment for Insomnia is Cognitive Behavioral Therapy for Insomnia (CBTi). 
                  
                  This treatment focuses on retraining your body to sleep better through changing sleep related behaviors and thoughts. 
                  
                  If you suffer from Insomnia, please seek help from a medical professional trained in dealing with sleep problems.""",
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