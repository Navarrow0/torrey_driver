import 'package:flutter/material.dart';
import 'package:taki_booking_driver/widgets/background.page.dart';
import 'package:taki_booking_driver/widgets/custom_appbar.dart';

import '../components/CreateTabScreen.dart';
import '../main.dart';
import '../utils/Colors.dart';
import '../utils/Common.dart';
import '../utils/Constants.dart';
import '../utils/Extensions/app_common.dart';

class MyRidesScreen extends StatefulWidget {
  @override
  MyRidesScreenState createState() => MyRidesScreenState();
}

class MyRidesScreenState extends State<MyRidesScreen> {
  int currentPage = 1;
  int totalPage = 1;
  List<String> riderStatus = [COMPLETED, CANCELED];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: riderStatus.length,
      child: BackgroundPage(
        appBar: CustomAppBar(

          title: Text(language.rides, style: boldTextStyle(color: appTextPrimaryColorWhite)),
        ),
        child: Column(
          children: [
            Container(
              height: 40,
              margin: EdgeInsets.only(right: 16, left: 16, top: 16),
              decoration: BoxDecoration(
                color: dividerColor,
                borderRadius: radius(),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: radius(),
                  color: Color.fromRGBO(45, 45, 45, 1.0),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Color.fromRGBO(72, 72, 72, 1.0),
                labelStyle: boldTextStyle(color: Colors.white, size: 14),
                tabs: riderStatus.map((e) {
                  return Tab(
                    child: Text(changeStatusText(e)),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: riderStatus.map((e) {
                  return CreateTabScreen(status: e);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
