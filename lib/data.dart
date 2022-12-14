import 'package:clock_app/constants/theme_data.dart';
import 'package:clock_app/enums.dart';
import 'package:clock_app/models/alarm_info.dart';
import 'package:clock_app/models/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: 'Timer', imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'Stopwatch', imageSource: 'assets/stopwatch_icon.png'),
];


List<AlarmInfo> alarms = [
  AlarmInfo(alarmDateTime: DateTime.now().add(Duration(hours: 1)), title: 'Office', gradientColorIndex: 0),
  AlarmInfo(alarmDateTime: DateTime.now().add(Duration(hours: 2)), title: 'Sport', gradientColorIndex: 1),
];

// List<AlarmInfo> alarms = [
//   AlarmInfo(DateTime.now().add(const Duration(hours: 1)),
//       description: 'Office', gradientColors: GradientColors.sky),
//   AlarmInfo(DateTime.now().add(const Duration(hours: 1)),
//       description: 'Sport', gradientColors: GradientColors.sunset),
// ];
