import 'dart:html';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:fuwei/config/config.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../utils/common_util.dart';
import 'package:webviewx/webviewx.dart';

class AboutUSWidget extends StatelessWidget {
  AboutUSWidget({super.key});
  var textSize = 0.0;
  var contentSize = 0.0;
  var margin = 0.0;
  @override
  Widget build(BuildContext context) {
    if (Util.isWeb()) {
      textSize = 30.sp;
      contentSize = 22.sp;
      margin = 0.3.sw;
    } else {
      textSize = 60.sp;
      contentSize = 44.sp;
      margin = 0.1.sw;
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100.h),
            child: Text(
              "关于我们",
              style: TextStyle(fontSize: textSize, color: Colors.black),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: margin, right: margin, top: 30.h),
              child: WebViewX(
                width: 0.6.sw,
                height: 0.4.sh,
                initialContent: AppConfig.configContent,
                initialSourceType: SourceType.html,
              )),
        ],
      ),
    );
  }
}
