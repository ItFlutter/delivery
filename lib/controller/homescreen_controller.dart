import 'package:delivery/view/screen/orders/accepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/orders/pending.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  List<Widget> listPage = const [
    OrdersPending(),
    OrdersAccepted(),
    Text(""),
  ];
  List bottomappbar = [
    {
      "title": "152".tr,
      "icon": Icons.card_travel,
    },
    {"title": "153".tr, "icon": Icons.delivery_dining},
    {
      "title": "63".tr,
      "icon": Icons.settings,
    },
  ];
  int currentPage = 0;
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
