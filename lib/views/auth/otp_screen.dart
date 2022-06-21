import 'package:components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../app/app.dart';
import '../../../widgets/button/app_button.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_utils.dart';
import '../../app/app_routes.dart';
import '../../utils/dimention_utils.dart';
import '../../view_models/auth_view_model.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
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
          child: Image.asset("assets/images/otp_banner.png",width: 250,height: 250,),
        ),
        Content(
          text: "enter_otp",
          color: ColorUtils.TEXT_COLOR_DARK,
          fontSize: FontUtils.FONT_SIZE_HEADER,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          margin: const [20,0],
          expanded: true,
          textAlign: start,
        ),
        Content(
          text: "code_sent".tr()+"+91 8056384773",
          color: ColorUtils.PROMPT_COLOR,
          fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_TEXT,
          margin: const [20,10],
          textHeight: 1.5,
          expanded: true,
          textAlign: start,
        ),
        Box(
          margin: const [20,20],
          child: Pinput(
            length: 4,
            controller: _viewModel.otpController,
            mainAxisAlignment: mainStart,
            defaultPinTheme: pinTheme(0),
            focusedPinTheme: pinTheme(1),
            followingPinTheme: pinTheme(2)
          ),
        ),
        AppButton.commonButton(
            text: "submit",
            isLoading: false,
            onClick: ()=>App().setNavigation(context, AppRoutes.APP_RESET_PASSWORD),
            margin: [20,20,40,20]
        ),
      ],
    );
  }

  PinTheme pinTheme(int type){
    return PinTheme(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(DimensionUtils.CORNER_BLUNT_1)),
            border: Border.all(
                color: ColorUtils.BORDER_COLOR_DARK
            )
        ),
        textStyle: TextStyle(
          color: ColorUtils.TEXT_COLOR_DARK,
          fontSize: FontUtils.FONT_SIZE_TEXT,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_TEXT,
        )
    );
  }
}
