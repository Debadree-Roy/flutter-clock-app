import 'package:flutter/material.dart';

class AlarmInfo
{
  DateTime alarmDateTime;
  String desc;
  bool isActive=false;
  List<Color> gradientColors;

  AlarmInfo(this.alarmDateTime,{required this.desc, required this.gradientColors});


}
