import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:taki_booking_driver/widgets/background.page.dart';
import 'package:taki_booking_driver/widgets/custom_appbar.dart';

import '../utils/Colors.dart';
import '../utils/Extensions/app_common.dart';

class TermsConditionScreen extends StatefulWidget {
  final String? title;
  final String? subtitle;

  TermsConditionScreen({this.title, this.subtitle});

  @override
  TermsConditionScreenState createState() => TermsConditionScreenState();
}

class TermsConditionScreenState extends State<TermsConditionScreen> {
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
        title: Text(widget.title!, style: boldTextStyle(color: appTextPrimaryColorWhite)),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: HtmlWidget("${widget.subtitle}"),
      ),
    );
  }
}
