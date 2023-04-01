import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuwei/data/country_entity.dart';
import 'package:fuwei/detail/detail.dart';
import 'package:fuwei/utils/common_util.dart';

class CountryItemWidget extends StatelessWidget {
  const CountryItemWidget(this.country, {super.key});

  final CountryEntity country;

  @override
  Widget build(BuildContext context) {
    var textSize = 0.0;
    var imageWidth = 0.0;
    var imageHeight = 0.0;
    if (Util.isWeb()) {
      textSize = 18.sp;
      imageWidth = 150.w;
      imageHeight = 100.w;
    } else {
      textSize = 60.sp;
      imageWidth = 500.w;
      imageHeight = 250.w;
    }
    return GestureDetector(
      onTap: () {
        Util.gotoPage(context, DetailPageWidget(country.id));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage(country.countryImgUrl),
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              country.countryName,
              style: TextStyle(fontSize: textSize, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
