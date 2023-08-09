import 'package:flutter/material.dart';
import 'package:outlook/components/side_menu.dart';
import 'package:outlook/responsive.dart';
import 'package:outlook/screens/email/email_screen.dart';
import 'components/list_of_emails.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // MediaQuery provides the width and height
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(

        // in mobile mode we show the Middle component only visibly and hide the two to right and left
          mobile: ListOfEmails(),

          // in tablet mode we show the 2 components visibly and hide SideBar
          tablet: Row(
            children: [
              Expanded(
                flex: 6,
                  child: ListOfEmails()
              ),

              Expanded(
                flex: 9,
                  child: EmailScreen()
              )
            ],
          ),


          // in desktop mode we show the three components visibly
          desktop: Row(
            children: [

              // once our screen width is less than 1300 it starts showing RenderFLEX error thus we need to mention specific padding for this screen size like "flex: _size.width > 1340 ? 2 : 4" hence our screen will stop giving errors on width less than 1340 until it reaches 1100.
              // After width goes below 1100 it gives error again so that's why I created my "responsive.dart file" to make the app responsive.

              // The following 3 components below are the ones making the whole UI of this project and thus we are applying the flex factors to each component to adjust them in the range '>= 1100'.
              Expanded(
                flex: _size.width > 1340 ? 2 : 4, // if width is greater than 1340 so keep flex : 2 otherwise make it 4
                child: SideMenu(),     // This component is the Side Menu  (Making the Left of the Screen)
              ),
              Expanded(
                flex: _size.width > 1340 ? 3 : 5,
                child: ListOfEmails(),   // This component is the List of Emails/Users (Making the center of the Screen)
              ),
              Expanded(
                flex: _size.width > 1340 ? 8 : 10,
                child: EmailScreen(),  // This component is the Individual User Interface showing his/her email opened (Making the Right side of the screen)
              ),
            ],
          ),
      ),
    );
  }
}
