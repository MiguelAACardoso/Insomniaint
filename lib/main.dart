import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insomniaint',
      home: const HomePage(title: 'Home'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6D7DB2),
      appBar: AppBar(backgroundColor: Color(0xFFD3D1E8), title: Text("Home")),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Gráfico
            Container(
              height: 210,
              width: 300,
              decoration: BoxDecoration(color: Color(0xFFD3D1E8)),
              margin: EdgeInsets.only(top: 80, bottom: 120),
              child: Center(child: Text("Gráfico")),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Primeiro botão
                GestureDetector(
                  onTap: () {},

                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 155,
                    width: 135,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3D1E8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),

                //Segundo botão
                GestureDetector(
                  onTap: () {},

                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    height: 155,
                    width: 135,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3D1E8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: () {},
              child: Container(
                width: 300,
                height: 75,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFD3D1E8),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
