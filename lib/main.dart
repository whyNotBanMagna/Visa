import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuwei/config/config.dart';
import 'package:fuwei/home/home.dart';
import 'package:fuwei/utils/dio_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1920, 1080),
        builder: (context, child) {
          return MaterialApp(
            title: "夫为服务",
            home: FutureBuilder(
              future: NetworkUtil().getWebConfig(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    AppConfig.configPhone = snapshot.data?.configPhone ?? "";
                    AppConfig.configAddress =
                        snapshot.data?.configAddress ?? "";
                    AppConfig.configWechatUrl =
                        snapshot.data?.configWechatUrl ?? "";
                    AppConfig.configWebName =
                        snapshot.data?.configWebName ?? "";
                    AppConfig.configWebBeian =
                        snapshot.data?.configWebBeian ?? "";
                    AppConfig.configWebZhuti =
                        snapshot.data?.configWebZhuti ?? "";
                    AppConfig.configContent =
                        snapshot.data?.configContent ?? "";
                    return HomePage();
                  } else {
                    return Text("Error:${snapshot.error}");
                  }
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
        });
  }
}
