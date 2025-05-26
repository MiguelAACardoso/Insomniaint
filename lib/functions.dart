import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';
import 'package:volume_controller/volume_controller.dart';

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

Future<dynamic> get() async {
  String base_url = 'http://Insomniaint.pythonanywhere.com/vector';

  var url = Uri.parse(base_url);

  var ret = await http.Client().get(url);

  var data = jsonDecode(ret.body);

  print(data);

  return data;
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

  await http.Client().post(url, body: msg);

  //print(ret.body);
}


void get_and_set_volume() async {
  String base_url = 'http://Insomniaint.pythonanywhere.com/sound';

  var url = Uri.parse(base_url);
  var ret = await http.Client().get(url);
  var data = jsonDecode(ret.body);
  print(data);

  //light sleep
  if (data == 0) {
    await VolumeController.instance.setVolume(0.0);
  }

  //deep sleep
  if (data == 1) {
    //await VolumeController.instance.setVolume(0.0);
  }
}
