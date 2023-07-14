import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/providers/user_provider.dart';
import '../utilities/dimensions.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({
    Key? key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  }) : super(key: key);
  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  //we made it a requirement for mobile screen layout and web screen layout using a constructor.
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  Widget build(BuildContext context) {
    //LayoutBuilder helps in giving responsive layout.
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          //web screen
          return widget.webScreenLayout;
        } else {
          //mobile screen
          return widget.mobileScreenLayout;
        }
      },
    );
  }
}
