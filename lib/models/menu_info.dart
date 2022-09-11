import 'package:clock_app/enums.dart';
import 'package:flutter/foundation.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  dynamic title;
  dynamic imageSource;

  MenuInfo(this.menuType, {this.title, this.imageSource});

  updateMenu(MenuInfo menuInfo) {
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    imageSource = menuInfo.imageSource;

    //Important: This lets consumers know there's change in the state of your app
    notifyListeners();
  }
}


