import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuwei/data/country_entity.dart';
import 'package:fuwei/home/item_country.dart';
import 'package:fuwei/utils/common_util.dart';
import 'package:fuwei/utils/dio_util.dart';

class CountryDataWidget extends StatefulWidget {
  CountryDataWidget(this.id, {super.key});

  final int id;
  @override
  State<CountryDataWidget> createState() => _CountryDataWidgetState();
}

class _CountryDataWidgetState extends State<CountryDataWidget>
    with AutomaticKeepAliveClientMixin {
  List<CountryEntity> list = [];
  var margin = 0.0;
  @override
  void initState() {
    super.initState();
    if (Util.isWeb()) {
      margin = 0.2.sw;
    } else {
      margin = 0.1.sw;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: margin, right: margin),
      child: FutureBuilder(
          future: NetworkUtil().getCountryList(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if (list.isEmpty) {
                  list.addAll(snapshot.data!);
                }
                if (Util.isWeb()) {
                  return GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 1,
                    ),
                    children: List.generate(list.length, (index) {
                      return CountryItemWidget(list[index]);
                    }),
                  );
                } else {
                  return GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.6,
                    ),
                    children: List.generate(list.length, (index) {
                      return CountryItemWidget(list[index]);
                    }),
                  );
                }
              } else {
                return Text("Error:${snapshot.error}");
              }
            } else {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
