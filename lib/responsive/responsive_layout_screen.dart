import 'package:flutter/material.dart';

import '../utilities/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({
    Key? key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  }) : super(
            key:
                key); //we made it a requirement for mobile screen layout and web screen layout using a constructor.

  @override
  Widget build(BuildContext context) {
    //LayoutBuilder helps in giving responsive layout.
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          //web screen
          return webScreenLayout;
        } else {
          //mobile screen
          return mobileScreenLayout;
        }
      },
    );
  }
}
