import 'package:flutter/material.dart';

class Sleep101 extends StatefulWidget {
  const Sleep101({super.key});

  @override
  State<Sleep101> createState() => _Sleep101State();
}

class _Sleep101State extends State<Sleep101> {
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
              height: 485,
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
                        "Sleep 101",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
              
                  Text(
                  """Sleep is one of our basic daily needs. It is important for reparing cells and tissues that have been damage during the da, and for the maintenance of our metabolism.
                  
                  Sleepiness and tiredness are different things. A person can feel tired and not have the need to sleep, or someone who slept a few hours can feel energetic the next day.
                  
                  Core sleep refers to the minimum amount of sleep necessary to sustain daily functions. It is around 5.5 hours of sleep. Deep sleep is a critical stage of our sleep and is responsible for physical, mental and long-term health.
                  """,
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