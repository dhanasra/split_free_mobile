import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app/app.dart';
import '../../utils/color_utils.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
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
    return ListView(children: [],);
  }
}
