import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarConfiguration {
  static Widget statusBarConfiguration({required Widget child}) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: child,
    );
  }
}
