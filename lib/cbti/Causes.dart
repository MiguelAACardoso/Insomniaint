import 'package:flutter/material.dart';

class Causes extends StatefulWidget {
  const Causes({super.key});

  @override
  State<Causes> createState() => _CausesState();
}

class _CausesState extends State<Causes> {
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
              height: 520,
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
                        "Causes of Insomnia",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
              
                  Text(
                  """As mentioned, Insomnia can be caused by different factors, and these can be classified in 3 types:

                  Predisposing factors: Things that existed before the sleep problem began, such as being an anxious person or having a family history of Insomnia.
                  
                  Percipitating factors: This is what triggers the sleep problem. Stressful events or experiences can temporairly disturb our sleep.
                  
                  Perpetuating factors: These are thing that keep speel problems going. A person may become overly focused on sleep, tryning to hard to sleep. This can result in a cycle where they stress for not sleeping and do not sleep because of stress.""",
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