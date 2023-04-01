import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuwei/config/config.dart';

import '../utils/common_util.dart';

class CommonFooterWidget extends StatelessWidget {
  CommonFooterWidget({super.key});

  var textSize = 0.0;
  var bottomMargin = 0.0;
  var logoWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    if (Util.isWeb()) {
      textSize = 18.sp;
      bottomMargin = 10.r;
      logoWidth = 80.h;
    } else {
      textSize = 44.sp;
      bottomMargin = 50.r;
      logoWidth = 100.h;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppConfig.configWebZhuti,
            style: TextStyle(fontSize: textSize, color: Colors.black)),
        Padding(
          padding: EdgeInsets.all(10.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("联系电话：${AppConfig.configPhone}",
                  style: TextStyle(fontSize: textSize, color: Colors.black)),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w),
                child: Text("地址：${AppConfig.configAddress}",
                    style: TextStyle(fontSize: textSize, color: Colors.black)),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: bottomMargin),
          child: Text("备案号：${AppConfig.configWebBeian}",
              style: TextStyle(fontSize: textSize, color: Colors.black)),
        )
      ],
    );
  }
}
