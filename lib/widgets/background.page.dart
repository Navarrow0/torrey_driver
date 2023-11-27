

import 'package:flutter/material.dart';

class BackgroundPage extends StatefulWidget {
  const BackgroundPage({super.key, required this.child, this.appBar, this.isBottom = false, this.bottomNavigationBar});

  final Widget child;
  final PreferredSizeWidget? appBar;
  final bool isBottom;
  final Widget? bottomNavigationBar;

  @override
  State<BackgroundPage> createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      bottomNavigationBar: widget.bottomNavigationBar,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(top: 120, left: 300),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(244, 202, 34, 0.9),
                        blurRadius: 140,
                        spreadRadius: 14
                    )
                  ]
              ),
            ),
          ),

          Align(
            alignment: widget.isBottom ? Alignment.bottomLeft : Alignment.centerLeft,
            child: Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(bottom: widget.isBottom ? 0 : 120),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(244, 202, 34, 0.9),
                        blurRadius: 140,
                        spreadRadius: 14
                    )
                  ]
              ),
            ),
          ),
          SafeArea(
            child: widget.child,
          )
        ],
      ),
    );
  }
}