import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:split_free/bloc/model/Group.dart';
import 'package:split_free/utils/date_utils.dart';
import 'package:split_free/widgets/cards/balance_card.dart';
import 'package:split_free/widgets/cards/settlement_card.dart';
import 'package:split_free/widgets/view/chart.dart';

import '../../app/app.dart';
import '../../widgets/button/text_button.dart';
import '../../utils/color_utils.dart';
import '../../utils/dimention_utils.dart';
import '../../utils/enum_utils.dart';
import '../../utils/font_utils.dart';

class GroupDetailScreen extends StatefulWidget {
  const GroupDetailScreen({Key? key}) : super(key: key);

  @override
  _GroupDetailScreenState createState() => _GroupDetailScreenState();
}

class _GroupDetailScreenState extends State<GroupDetailScreen> {
  late DateTime selectedDate;
  List<String> popupItems = ["Add Notes","Export Pdf"];


  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.arrow_left),
          color: ColorUtils.ICON_COLOR_DARK,
          splashRadius: 20,
          onPressed: ()=>App().setBackNavigation(context),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(CupertinoIcons.ellipsis_vertical,color: ColorUtils.ICON_COLOR_DARK,),  //don't specify icon if you want 3 dot menu
            color: ColorUtils.BG_COLOR_1,
            itemBuilder: (context) => popupItems.map((e){
              return PopupMenuItem<int>(
                value: 0,
                child: Content(
                  text: e,
                  color: ColorUtils.PROMPT_COLOR,
                  fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                  fontFamily: FontUtils.FONT_FAMILY,
                  fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                ),
              );
            }).toList(),
            onSelected: (item) => {print(item)},
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
    return Column(
      children: [
        Box(
            padding: const [10,5,10,0],
            bgColor: white,
            expanded: true,
            child: Flexible(
              child: Row(
                children: [
                  Expanded(
                    child: Content(
                      text: 'Dhana Sekaran',
                      color: ColorUtils.TEXT_COLOR_DARK,
                      fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                      fontFamily: FontUtils.FONT_FAMILY,
                      fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                      textAlign: start,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      child: Label(
                        prefix: const Icon(
                          Icons.picture_as_pdf,
                          color: ColorUtils.BUTTON_COLOR_PRIMARY,
                          size: 20,),
                        label: "Statement",
                        color: ColorUtils.BUTTON_COLOR_PRIMARY,
                        fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
                        fontFamily: FontUtils.FONT_FAMILY,
                        fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                        mainAxisAlignment: mainEnd,
                        textPadding: const [0,0,0,2],
                        suffix: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: ColorUtils.BUTTON_COLOR_PRIMARY,
                          size: 16,),
                      ),
                      onTap: (){},
                    ),
                  )
                ],
              ),
            )
        ),
        Box(
          padding: const [10],
          bgColor: white,
          expanded: true,
          child: Flexible(
              child: Row(
                children: [
                  Box(
                    height: 18,
                    width:4,
                    radius:sharp,
                    bgColor: true ? ColorUtils.CUSTOMER : ColorUtils.VENDOR,
                    margin: const [0,0,0,0],
                  ),
                  Content(
                    text: true ? 'Customer' : 'Vendor',
                    color: true ? ColorUtils.CUSTOMER : ColorUtils.VENDOR,
                    fontSize: FontUtils.FONT_SIZE_TEXT_MINI,
                    fontFamily: FontUtils.FONT_FAMILY,
                    radius: DimensionUtils.CORNER_SHARP,
                    height: 18,
                    width: 60,
                    fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                    bgColor: true
                        ? ColorUtils.CUSTOMER.withOpacity(0.1)
                        : ColorUtils.VENDOR.withOpacity(0.1),
                    margin: const [0,5],
                    padding: const [2,0],
                  ),
                  Spacer(),
                  Content(
                    text: "${Global.getMoneySymbol("IN")} 100",
                    color: ColorUtils.TEXT_COLOR_LIGHT,
                    fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                    fontFamily: FontUtils.FONT_FAMILY,
                    fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                    textAlign: end,
                  ),
                ],
              )
          ),
        ),
        Flexible(
            child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    Box(
                      child: TabBar(
                        indicatorColor: ColorUtils.TEXT_COLOR_MEDIUM,
                        labelColor: ColorUtils.TEXT_COLOR_MEDIUM,
                        unselectedLabelColor: ColorUtils.BORDER_COLOR_DARK,
                        labelStyle: TextStyle(
                          color: ColorUtils.PROMPT_COLOR,
                          fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                          fontFamily: FontUtils.FONT_FAMILY,
                          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                        ),
                        unselectedLabelStyle: TextStyle(
                          color: ColorUtils.PROMPT_COLOR,
                          fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                          fontFamily: FontUtils.FONT_FAMILY,
                          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                        ),
                        tabs: const [
                          Tab(text: "Settle Up",),
                          Tab(text: "Balance",),
                          Tab(text: "Total",),
                          Tab(text: "Chart",)
                        ],
                      ),
                      decoration: const BoxDecoration(
                          color: white,
                          border: Border(
                              bottom: BorderSide(width: 1,color: borderColor),
                              top: BorderSide(width: 1,color: borderColor)
                          )
                      ),
                    ),
                    Flexible(child: Box(
                      bgColor: white,
                      child: TabBarView(
                        children: [
                          _settlement(),
                          _balances(),
                          _total(),
                          _chart(),
                        ],
                      ),
                    ))
                  ],
                )
            )
        )
      ],
    );
  }

  Widget _settlement(){
    return ListView(
      padding: EdgeInsets.only(top: 20,bottom: 20),
      children: [
        SettlementCard(
            group: Group(
                name: "name",
                type: "type",
                createdAt: "createdAt",
                updatedAt: "updatedAt",
                avatar: "avatar",
                inviteCode: "inviteCode",
                members: [])
        )
      ],
    );
  }

  Widget _balances(){
    return ListView(
      padding: EdgeInsets.only(top: 20,bottom: 20),
      children: [
        BalanceCard(
            group: Group(
                name: "name",
                type: "type",
                createdAt: "createdAt",
                updatedAt: "updatedAt",
                avatar: "avatar",
                inviteCode: "inviteCode",
                members: []
            )
        )
      ],
    );
  }

  Widget _total(){
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          children: [
            Expanded(
              child: Content(
                text: "Group spending summary",
                color: ColorUtils.TEXT_COLOR_LIGHT,
                fontSize: FontUtils.FONT_SIZE_TEXT,
                fontFamily: FontUtils.FONT_FAMILY,
                fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                textAlign: start,
                padding: const [0,0,0,20],
              ),
            ),
            Content(
              text: DateTimeUtils.getMonth(selectedDate),
              color: ColorUtils.PRIMARY,
              fontSize: FontUtils.FONT_SIZE_TEXT,
              fontFamily: FontUtils.FONT_FAMILY,
              fontWeight: FontUtils.FONT_WEIGHT_HEADER,
              textAlign: start,
              padding: const [0,0,0,20],
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Content(
                  padding: const [0,0,10,5],
                  text: "Total Group Spending",
                  color: ColorUtils.PROMPT_COLOR,
                  fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                  fontFamily: FontUtils.FONT_FAMILY,
                  fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                  textAlign: start,
                ),
            ),
            Box(
              padding: const [0,0,10,5],
              child: InkWell(
                child: const Icon(CupertinoIcons.calendar),
                onTap: ()=>{
                  showMonthPicker(
                    context: context,
                    firstDate: DateTime(DateTime.now().year - 1, 5),
                    lastDate: DateTime(DateTime.now().year + 1, 9),
                    initialDate: selectedDate,
                    locale: Locale("en"),
                  ).then((date) {
                    if (date != null) {
                      setState(() {
                        selectedDate = date;
                      });
                    }
                  })
                },
              ),
            )
          ],
        ),
        Content(
          text: "${Global.getMoneySymbol("IN")} 100",
          color: ColorUtils.TEXT_COLOR_LIGHT,
          fontSize: FontUtils.FONT_SIZE_TITLE,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          textAlign: start,
        ),
        Content(
          padding: const [0,0,10,5],
          text: "Total you paid for",
          color: ColorUtils.PROMPT_COLOR,
          fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          textAlign: start,
        ),
        Content(
          text: "${Global.getMoneySymbol("IN")} 100",
          color: ColorUtils.TEXT_COLOR_LIGHT,
          fontSize: FontUtils.FONT_SIZE_TITLE,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          textAlign: start,
        ),
        Content(
          padding: const [0,0,10,5],
          text: "Your total share",
          color: ColorUtils.PROMPT_COLOR,
          fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          textAlign: start,
        ),
        Content(
          text: "${Global.getMoneySymbol("IN")} 100",
          color: ColorUtils.TEXT_COLOR_LIGHT,
          fontSize: FontUtils.FONT_SIZE_TITLE,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          textAlign: start,
        ),
      ],
    );
  }

  Widget _chart(){
    return Column(
      children: [
        Box(
          height: 100,
          padding: [20,0],
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Content(
                      padding: const [0,0,10,5],
                      text: "My Chart",
                      color: ColorUtils.TEXT_COLOR_MEDIUM,
                      fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                      fontFamily: FontUtils.FONT_FAMILY,
                      fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                      textAlign: start,
                    ),
                  ),
                  Box(
                    padding: const [0,0,10,5],
                    child: InkWell(
                      child: const Icon(CupertinoIcons.calendar),
                      onTap: ()=>{
                        showMonthPicker(
                          context: context,
                          firstDate: DateTime(DateTime.now().year - 1, 5),
                          lastDate: DateTime(DateTime.now().year + 1, 9),
                          initialDate: selectedDate,
                          locale: Locale("en"),
                        ).then((date) {
                          if (date != null) {
                            setState(() {
                              selectedDate = date;
                            });
                          }
                        })
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Box(
                    width: 15,
                    height: 15,
                    bgColor: ColorUtils.VENDOR,
                    radius: DimensionUtils.CORNER_SHARP,
                  ),
                  Content(
                    text: "Group expense",
                    width: 100,
                    color: ColorUtils.PROMPT_COLOR,
                    fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
                    fontFamily: FontUtils.FONT_FAMILY,
                    fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                  ),
                  const Box(
                    margin: [10,0,0,0],
                    width: 15,
                    height: 15,
                    bgColor: ColorUtils.CUSTOMER,
                    radius: DimensionUtils.CORNER_SHARP,
                  ),
                  Content(
                    text: "Your expense",
                    width: 100,
                    color: ColorUtils.PROMPT_COLOR,
                    fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
                    fontFamily: FontUtils.FONT_FAMILY,
                    fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
            child: Box(
              padding: [10],
              child: Chart(),
            )
        )
      ],
    );
  }

}
