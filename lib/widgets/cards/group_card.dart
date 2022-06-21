import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:split_free/app/app.dart';
import 'package:split_free/app/app_routes.dart';
import 'package:split_free/bloc/model/Group.dart';

import '../../utils/color_utils.dart';
import '../../utils/dimention_utils.dart';
import '../../utils/font_utils.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    Key? key,
    required this.group
  }) : super(key: key);

  final Group group;

  @override
  Widget build(BuildContext context) {
    return Box(
        isShadow: true,
        margin: const [15,5],
        padding: const [10],
        child: InkWell(
          onTap: ()=>App().setNavigation(context, AppRoutes.APP_GROUP_DETAILS),
          child: Column(
            crossAxisAlignment: crossStart,
            mainAxisSize: min,
            children: [
              Flexible(
                  child: Row(
                    children: [
                      Box(
                        asset: 'sample.jpeg',
                        width: 30,
                        height: 30,
                        bgColor: ColorUtils.PROMPT_COLOR_LIGHT,
                        radius: DimensionUtils.CORNER_ROUND,
                      ),
                      Expanded(
                        child: Content(
                          text: group.name,
                          color: ColorUtils.TEXT_COLOR_DARK,
                          fontSize: FontUtils.FONT_SIZE_TEXT,
                          fontFamily: FontUtils.FONT_FAMILY,
                          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                          textAlign: start,
                          padding: const [10,0,0,0],
                        ),
                      ),
                      Content(
                        text: "${Global.getMoneySymbol("IN")} 100",
                        color: ColorUtils.TEXT_COLOR_LIGHT,
                        fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                        fontFamily: FontUtils.FONT_FAMILY,
                        fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                        textAlign: end,
                      ),
                      Box(
                        width: 20,
                        child: Icon(
                          Icons.arrow_upward ,
                          color: ColorUtils.SUCCESS,
                          size: 18,
                        ),
                      )
                    ],
                  )
              ),
              const SizedBox(height: 5,),
              Flexible(
                  child: Row(
                    children: [
                      Box(
                        height: 18,
                        width:4,
                        radius:sharp,
                        bgColor: ColorUtils.CUSTOMER ,
                        margin: const [0,0,0,0],
                      ),
                      Content(
                        text: "You lent  ${Global.getMoneySymbol("IN")} 1000 ",
                        color: ColorUtils.CUSTOMER,
                        fontSize: FontUtils.FONT_SIZE_TEXT_MINI,
                        fontFamily: FontUtils.FONT_FAMILY,
                        radius: DimensionUtils.CORNER_SHARP,
                        height: 18,
                        fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                        bgColor:ColorUtils.CUSTOMER.withOpacity(0.1),
                        margin: const [0,5],
                        padding: const [2,0],
                      ),
                      const Spacer(),
                      Box(
                        width: 20,
                        child: const Icon(Icons.notifications,color: ColorUtils.INFO,size: 16,) ,
                      ),
                      Content(
                        text: 'Remind me' ,
                        color: ColorUtils.INFO,
                        fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
                        fontFamily: FontUtils.FONT_FAMILY,
                        radius: DimensionUtils.CORNER_BLUNT,
                        fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                        margin: const [0,5],
                      ),
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }
}
