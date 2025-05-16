import 'package:flutter/material.dart';

Future<TimeOfDay?> select_time(dynamic context) async {
  TimeOfDay? time = await showTimePicker(
    initialTime: TimeOfDay.now(),
    context: context,
  );

  if (time != null) {
    return time;
  } 
  
  else {
    return null;
  }
}
