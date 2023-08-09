import 'dart:js_interop';

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {

  final Widget mobile;   // final keyword means this name cannot be used by some other Widget in this project
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,

  });


  // These boolean values {'isMobile', 'isTablet', 'isDesktop'} helps us later while placing conditions/constraints on items to either show or hide.
  // ... for example : " if (!Responsive.isDesktop(context)) CloseButton(), " in side_menu, means if the device is not a desktop only then show the CloseButton(),
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {

          // if our width is more than  1100 then we consider it a desktop
          if(constraints.maxWidth >= 1100) {
            return desktop;

          // if width is less than 1100 and more than 650 we consider it a tablet
          } else if (constraints.maxWidth >= 650) {
            return tablet;

          // and if width is less than 650 we call it a mobile
          }else {
            return mobile;
          }
        },
    );
  }
}
