import 'package:example/cbti_home.dart';
import 'package:example/functions.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TimeOfDay? time;

    List<double> ylist = [1, 2, 3, 4, 3, 2, 4];
    List<double> xlist = [22, 23, 0, 1, 2, 3, 4];

    return Scaffold(
      backgroundColor: Color(0xFF6D7DB2),
      appBar: AppBar(
        backgroundColor: Color(0xFF6D7DB2),
        //botão da appbar para dar refresh do gráfico
        actionsPadding: EdgeInsets.only(right: 15),
        actions: [
          IconButton(onPressed: () async {}, icon: Icon(Icons.refresh)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Gráfico
            Container(
              height: 250,
              width: 300,
              padding: EdgeInsets.only(top: 16, left: 10, right: 30),
              decoration: BoxDecoration(color: Color(0xFFD3D1E8)),
              margin: EdgeInsets.only(top: 80, bottom: 80),
              child: Container(
                child: LineChart(

                  LineChartData(

                    maxY: 5,
                    titlesData: FlTitlesData(

                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          interval: 1,
                          reservedSize: 35,
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            return switch (value) {

                              1 => Text("N3"),
                              2 => Text("N3"),
                              3 => Text("N1"),
                              4 => Text("REM"),

                              _ => Text(""),
                            };
                          },
                        ),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        dotData: FlDotData(show: false),
                        spots: gera_lista_pontos(xlist, ylist),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Primeiro botão
                GestureDetector(
                  onTap: () async {
                    var a = await select_time(context);

                    setState(() {
                      time = a;
                      print(time!.hour);
                      print(time!.minute);
                    });
                  },

                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 155,
                    width: 135,
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFD3D1E8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Set",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Alarm",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Container(height: 20),
                        Icon(Icons.alarm_outlined, size: 40),
                      ],
                    ),
                  ),
                ),

                //Segundo botão
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home_cbti()),
                    );
                  },

                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    height: 155,
                    width: 135,
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFD3D1E8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Learn",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "CBT-I",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Container(height: 20),
                        Icon(Icons.book_outlined, size: 40),
                      ],
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
                      "Sleep Diary",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Icon(Icons.dark_mode_outlined, size: 40),
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
