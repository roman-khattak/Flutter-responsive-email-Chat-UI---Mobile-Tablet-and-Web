import 'package:flutter/material.dart';
import 'package:outlook/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';
import '../extensions.dart';
import 'side_menu_item.dart';
import 'tags.dart';


import 'package:flutter/foundation.dart' show kIsWeb;
//In Flutter, 'kIsWeb' is a boolean constant provided by the Flutter framework that indicates whether the app is running on the web platform. It is defined as true when the app is running on the web and false otherwise (when running on mobile or desktop platforms).
//
// In the code snippet you provided, kIsWeb ? kDefaultPadding : 0 is used as the top padding value for the Container widget.
//
// Here's how it works:
//
// If the app is running on the web (kIsWeb is true), the top padding value will be kDefaultPadding, which is a constant with a value of 20 in your case.
// If the app is running on a mobile or desktop platform (kIsWeb is false), the top padding value will be 0, effectively removing the top padding.
// This conditional approach allows you to adjust the padding based on whether the app is running on the web or other platforms, providing different padding configurations as needed.

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,  // this height will make sure the SideBar cover the full height of the screen
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),// we add this padding only if user run this app on desktop and not on mobile
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/Logo Outlook.png",
                      width: 46,
                    ),
                    Spacer(),
                    // We don't want to show this close button on Desktop mode so we place this condition
                    if (!Responsive.isDesktop(context)) CloseButton(),  // 'CloseButton' is a default button
                  ],
                ),
                SizedBox(height: kDefaultPadding),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, kDefaultPadding * 3),
                    backgroundColor: kPrimaryColor,
                    padding: EdgeInsets.symmetric(
                      vertical: kDefaultPadding,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: WebsafeSvg.asset("assets/Icons/Edit.svg", width: 16),
                  label: Text(
                    "New message",
                    style: TextStyle(color: Colors.white),
                  ),
                ).addNeumorphism(
                  topShadowColor: Colors.white,
                  bottomShadowColor: Color(0xFF234395).withOpacity(0.2),
                ),
                SizedBox(height: kDefaultPadding),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, kDefaultPadding * 3),
                    backgroundColor: kBgDarkColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 1.5,
                      vertical: kDefaultPadding,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: WebsafeSvg.asset("assets/Icons/Download.svg", width: 16),
                  label: Text(
                    "Get messages",
                    style: TextStyle(color: kTextColor),
                  ),
                ).addNeumorphism(),
                SizedBox(height: kDefaultPadding * 2),
                // Menu Items
                SideMenuItem(
                  press: () {},
                  title: "Inbox",
                  iconSrc: "assets/Icons/Inbox.svg",
                  isActive: true,
                  itemCount: 3,
                ),
                SideMenuItem(
                  press: () {},
                  title: "Sent",
                  iconSrc: "assets/Icons/Send.svg",
                  isActive: false,
                ),
                SideMenuItem(
                  press: () {},
                  title: "Drafts",
                  iconSrc: "assets/Icons/File.svg",
                  isActive: false,
                ),
                SideMenuItem(
                  press: () {},
                  title: "Deleted",
                  iconSrc: "assets/Icons/Trash.svg",
                  isActive: false,
                  showBorder: false,
                ),

                SizedBox(height: kDefaultPadding * 2),
                // Tags
                Tags(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}