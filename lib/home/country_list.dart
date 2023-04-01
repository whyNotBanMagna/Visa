import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuwei/data/continent_entity.dart';
import 'package:fuwei/home/asia_view.dart';
import 'package:fuwei/utils/dio_util.dart';

import '../utils/common_util.dart';

class CountryListWidget extends StatefulWidget {
  const CountryListWidget({super.key});

  @override
  State<CountryListWidget> createState() => _CountryListWidgetState();
}

class _CountryListWidgetState extends State<CountryListWidget>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<ContinentEntity> tabs = [];
  var tabBarTextSize = 0.0;
  var topMargin = 0.0;
  @override
  void initState() {
    super.initState();
    if (Util.isWeb()) {
      tabBarTextSize = 30.sp;
      topMargin = 60.h;
    } else {
      tabBarTextSize = 50.sp;
      topMargin = 20.h;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: NetworkUtil().getContinentList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if (tabs.isEmpty) {
                  tabs.addAll(snapshot.data!);
                  _tabController ??=
                      TabController(length: tabs.length, vsync: this);
                }
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: topMargin),
                      child: TabBar(
                          isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          controller: _tabController,
                          tabs: tabs
                              .map((e) => Tab(
                                    child: Text(
                                      e.partName,
                                      style: TextStyle(
                                          fontSize: tabBarTextSize,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))
                              .toList()),
                    ),
                    Expanded(
                        child: TabBarView(
                            controller: _tabController,
                            children: tabs
                                .map((e) => CountryDataWidget(e.id))
                                .toList()))
                  ],
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
          }),
    );
  }
}
