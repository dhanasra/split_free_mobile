import 'package:components/components.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../widgets/button/app_button.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_utils.dart';
import '../../app/app.dart';
import '../../app/app_routes.dart';
import '../../widgets/dialog/loader_dialog.dart';
import '../../widgets/input/app_text_input.dart';
import '../../bloc/auth/api/auth_api_client.dart';
import '../../bloc/auth/api/auth_repository.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../utils/dimention_utils.dart';
import '../../utils/enum_utils.dart';
import '../../utils/snackbar_utils.dart';
import '../../view_models/auth_view_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late AuthViewModel _viewModel;
  late AuthBloc _bloc;

  @override
  void initState() {
    _viewModel = AuthViewModel(App());
    _bloc = AuthBloc(AuthRepository(authApiClient: AuthApiClient(httpClient: Client())));
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
          actions: [
            Box(
              margin: const [10],
              radius: DimensionUtils.CORNER_ROUND,
              child: InkWell(
                  onTap: ()=>App().setNavigation(context, AppRoutes.APP_SIGN_IN),
                  child: Center(
                    child: Content(
                      text: "login_caps",
                      padding: const [10,0],
                      color: ColorUtils.TEXT_COLOR_DARK,
                      fontSize: FontUtils.FONT_SIZE_TEXT,
                      fontFamily: FontUtils.FONT_FAMILY,
                      fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                    ),
                  )
              ),
            )
          ],
        ),
        body: BlocListener(
            listener: (BuildContext context, state){
              if(state is Success){
                SnackBarUtils.snackBar(
                    context: context,
                    message: "Success! Successfully Signup with us.",
                    type: COLOR_TYPE.SUCCESS
                );
                App().setNavigation(context, AppRoutes.APP_USER_INFO);
              }else if(state is Failure){
                SnackBarUtils.snackBar(
                    context: context,
                    message: "Sorry! something went wrong. Please try again.",
                    type: COLOR_TYPE.ERROR
                );
              }
            },
            bloc: _bloc,
            child: Box(
                bgColor: ColorUtils.BG_COLOR_1,
                margin: const [0,0,0,15],
                child: _body()
            ),
          ),
    );
  }

  Widget _body() {
    return ListView(
      children: [
        Box(
          child: Image.asset("assets/images/signup_banner.png",width: 150,height: 150,),
        ),
        Content(
          text: "signup",
          color: ColorUtils.TEXT_COLOR_DARK,
          fontSize: FontUtils.FONT_SIZE_HEADER,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          margin: const [20,0],
          expanded: true,
          textAlign: start,
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
        Content(
          text: "register_with_email",
          color: ColorUtils.PROMPT_COLOR,
          fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_TEXT,
          margin: const [0,0],
        ),
        AppTextInput.textInputModern(
            hintText: "email_id",
            icon: Icons.alternate_email_rounded,
            controller: _viewModel.emailController,
            margin: const [20,20,20,0]
        ),
        AppTextInput.textInputModern(
            hintText: "password",
            icon: Icons.lock_outline_rounded,
            controller: _viewModel.passwordController
        ),
        AppTextInput.textInputModern(
            hintText: "phone_number",
            icon: Icons.phone_outlined,
            controller: _viewModel.phoneNumberController
        ),
        Box(
          margin: const [20,10],
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: ColorUtils.PROMPT_COLOR,
                fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
                fontFamily: FontUtils.FONT_FAMILY,
                fontWeight: FontUtils.FONT_WEIGHT_TEXT,
                height: 2
              ),
              children: <TextSpan>[
                TextSpan(text: 'terms_conditions_sub_1'.tr()),
                TextSpan(
                    text: 'terms_conditions'.tr(),
                    style: const TextStyle(
                      color: ColorUtils.BUTTON_COLOR_SECONDARY,
                      fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                      }),
                TextSpan(text: 'terms_conditions_sub_2'.tr()),
                TextSpan(
                    text: 'privacy_policy'.tr(),
                    style: const TextStyle(
                      color: ColorUtils.BUTTON_COLOR_SECONDARY,
                      fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                      }),
              ],
            ),
          ),
        ),
        BlocBuilder<AuthBloc,AuthState>(
          bloc: _bloc,
          builder: (context, state) {
            return AppButton.commonButton(
                    text: "continue",
                    isLoading: state is Loading ? true : false,
                    onClick: ()=>_bloc.add(SignupEvent(
                      emailId: _viewModel.emailController.text,
                      password: _viewModel.passwordController.text,
                      phoneNumber: _viewModel.phoneNumberController.text
                    )),
                    margin: [20,20,40,20]
                );
          },
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
