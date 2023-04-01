import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Util {
  /// 页面跳转
  static void gotoPage(BuildContext context, Widget widget) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: ((context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: widget,
              );
            })));
  }

  static bool isWeb(){
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      return false;
    } else {
      return true;
    }
  }
}
