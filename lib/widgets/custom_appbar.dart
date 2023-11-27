import 'package:flutter/material.dart';
import 'package:taki_booking_driver/utils/Colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final double? height;
  final Widget? title;
  final List<Widget>? actions;

  const CustomAppBar({super.key,this.height = kToolbarHeight, this.title, this.actions,});

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: textPrimaryColor,
      automaticallyImplyLeading: false,
      backgroundColor: appBarBackgroundColorGlobal,
      title: title,
      actions: actions,
      elevation: 0,
      forceMaterialTransparency: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: BackButton(
          onPressed: () => Navigator.of(context).pop(),
          color: textPrimaryColor,
          style: ButtonStyle(
            iconSize: MaterialStateProperty.all(20),
          ),
        ),
      ),
    );
  }
}