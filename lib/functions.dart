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
  String base_url = 'http://Insomniaint.pythonanywhere.com/get';

  var url = Uri.parse(base_url);

  var msg = jsonEncode("off");
  var ret = await http.Client().post(url, body: msg);

  /*var resposta = jsonDecode(ret.body);
  print("asdfsgdhfjgkhlj");
  var x = base64Decode(resposta['imagem']);*/

  //print(ret.body);
  return ret;
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

Future<dynamic> post_time(TimeOfDay time) async {
  String base_url = 'http://Insomniaint.pythonanywhere.com/post_time';

  var url = Uri.parse(base_url);

  var msg = jsonEncode("${time.hour} ${time.minute}");

  var ret = await http.Client().post(url, body: msg);

  //print(ret.body);
}

//já não deve ser preciso mas vou deixar aqui just in case
void Check_timer(mod, TimeOfDay time) async {
  //tempo atual
  TimeOfDay tempo_atual = TimeOfDay.now();

  //se já se tiver selecionado um valor
  if (mod == 0) {
    return;
  }

  if (mod == 1) {
    if (time.hour <= tempo_atual.hour) {
      int tmp = time.minute - tempo_atual.minute;

      if (tmp <= 30) {
        String base_url = 'http://Insomniaint.pythonanywhere.com/get';

        var url = Uri.parse(base_url);

        var msg = jsonEncode("off");
        var ret = await http.Client().post(url, body: msg);

        print(ret);
      }
    }
  }
}
