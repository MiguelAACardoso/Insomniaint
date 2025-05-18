import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';

Future<TimeOfDay?> select_time(dynamic context) async {
  TimeOfDay? time = await showTimePicker(
    initialTime: TimeOfDay.now(),
    context: context,
  );

  if (time != null) {
    return time;
  } else {
    return null;
  }
}

Future<dynamic> send() async {
  String base_url = 'http://Insomniaint.pythonanywhere.com/sent';

  var url = Uri.parse(base_url);

  var ret = await http.Client().post(url);

  var resposta = jsonDecode(ret.body);
  print("asdfsgdhfjgkhlj");
  var x = base64Decode(resposta['imagem']);

  return x;
}

List<FlSpot> gera_lista_pontos(List<dynamic> xpoints, List<dynamic> ypoints) {
  final List<FlSpot> ret_vec = [];

  for (int i = 0; i < ypoints.length - 1; i++) {
    ret_vec.add(FlSpot(i.toDouble(), ypoints[i]));
    ret_vec.add(FlSpot((i + 1).toDouble(), ypoints[i]));
  }

  ret_vec.add(FlSpot(ypoints.length - 1.toDouble(), ypoints.last));

  return ret_vec;
}
