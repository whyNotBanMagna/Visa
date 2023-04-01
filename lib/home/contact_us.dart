import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuwei/config/config.dart';
import '../utils/common_util.dart';

class ContactUSWidget extends StatelessWidget {
  ContactUSWidget({super.key});

  var textSize = 0.0;
  var imageWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    if (Util.isWeb()) {
      textSize = 30.sp;
      imageWidth = 230.r;
    } else {
      textSize = 60.sp;
      imageWidth = 500.w;
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 60, right: 60, top: 180.h),
            child: Text("微信咨询",
                style: TextStyle(fontSize: textSize, color: Colors.black)),
          ),
          Container(
            margin: EdgeInsets.only(left: 60, right: 60, top: 30.h),
            child: Image(
              image: NetworkImage(AppConfig.configWechatUrl),
              width: imageWidth,
              height: imageWidth,
            ),
          ),
        ],
      ),
    );
  }
}
