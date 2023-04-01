import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuwei/home/about_us.dart';
import 'package:fuwei/home/contact_us.dart';
import 'package:fuwei/home/country_list.dart';
import 'package:fuwei/widget/common_footer.dart';
import 'package:fuwei/widget/common_title.dart';

import '../utils/common_util.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ["了解目的地", "联系我们", "关于我们"];
  var tabBarTextSize = 0.0;

  @override
  void initState() {
    super.initState();
    if (Util.isWeb()) {
      tabBarTextSize = 30.sp;
    } else {
      tabBarTextSize = 60.sp;
    }
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonTitleWidget(),
          Material(
            color: Colors.grey[100],
            child: TabBar(
                padding: EdgeInsets.all(5),
                indicatorPadding: EdgeInsets.all(-5),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                tabs: tabs
                    .map((e) => Tab(
                            child: Text(
                          e,
                          style: TextStyle(fontSize: tabBarTextSize),
                        )))
                    .toList()),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              CountryListWidget(),
              ContactUSWidget(),
              AboutUSWidget(),
            ],
          )),
          CommonFooterWidget(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
