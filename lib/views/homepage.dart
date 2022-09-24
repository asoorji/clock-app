import 'package:clock_app/data.dart';
import 'package:clock_app/enums.dart';
import 'package:clock_app/views/clock_page.dart';
import 'package:clock_app/views/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/menu_info.dart';
import 'alarm_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2D2F41),
        body: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems
                  .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                  .toList(),
            ),
            const VerticalDivider(
              color: Colors.white54,
              width: 1,
            ),
            Expanded(
              child: Consumer<MenuInfo>(
                builder: (BuildContext context, MenuInfo value, Widget? child) {
                  if (value.menuType == MenuType.clock) {
                    return ClockPage();
                  } else if (value.menuType == MenuType.alarm) {
                    return AlarmPage();
                  } else {
                    return RichText(
                        text: TextSpan(
                            style: const TextStyle(fontSize: 20),
                            children: [
                          const TextSpan(text: 'Still loading...\n'),
                          TextSpan(
                              text: value.title,
                              style: const TextStyle(
                                fontSize: 48,
                              ))
                        ]));
                  }
                },
              ),
            ),
          ],
        ));
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return TextButton(
            style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(32))),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                backgroundColor: currentMenuInfo.menuType == value.menuType
                    ? Colors.black26
                    : Colors.transparent),
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            child: Column(
              children: [
                Image.asset(
                  currentMenuInfo.imageSource,
                  scale: 1.5,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  currentMenuInfo.title,
                  style: const TextStyle(
                      fontFamily: 'avenir', color: Colors.white, fontSize: 14),
                )
              ],
            ));
      },
    );
  }
}
