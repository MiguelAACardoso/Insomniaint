import 'dart:async';

import 'package:example/cbti/cbti_home.dart';
import 'package:example/functions.dart';
import 'package:example/graph.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var compare = [0,0,0];
  TimeOfDay? wake_time;
  TimeOfDay? sleep_time;


  //Guarda os valores da noite passada
  List<double> ylist0 = [1, 2, 3, 2, 3, 1, 1, 3, 3, 1, 3, 2];
  List<double> xlist0 = [22, 23, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  //Guarda os valores da noite de anteontem
  List<double> ylist1 = [3, 2, 1, 2, 3, 2, 3, 3, 1, 1, 1, 2];
  List<double> xlist1 = [22, 23, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  //Guarda os valores da noite de há 3 dias atrás
  List<double> ylist2 = [2, 2, 1, 2, 3, 1, 3, 2, 1, 1, 2, 2];
  List<double> xlist2 = [22, 23, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  //vetores para o gráfico que está a ser mostrado
  List<double> ylist_atual = [];
  List<double> xlist_atual = [];

  //Inicializa os vetores com os valores da sessão passada
  @override
  void initState() {
    super.initState();
    _loadVector();
    control_volume();
  }

  //vai buscar os valores da outra sessão
  Future<void> _loadVector() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      ylist0 =
          (prefs.getStringList('ylist0') ??
                  ['1', '2', '3', '2', '3', '1', '1', '3', '3', '1', '3', '2'])
              .map((e) => double.parse(e))
              .toList();
      xlist0 =
          (prefs.getStringList('xlist0') ?? ['0', '0', '0', '0', '0', '0', '0'])
              .map((e) => double.parse(e))
              .toList();

      ylist1 =
          (prefs.getStringList('ylist1') ??
                  ['3', '2', '1', '2', '3', '2', '3', '3', '1', '1', '1', '2'])
              .map((e) => double.parse(e))
              .toList();
      xlist1 =
          (prefs.getStringList('xlist1') ?? ['0', '0', '0', '0', '0', '0', '0'])
              .map((e) => double.parse(e))
              .toList();
      ylist2 =
          (prefs.getStringList('ylist2') ??
                  ['2', '2', '1', '2', '3', '1', '3', '2', '1', '1', '2', '2'])
              .map((e) => double.parse(e))
              .toList();
      xlist2 =
          (prefs.getStringList('xlist2') ?? ['0', '0', '0', '0', '0', '0', '0'])
              .map((e) => double.parse(e))
              .toList();
    });
  }

  //guarda os valores para futuras sessões
  Future<void> _editVector() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setStringList('ylist0', ylist0.map((e) => e.toString()).toList());
      prefs.setStringList('xlist0', xlist0.map((e) => e.toString()).toList());
      prefs.setStringList('ylist1', ylist1.map((e) => e.toString()).toList());
      prefs.setStringList('xlist1', xlist1.map((e) => e.toString()).toList());
      prefs.setStringList('ylist2', ylist2.map((e) => e.toString()).toList());
      prefs.setStringList('xlist2', xlist2.map((e) => e.toString()).toList());
    });
  }

  void control_volume() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      get_and_set_volume();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6D7DB2),

      //App bar: Contém o botão que dá refresh aos dados gráfico. Só os atualiza se forem diferentes
      appBar: AppBar(
        backgroundColor: Color(0xFF6D7DB2),
        actionsPadding: EdgeInsets.only(right: 15),

        actions: [
          //botão
          IconButton(
            onPressed: () async {
              //função de refresh
              var tmp = await get();

              //atualiza os dados
              setState(() {
                //sempre que se vai buscar os dados ao server, ele é modificado para  devolevr [0,0,0,]
                //se não houver dados novos
                //só substitui os dados se existirem dados novos no server
                if (!listEquals(compare, tmp)) {
                  ylist2 = ylist1;
                  ylist1 = ylist0;
                  print(tmp);
                  ylist0 =
                      (tmp as List).map((e) => (e as num).toDouble()).toList();
                  ylist_atual = ylist0;
                }
                //ylist_atual = tmp;
              });

              //guarda os dados entre sessões
              _editVector();
            },

            icon: Icon(Icons.refresh),
          ),
        ],
      ),

      //coluna que contém o gráfico e os botões
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Gráfico
          Container(
            height: 250,
            width: 300,
            padding: EdgeInsets.only(top: 16, left: 10, right: 30),
            decoration: BoxDecoration(color: Color(0xFFD3D1E8)),
            margin: EdgeInsets.only(top: 50, bottom: 80),

            //Gráfico está dentro de um Gesture Detector para que se possa carregar nele e selecionar os outros
            child: GestureDetector(
              //O que faz quando se carrega nele
              onTap: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        alignment: Alignment.lerp(
                          Alignment.center,
                          Alignment.bottomCenter,
                          0.1,
                        ),

                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //selecionar gráfico de há 3 noites
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  ylist_atual = ylist2;
                                  xlist_atual = xlist2;
                                });
                              },
                              child: Text(
                                "3 Nights\n Ago",
                                textAlign: TextAlign.center,
                              ),
                            ),

                            //selecionar gráfico de há 3 noites
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  ylist_atual = ylist1;
                                  xlist_atual = xlist1;
                                });
                              },
                              child: Text(
                                "2 Nights\n Ago",
                                textAlign: TextAlign.center,
                              ),
                            ),

                            //selecionar gráfico de há 3 noites
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  ylist_atual = ylist0;
                                  xlist_atual = xlist0;
                                });
                              },
                              child: Text(
                                "Last\n Night",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),

                        backgroundColor: Color(0xFFD3D1E8),
                      ),
                );
              },

              child: Container(
                //gráfico
                child:
                    ylist_atual.length == 0
                        ? Graph(xlist: xlist0, ylist: ylist0)
                        : Graph(xlist: xlist_atual, ylist: ylist_atual),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Primeiro botão
              GestureDetector(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(

                      alignment: Alignment.center,

                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [

                        //botao de wake time
                        TextButton(
                              onPressed: () async {
                              //seleciona o tempo de acordar
                                var a = await select_time(context);

                                //atualiza a variável que guarda as horas
                                setState(() {
                                  wake_time = a;
                                  if (wake_time != null) {
                                    post_wake_time(wake_time!);
                                  }
                                });
                              
                              },
                              child: Text(
                                "Wake up time",
                                textAlign: TextAlign.center,
                              ),
                            ),

                            //botao de sleep time
                            TextButton(
                             onPressed: () async {
                              //seleciona o tempo de acordar
                                var b = await select_time(context);

                                //atualiza a variável que guarda as horas
                                setState(() {
                                  sleep_time = b;
                                  if (sleep_time != null) {
                                    post_sleep_time(sleep_time!);
                                  }
                                });
                              
                              },
                              child: Text(
                                "Sleep time",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]
                      ),

                    ),
                  );
                  
                },

                //aparência do botão
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
                  //viaja para a próxima página
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home_cbti()),
                  );
                },

                //Aparência do botão
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

          //Terceiro Botão
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
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
                    "Sleep Diary",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Icon(Icons.dark_mode_outlined, size: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
