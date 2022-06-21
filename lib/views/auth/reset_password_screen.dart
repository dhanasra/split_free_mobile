import 'package:components/components.dart';
import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../widgets/button/app_button.dart';
import '../../../widgets/input/app_text_input.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_utils.dart';
import '../../view_models/auth_view_model.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
          child: Image.asset("assets/images/reset_password_banner.png",width: 250,height: 250,),
        ),
        Content(
          text: "reset",
          color: ColorUtils.TEXT_COLOR_DARK,
          fontSize: FontUtils.FONT_SIZE_HEADER,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          margin: const [20,0],
          expanded: true,
          textAlign: start,
        ),
        Content(
          text: "password",
          color: ColorUtils.TEXT_COLOR_DARK,
          fontSize: FontUtils.FONT_SIZE_HEADER,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          margin: const [20,0,0,20],
          expanded: true,
          textAlign: start,
        ),
        AppTextInput.textInputModern(
            hintText: "new_password",
            icon: Icons.lock_outline_rounded,
            controller: _viewModel.newPasswordController
        ),
        AppTextInput.textInputModern(
            hintText: "confirm_new_password",
            icon: Icons.lock_outline_rounded,
            controller: _viewModel.confirmPasswordController
        ),
        AppButton.commonButton(
            text: "submit",
            onClick: ()=>{},
            margin: [20,20,40,20]
        ),
      ],
    );
  }
}
