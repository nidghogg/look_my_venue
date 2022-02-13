import 'package:flutter/material.dart';
import 'package:lookmyvenue_app/screens/venue_seeker/home_screen_SE.dart';
import 'custom_drawer/drawer_user_controller.dart';
import 'custom_drawer/home_drawer.dart';


class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({Key? key}) : super(key: key);

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const HomeScreenSE();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white54,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = const HomeScreenSE();
        });
      }
      // else if (drawerIndex == DrawerIndex.Help) {
      //   setState(() {
      //     screenView = const HelpScreen();
      //   });
      // } else if (drawerIndex == DrawerIndex.FeedBack) {
      //   setState(() {
      //     screenView = const FeedbackScreen();
      //   });
      // } else if (drawerIndex == DrawerIndex.Invite) {
      //   setState(() {
      //     screenView = const InviteFriend();
      //   });
      // } else {
      //   //do in your way......
      // }
    }
  }
}
