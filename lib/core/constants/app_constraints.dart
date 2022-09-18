import 'package:flutter/cupertino.dart';

class AppConstraints {
  static const padding = 16.0;

  static const radius = 12.0;
  static const borderRadius = BorderRadius.all(Radius.circular(radius));
  static const borderRadiusTLR = BorderRadius.only(topLeft: Radius.circular(radius), topRight: Radius.circular(radius));
}
