import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuwei/utils/dio_util.dart';
import 'package:webviewx/webviewx.dart';
import '../utils/common_util.dart';

class CountryDetailWidget extends StatelessWidget {
  CountryDetailWidget(this.countryId, {super.key});

  final int countryId;
  var countryTitleTextSize = 0.0;
  var countryPicWidth = 0.0;
  var countryPicHeight = 0.0;
  var padding = 0.0;

  var height = 0.0;
  var textSize = 0.0;
  var textSize2 = 0.0;
  var textSize3 = 0.0;
  var itemHeight = 0.0;
  var topMarin = 0.0;
  var bottomMarin = 0.0;

  @override
  Widget build(BuildContext context) {
    if (Util.isWeb()) {
      countryTitleTextSize = 20.sp;
      countryPicWidth = 210.w;
      countryPicHeight = 140.w;
      padding = 0.3.sw;
      height = 30.h;
      textSize = 24.sp;
      textSize2 = 24.sp;
      textSize3 = 24.sp;
      itemHeight = 50.h;
      topMarin = 30.r;
      bottomMarin = 10.r;
    } else {
      countryTitleTextSize = 72.sp;
      countryPicWidth = 500.w;
      countryPicHeight = 250.w;
      padding = 0.1.sw;
      height = 40.h;
      textSize = 72.sp;
      textSize2 = 72.sp;
      textSize3 = 72.sp;
      itemHeight = 80.h;
      topMarin = 60.r;
      bottomMarin = 30.r;
    }

    return FutureBuilder(
        future: NetworkUtil().getCountryDetail(countryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.only(left: padding, right: padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 100.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data?.countryName ?? "",
                                  style: TextStyle(
                                      fontSize: countryTitleTextSize,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        snapshot.data?.countryImgUrl ?? ""),
                                    width: countryPicWidth,
                                    height: countryPicHeight,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            color: Colors.grey[200],
                            height: height,
                            margin: EdgeInsets.only(
                                top: topMarin, bottom: bottomMarin),
                            child: Text(
                              "签证须知：",
                              style: TextStyle(
                                  fontSize: textSize,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 0.8.sw,
                            child: WebViewX(
                              width: 0.6.sw,
                              height: 100.r,
                              initialContent:
                                  snapshot.data?.countryContent ?? "",
                              initialSourceType: SourceType.html,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: ListView.builder(
                                itemExtent: itemHeight,
                                itemCount:
                                    snapshot.data?.countryVisitVisaUrl.length ??
                                        0,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: TextButton(
                                      onPressed: () {
                                        if (snapshot.data != null &&
                                            snapshot.data!.countryVisitVisaUrl
                                                .isNotEmpty) {
                                          downLoadFile(snapshot
                                              .data!
                                              .countryVisitVisaUrl[index]
                                              .fileUrl);
                                        }
                                      },
                                      child: Text(
                                          snapshot
                                                  .data
                                                  ?.countryVisitVisaUrl[index]
                                                  .fileName ??
                                              "",
                                          style: TextStyle(
                                              fontSize: textSize3,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Text("Error:${snapshot.error}");
            }
          } else {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
        });
  }

  ///调用浏览器的下载功能下载文件
  downLoadFile(url) {
    AnchorElement anchorElement = AnchorElement(href: url);
    anchorElement.download = "资料";
    anchorElement.click();
  }
}
