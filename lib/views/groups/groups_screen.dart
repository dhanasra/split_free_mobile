import 'package:components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_free/widgets/cards/group_card.dart';
import 'package:split_free/bloc/model/Group.dart';

import '../../app/app.dart';
import '../../utils/color_utils.dart';
import '../../utils/dimention_utils.dart';
import '../../utils/font_utils.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.arrow_left),
          color: ColorUtils.ICON_COLOR_DARK,
          splashRadius: 20,
          onPressed: ()=>App().setBackNavigation(context),
        ),
        title: Content(
          text: "My Groups",
          padding: const [10,10,0,5],
          color: ColorUtils.TEXT_COLOR_DARK,
          fontSize: FontUtils.FONT_SIZE_TITLE,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            color: ColorUtils.ICON_COLOR_DARK,
            splashRadius: 20,
            onPressed: ()=>App().setBackNavigation(context),
          ),
        ],
      ),
      body: Box(
          bgColor: ColorUtils.BG_COLOR_1,
          margin: const [0,0,0,15],
          child: _body()
      ),
    );
  }

  Widget _body(){
    return ListView(
      padding: const EdgeInsets.only(top: 20,bottom: 20),
      children: [
        GroupCard(group: Group(
            name: "Group Name",
            type: "",
            createdAt: "",
            updatedAt: "",
            avatar: "",
            inviteCode: "",
            members: [])
        )
      ],
    );
  }
}
