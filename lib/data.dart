import 'package:clockapp/alarm_info.dart';
import 'package:clockapp/theme_data.dart';

List<AlarmInfo>  alarms=[
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),desc: 'Class',gradientColors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)),desc: 'Sport',gradientColors: GradientColors.sunset),
];