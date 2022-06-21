import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_free/app/app.dart';
import 'package:split_free/app/app_routes.dart';
import 'package:split_free/bloc/model/Group.dart';

import '../../utils/color_utils.dart';
import '../../utils/dimention_utils.dart';
import '../../utils/font_utils.dart';

class SettlementCard extends StatelessWidget {
  const SettlementCard({
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
                        width: 45,
                        height: 45,
                        bgColor: ColorUtils.PROMPT_COLOR_LIGHT,
                        radius: DimensionUtils.CORNER_ROUND,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: crossStart,
                          children: [
                            Content(
                              text: "Sample settlement",
                              color: ColorUtils.TEXT_COLOR_DARK,
                              fontSize: FontUtils.FONT_SIZE_TEXT,
                              fontFamily: FontUtils.FONT_FAMILY,
                              fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                              textAlign: start,
                              padding: const [10,0,0,0],
                            ),
                            Content(
                              text: "You paid  ${Global.getMoneySymbol("IN")} 1000",
                              color: ColorUtils.TEXT_COLOR_LIGHT,
                              fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
                              fontFamily: FontUtils.FONT_FAMILY,
                              fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                              textAlign: start,
                              padding: const [10,0,4,0],
                            ),
                          ],
                        )
                      ),
                      Content(
                        text: "${Global.getMoneySymbol("IN")} 500",
                        color: ColorUtils.TEXT_COLOR_LIGHT,
                        fontSize: FontUtils.FONT_SIZE_TEXT,
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
              const SizedBox(height: 10,),
              Flexible(
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.calendar,size: 14,color: ColorUtils.PROMPT_COLOR_LIGHT,),
                      Content(
                        text: "12/12/2022",
                        color: ColorUtils.PRIMARY,
                        fontSize: FontUtils.FONT_SIZE_TEXT_MINI,
                        fontFamily: FontUtils.FONT_FAMILY,
                        radius: DimensionUtils.CORNER_SHARP,
                        height: 18,
                        fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                        margin: const [0,5],
                        padding: const [2,2,1,0],
                      ),
                      Icon(CupertinoIcons.time,size: 14,color: ColorUtils.PROMPT_COLOR_LIGHT),
                      Content(
                        text: "12:30 pm",
                        color: ColorUtils.PRIMARY,
                        fontSize: FontUtils.FONT_SIZE_TEXT_MINI,
                        fontFamily: FontUtils.FONT_FAMILY,
                        radius: DimensionUtils.CORNER_SHARP,
                        height: 18,
                        fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                        margin: const [0,5],
                        padding: const [2,0,1,0],
                      ),
                      const Spacer(),
                      const Box(
                        height: 18,
                        width:4,
                        radius:sharp,
                        bgColor: ColorUtils.CUSTOMER ,
                        margin: [0,0,0,0],
                      ),
                      Content(
                        text: "You lent  ${Global.getMoneySymbol("IN")} 500 ",
                        color: ColorUtils.CUSTOMER,
                        fontSize: FontUtils.FONT_SIZE_TEXT_MINI,
                        fontFamily: FontUtils.FONT_FAMILY,
                        radius: DimensionUtils.CORNER_SHARP,
                        height: 18,
                        fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                        bgColor:ColorUtils.CUSTOMER.withOpacity(0.1),
                        margin: const [0,5],
                        padding: const [2,0],
                      )
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }
}
