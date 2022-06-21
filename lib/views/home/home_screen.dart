import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_free/views/account/account_screen.dart';
import 'package:split_free/views/activity/activity_screen.dart';
import 'package:split_free/views/friends/friends_screen.dart';
import 'package:split_free/views/groups/groups_screen.dart';

import '../../../app/app.dart';
import '../../utils/color_utils.dart';
import '../../utils/font_utils.dart';
import '../../view_models/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        App().closeApp();
        return true;
      },
      child: Scaffold(
        body: _build(),
      ),
    );
  }

  Widget _build(){

    final List<Widget> _children =[
      const GroupsScreen(),
      const FriendsScreen(),
      const ActivityScreen(),
      const AccountScreen()
    ];

    return Scaffold(
      body: _children[HomeViewModel.currentIndex], //
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: onTabTapped,
        elevation: 16,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorUtils.BUTTON_COLOR_PRIMARY,
        unselectedItemColor: ColorUtils.BORDER_COLOR_DARK,
        iconSize: 22,
        selectedLabelStyle: TextStyle(
            fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
            fontFamily: FontUtils.FONT_FAMILY,
            fontWeight: FontUtils.FONT_WEIGHT_HEADER
        ),
        unselectedLabelStyle: TextStyle(
            fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
            fontFamily: FontUtils.FONT_FAMILY,
            fontWeight: FontUtils.FONT_WEIGHT_HEADER
        ),
        currentIndex: HomeViewModel.currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.group),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bolt_horizontal),
              label: 'Activity'
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Account'
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      HomeViewModel.currentIndex = index;
    });
  }
}
