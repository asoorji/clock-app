import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'clock_view.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 24),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const DigitalClockWidget(),
                Text(
                  formattedDate,
                  style: const TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: ClockView(
                size: MediaQuery.of(context).size.height / 4,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Timezone',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 24),
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'UTC' + offsetSign + timezoneString,
                      style: const TextStyle(
                          fontFamily: 'avenir',
                          color: Colors.white,
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DigitalClockWidget extends StatefulWidget {
  const DigitalClockWidget({super.key});

  @override
  State<DigitalClockWidget> createState() => _DigitalClockWidgetState();
}

class _DigitalClockWidgetState extends State<DigitalClockWidget> {
  var formattedTime = DateFormat('HH:mm').format(DateTime.now());
 
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      var previousMinute =
          DateTime.now().add(const Duration(seconds: -1)).minute;
      var currentMinute = DateTime.now().minute;
      if (previousMinute != currentMinute) {
        setState(() {
          formattedTime = DateFormat('HH:mm').format(DateTime.now());
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('=====>now updated');
    return Text(
      formattedTime,
      style: const TextStyle(
          fontFamily: 'avenir', color: Colors.white, fontSize: 64),
    );
  }
}
