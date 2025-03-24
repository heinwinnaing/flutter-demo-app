import 'package:flutter/material.dart';

class AppFont {
  static TextStyle small({Color? color, FontWeight? fontWeight}) => TextStyle(
        fontFamily: 'NotoSans',
        fontSize: 12,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      );
  static TextStyle normal({Color? color, FontWeight? fontWeight}) => TextStyle(
        fontFamily: 'NotoSans',
        fontSize: 15,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      );
  static TextStyle large({Color? color, FontWeight? fontWeight}) => TextStyle(
        fontFamily: 'NotoSans',
        fontSize: 20,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      );
  static TextStyle extraLarge({Color? color, FontWeight? fontWeight}) =>
      TextStyle(
        fontFamily: 'NotoSans',
        fontSize: 36,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      );
      static TextStyle custom({Color? color, double? fontSize, FontWeight? fontWeight}) =>
      TextStyle(
        fontFamily: 'NotoSans',
        fontSize: fontSize ?? 16.0,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      );
}
