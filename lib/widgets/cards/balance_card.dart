import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_free/app/app.dart';
import 'package:split_free/app/app_routes.dart';
import 'package:split_free/bloc/model/Group.dart';

import '../../widgets/button/text_button.dart';
import '../../utils/color_utils.dart';
import '../../utils/dimention_utils.dart';
import '../../utils/enum_utils.dart';
import '../../utils/font_utils.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({
    Key? key,
    required this.group
  }) : super(key: key);

  final Group group;
  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Box(
        isShadow: true,
        margin: const [15,5],
        padding: const [10],
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
                          text: "Dhana owes  ${Global.getMoneySymbol("IN")} 100  to jeeva",
                          color: ColorUtils.TEXT_COLOR_DARK,
                          fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                          fontFamily: FontUtils.FONT_FAMILY,
                          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                          textAlign: start,
                          padding: const [10,0,0,0],
                        ),
                      ),
                      IconButton(
                        icon: Icon(open ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded),
                        color: ColorUtils.ICON_COLOR_DARK,
                        splashRadius: 20,
                        onPressed: ()=>setState(() { open=!open; }),
                      ),
                    ],
                  )
              ),
              const SizedBox(height: 5,),
              Visibility(
                visible: open,
                child: Flexible(
                    child: Row(
                      mainAxisAlignment: mainEnd,
                      children: [
                        BorderButton(text: "Settle Up", onPressed: (){}, theme: COLOR_TYPE.PRIMARY,padding: const [5,5,5,8],),
                        BorderButton(text: "Remind", onPressed: (){}, theme: COLOR_TYPE.ERROR,padding: const [5,5,5,8]),
                      ],
                    )
                ),
              )
            ],
          ),
    );
  }
}

