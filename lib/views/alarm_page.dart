import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../constants/theme_data.dart';
import '../data.dart';
import 'package:timezone/timezone.dart' as tz;

import '../notification_api.dart';

// tz.initializeTimeZones();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Alarm',
            style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 24),
          ),
          Expanded(
            child: ListView(
              children: alarms.map<Widget>((alarm) {
                return Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: alarm.gradientColors!,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  alarm.gradientColors!.last.withOpacity(0.4),
                              blurRadius: 8,
                              spreadRadius: 4,
                              offset: const Offset(4, 4))
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.label,
                                      color: Colors.white, size: 24),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Office',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'avenir'),
                                  ),
                                ],
                              ),
                              Switch(
                                value: true,
                                onChanged: (bool value) {},
                                activeColor: Colors.white,
                              )
                            ],
                          ),
                          const Text(
                            'Mon-Fri',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'avenir'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '07:00 AM',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    fontFamily: 'avenir'),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 36,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ));
              }).followedBy([
                DottedBorder(
                  strokeWidth: 3,
                  color: CustomColors.clockOutline,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(24),
                  dashPattern: const [5, 4],
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: CustomColors.clockBG,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24))),
                    height: 100,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 7),
                      ),
                      onPressed: () {
                        NotificationApi.showNotification(
                            title: 'Aso Orji',
                            body:
                                'Keep showing up, you\'ll be a great Software Engineer someday',
                            payload: 'aso.orji');
                        // scheduleAlarm();
                      },
                      child: Column(children: [
                        Image.asset(
                          'assets/add_alarm.png',
                          scale: 1.5,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Add Alarm',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'avenir'),
                        )
                      ]),
                    ),
                  ),
                )
              ]).toList(),
            ),
          )
        ],
      ),
    );
  }

  // void scheduleAlarm() async {
  //   var scheduledNotificationDateTime =
  //       DateTime.now().add(Duration(seconds: 10));
  //   var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
  //     'alarm_notif',
  //     'alarm_notif',
  //     channelDescription: 'Channel for Alarm notification',
  //     icon: 'codex_logo',
  //     sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
  //     largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
  //   );

  //   var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
  //     sound: 'a_long_cold_sting.wav',
  //     presentAlert: true,
  //     presentBadge: true,
  //     presentSound: true,
  //   );
  //   var platformChannelSpecifics = NotificationDetails(
  //     android: androidPlatformChannelSpecifics,
  //     iOS: iOSPlatformChannelSpecifics,
  //   );
  //   // await FlutterLocalNotificationsPlugin.zonedSchedule(
  //   //     0,
  //   //     'Office',
  //   //     'Good morning! Time for office.',
  //   //     scheduledNotificationDateTime,
  //   //     platformChannelSpecifics);

  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //       0,
  //       'Office',
  //       'Good morning! Time for office.',
  //       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
  //       const NotificationDetails(
  //           android: AndroidNotificationDetails(
  //               'your channel id', 'your channel name',
  //               channelDescription: 'your channel description')),
  //       androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime);
  // }
}
