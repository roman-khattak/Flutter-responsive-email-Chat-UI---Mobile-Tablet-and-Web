import 'package:flutter/material.dart';
import 'package:outlook/components/side_menu.dart';
import 'package:outlook/models/Email.dart';
import 'package:outlook/responsive.dart';
import 'package:outlook/screens/email/email_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';
import 'email_card.dart';

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


class ListOfEmails extends StatefulWidget {
  const ListOfEmails({
     Key? key,
  }) : super(key: key);

  @override
  State<ListOfEmails> createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();   // this GlobalKey is created for 'ScaffoldState' so that we can open drawer on click of the menu icon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,  // the key is declared here to let Scaffold know so that we can open drawer using this key
    // Side menu is pretty big now
      drawer: ConstrainedBox(
        // here we limit the max width of our side menu
        constraints: BoxConstraints(maxWidth:  250),
          child: SideMenu()
      ),
      body: Container(
        // we add this padding only if user run this app on desktop and not on mobile
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: kBgDarkColor,
        child: SafeArea(
          right: false, // by making right false, in the landscape mode the the main body will not be pushed toward the left side thus making UI look better
          child: Column(
            children: [

              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [

                    // once user clicks on the menu icon the menu will show like drawer
                    // I want to hide this menu icon on Desktop device
                    if(!Responsive.isDesktop(context))  // means if device is other than desktop then only show menu icon
                      IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(Icons.menu)
                    ),

                    if(!Responsive.isDesktop(context)) SizedBox(width: 5,), // if the device is not desktop then the space between 'menu' icon and 'SearchBar' shall be '5'
                    Expanded(
                      child: TextField(       // This TextFormField is for the searchBar
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search",
                          fillColor: kBgLightColor,
                          filled: true,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(kDefaultPadding *0.75),  // i am giving 15 padding to the Search Icon from all sides to reduce its size on mobile
                            child: WebsafeSvg.asset(
                              "assets/Icons/Search.svg",
                              width: 24,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      child: WebsafeSvg.asset(
                        "assets/Icons/Angle down.svg",
                        width: 16,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Sort by date",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {},
                      child: WebsafeSvg.asset(
                        "assets/Icons/Sort.svg",
                        width: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: ListView.builder(
                  itemCount: emails.length,
                  // on mobile device this Active doesn't mean anything
                  itemBuilder: (context, index) => EmailCard(
                    isActive: Responsive.isMobile(context)? false : index == 0,
                    email: emails[index],
                    press: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EmailScreen(email: emails[index],);  // the email clicked will be sent index-wise from the list
                      },));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
