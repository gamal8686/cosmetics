import 'dart:async';

import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();

goTo(Widget page, {bool canPop = false, int? delayDuration}) {
  void action() {
    Navigator.pushAndRemoveUntil(
      navKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
      (route) => canPop,
    );
  }

  if (delayDuration != null) {
    Timer(Duration(seconds: delayDuration), () {
      action();
    });
  } else {
    action();
  }
}

showMessage(String? text, {bool isError = false}) {
  if (text == null || text.isEmpty) return;
   ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      content: Text(text),
      duration: Duration(seconds: 2),
    ),
  );
}
