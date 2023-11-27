import 'package:flutter/material.dart';
import 'package:taki_booking_driver/model/RideHistory.dart';
import 'package:taki_booking_driver/utils/Colors.dart';
import 'package:taki_booking_driver/utils/Common.dart';
import 'package:taki_booking_driver/utils/Extensions/StringExtensions.dart';
import 'package:taki_booking_driver/utils/Extensions/app_common.dart';
import 'package:taki_booking_driver/widgets/background.page.dart';
import 'package:taki_booking_driver/widgets/custom_appbar.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../main.dart';

class RideHistoryScreen extends StatefulWidget {
  final List<RideHistory> rideHistory;

  RideHistoryScreen({required this.rideHistory});

  @override
  RideHistoryScreenState createState() => RideHistoryScreenState();
}

class RideHistoryScreenState extends State<RideHistoryScreen> {
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
    return BackgroundPage(
      appBar: CustomAppBar(
        title: Text(language.rideHistory, style: boldTextStyle(color: Colors.white)),
      ),
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: widget.rideHistory.length,
        itemBuilder: (context, index) {
          RideHistory mData = widget.rideHistory[index];
          return TimelineTile(
            alignment: TimelineAlign.start,
            isFirst: index == 0 ? true : false,
            isLast: index == (widget.rideHistory.length - 1) ? true : false,
            indicatorStyle: IndicatorStyle(
              color: primaryColor,
              indicatorXY: 0.1,
              drawGap: true,
              width: 40,
              padding: EdgeInsets.symmetric(vertical: 2),
              height: 40,
              indicator: Container(
                padding: EdgeInsets.all(8),
                child: ImageIcon(AssetImage(statusTypeIcon(type: mData.historyType)), color: Colors.white),
                decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle),
              ),
            ),
            afterLineStyle: LineStyle(color: primaryColor, thickness: 1),
            endChild: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${mData.historyType!.replaceAll("_", " ").capitalizeFirstLetter()}', style: boldTextStyle()),
                  SizedBox(height: 4),
                  Text(mData.historyMessage.validate(), style: secondaryTextStyle(color: textPrimaryColorGlobal)),
                  SizedBox(height: 6),
                  Text('${printDate('${mData.createdAt}')}', style: secondaryTextStyle()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}