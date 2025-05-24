import 'package:example/functions.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class Graph extends StatefulWidget {
  final List<double> ylist;
  final List<double> xlist;

  const Graph({
    super.key, 
    required this.xlist,
    required this.ylist
  });

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(
                      enabled: false
                    ),
                    maxY: 4,
                    minY: 0,
                    titlesData: FlTitlesData(

                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40
                        ) 
                      ),

                      topTitles: AxisTitles(
                        //não mostrar títulos
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                          reservedSize: 45
                          ),
                      ),
                      leftTitles: AxisTitles(
                        //define o eixo da esquerda
                        sideTitles: SideTitles(
                          interval: 1,
                          reservedSize: 45,
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            return switch (value) {
                              1 => Text("Deep sleep"),
                              2 => Text("Light sleep"),
                              3 => Text("Wake"),

                              _ => Text(""),
                            };
                          },
                        ),
                      ),
                    ),
                    //dados do gráfico
                    lineBarsData: [
                      LineChartBarData(
                        dotData: FlDotData(show: false),
                        //gera os pontos do gráfico a partir de uma função, é necessário duplicar os pontos para
                        //o gráfico ser retângulos
                        spots: gera_lista_pontos(widget.xlist, widget.ylist),
                      ),
                    ],
                  ),
                );
  }
}
