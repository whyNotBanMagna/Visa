import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuwei/config/config.dart';
import 'package:fuwei/utils/common_util.dart';

class CommonTitleWidget extends StatelessWidget {
  CommonTitleWidget({super.key});

  var textSize = 0.0;
  var sizeHeight = 0.0;
  var logoWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    if (Util.isWeb()) {
      textSize = 60.sp;
      sizeHeight = 200.h;
      logoWidth = 80.r;
    } else {
      textSize = 80.sp;
      sizeHeight = 240.h;
      logoWidth = 100.h;
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: sizeHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage("images/logo.png"),
            width: logoWidth,
            height: logoWidth,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              AppConfig.configWebName,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: textSize,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
