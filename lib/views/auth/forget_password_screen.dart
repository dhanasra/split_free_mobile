import 'package:components/components.dart';
import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../widgets/button/app_button.dart';
import '../../../widgets/input/app_text_input.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_utils.dart';
import '../../app/app_routes.dart';
import '../../view_models/auth_view_model.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
          child: Image.asset("assets/images/forgot_password_banner.png",width: 250,height: 250,),
        ),
        Content(
          text: "forgot",
          color: ColorUtils.TEXT_COLOR_DARK,
          fontSize: FontUtils.FONT_SIZE_HEADER,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          margin: const [20,0],
          expanded: true,
          textAlign: start,
        ),
        Content(
          text: "password_?",
          color: ColorUtils.TEXT_COLOR_DARK,
          fontSize: FontUtils.FONT_SIZE_HEADER,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          margin: const [20,0],
          expanded: true,
          textAlign: start,
        ),
        Content(
          text: "forgot_password_sub",
          color: ColorUtils.PROMPT_COLOR,
          fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_TEXT,
          margin: const [20,10],
          textHeight: 1.5,
          expanded: true,
          textAlign: start,
        ),
        AppTextInput.textInputModern(
            hintText: "email_id_phone_number",
            icon: Icons.alternate_email_rounded,
            controller: _viewModel.emailController,
            margin: const [20,20,20,0]
        ),
        AppButton.commonButton(
            text: "submit",
            isLoading: false,
            onClick: ()=>App().setNavigation(context, AppRoutes.APP_OTP),
            margin: [20,20,40,20]
        ),
      ],
    );
  }
}
