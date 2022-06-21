import 'package:components/components.dart';
import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../widgets/button/app_button.dart';
import '../../../widgets/input/app_text_input.dart';
import '../../../widgets/dialog/loader_dialog.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/dimention_utils.dart';
import '../../../utils/font_utils.dart';
import '../../app/app_routes.dart';
import '../../view_models/auth_view_model.dart';  

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthViewModel _viewModel;

  @override
  void initState() {
    _viewModel = AuthViewModel(App());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            color: ColorUtils.ICON_COLOR_DARK,
            splashRadius: 20,
            onPressed: ()=>App().setBackNavigation(context),
          ),
        ),
        body: Box(
          bgColor: ColorUtils.BG_COLOR_1,
          child: _body()
      ),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        Box(
          child: Image.asset("assets/images/login_banner.png",width: 150,height: 150,),
        ),
        Content(
          text: "login",
          color: ColorUtils.TEXT_COLOR_DARK,
          fontSize: FontUtils.FONT_SIZE_HEADER,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          margin: const [20,0],
          expanded: true,
          textAlign: start,
        ),
        AppTextInput.textInputModern(
            hintText: "email_id_phone_number",
            icon: Icons.alternate_email_rounded,
            controller: _viewModel.emailPhoneNumberController,
            margin: const [20,20,20,0]
        ),
        AppTextInput.textInputModern(
            hintText: "password",
            icon: Icons.lock_outline_rounded,
            controller: _viewModel.passwordController,
            suffixText: "forgot_?",
            suffixTextClick: ()=>App().setNavigation(context, AppRoutes.APP_FORGET_PASSWORD)
        ),
        AppButton.commonButton(
            text: "continue",
            isLoading: false,
            onClick: ()=>{},
            margin: [20,20,40,20]
        ),
        Content(
          text: "login_with",
          color: ColorUtils.PROMPT_COLOR,
          fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_TEXT,
          margin: const [0,0],
        ),
        ExpandedRow(
          margin: const [20,25],
          children: [
            Box(
              borderColor: ColorUtils.BORDER_COLOR_LIGHT,
              radius: DimensionUtils.CORNER_BLUNT_2,
              padding: const [10,5],
              margin: const [0,5,0,0],
              child: InkWell(
                  onTap: ()=>showLoaderDialog(),
                  child: Image.asset("assets/images/google.png",width: 30,height: 30,)
              ),
            ),
            Box(
              borderColor: ColorUtils.BORDER_COLOR_LIGHT,
              radius: DimensionUtils.CORNER_BLUNT_2,
              padding: const [10,5],
              margin: const [5,0],
              child: InkWell(
                  child: Image.asset("assets/images/facebook.png",width: 30,height: 30,)
              ),
            ),
            Box(
              borderColor: ColorUtils.BORDER_COLOR_LIGHT,
              radius: DimensionUtils.CORNER_BLUNT_2,
              padding: const [10,5],
              margin: const [5,0,0,0],
              child: InkWell(
                  child: Image.asset("assets/images/twitter.png",width: 30,height: 30,)
              ),
            )
          ],
        ),
      ],
    );
  }

  Future showLoaderDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return  const AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            content : LoaderDialog(),
          );
        }
    );
  }
}
