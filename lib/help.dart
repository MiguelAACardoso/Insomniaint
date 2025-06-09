import 'package:flutter/material.dart';

class Help_Page extends StatefulWidget {
  const Help_Page({super.key});

  @override
  State<Help_Page> createState() => _Help_PageState();
}

class _Help_PageState extends State<Help_Page> {
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
                      height: 465,
                      margin: EdgeInsets.only(top: 30, bottom: 30),
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
                                "How to use the app?",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                      
                          Text(
                          """Welcome to the Insomniaint mobile app! Here you can not only manage and personaliza your Insomniaint ecosystem, but learn more about CBT-I, sleep and sleep disorders.
            
                          In our home page, there are 3 things that you can do. Write in your sleep diary, learn a little bit more, and set your wake and bed time.
            
                          When setting your bed time, make sure to alse set your wake time, and vice-versa. Our lamp will prepare you for sleep 15 before the selected time, and try to wake you, in a natural way, in a time close to the one you set up.
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