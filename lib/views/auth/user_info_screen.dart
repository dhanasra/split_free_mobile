import 'package:components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../../app/app.dart';
import '../../../widgets/button/app_button.dart';
import '../../../widgets/input/app_text_input.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/font_utils.dart';
import '../../app/app_routes.dart';
import '../../bloc/auth/api/auth_api_client.dart';
import '../../bloc/auth/api/auth_repository.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../utils/enum_utils.dart';
import '../../utils/snackbar_utils.dart';
import '../../view_models/auth_view_model.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  late AuthViewModel _viewModel;
  late var selectedLocale = "en";
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
      ),
      body: BlocListener(
        listener: (BuildContext context, state){
          if(state is Added){
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
        Content(
          text: "user_info_title",
          color: ColorUtils.TEXT_COLOR_DARK,
          fontSize: FontUtils.FONT_SIZE_HEADER,
          fontFamily: FontUtils.FONT_FAMILY,
          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          margin: const [20,0],
          expanded: true,
          textAlign: start,
        ),
        Box(
          margin: const [20,0],
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
                TextSpan(text: 'user_info_sub'.tr()),
                TextSpan(
                    text: 'app_name'.tr(),
                    style: const TextStyle(
                      color: ColorUtils.BUTTON_COLOR_PRIMARY,
                      fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                    ),
                )
              ],
            ),
          ),
        ),
        AppTextInput.textInputModern(
            hintText: "full_name",
            icon: Icons.person_outline_rounded,
            controller: _viewModel.fullNameController,
            margin: const [20,20,20,0]
        ),
        InkWell(
          child: AppTextInput.textInputModern(
              hintText: "language",
              isEnabled: false,
              icon: Icons.language_rounded,
              controller: _viewModel.languageController
          ),
          onTap: ()=>showLocaleBottomSheet(context: context),
        ),
        BlocBuilder<AuthBloc,AuthState>(
          bloc: _bloc,
          builder: (context, state) {
            return AppButton.commonButton(
                text: "continue",
                isLoading: state is Loading ? true : false,
                onClick: ()=>_bloc.add(AddUserDetailEvent(
                    email: _viewModel.emailController.text,
                    fullName: _viewModel.fullNameController.text,
                    phone: _viewModel.phoneNumberController.text,
                    registrationStatus: "confirmed",
                    locale: _viewModel.getLocale()
                )),
                margin: [20,20,40,20]
            );
          },
        ),
      ],
    );
  }

  showLocaleBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: ColorUtils.BG_COLOR_1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        builder: (context) =>
            DraggableScrollableSheet(
                initialChildSize: 0.5,
                minChildSize: 0.3,
                maxChildSize: 0.5,
                expand: false,
                builder: (_, controller) =>
                    Box(
                      margin: const [5,20],
                      child:
                        GridView.builder(
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0),
                            itemCount: _viewModel.supportedLocales.length,
                            itemBuilder: (BuildContext context, index){
                              return Box(
                                child: RadioListTile(
                                  value: _viewModel.supportedLocales[index]["locale"].toString(),
                                  groupValue: selectedLocale,
                                  onChanged: (val){
                                    Navigator.pop(context);
                                    selectedLocale = val.toString();
                                    _viewModel.languageController.text = _viewModel.supportedLocales[index]["label"].toString();
                                    setState(() {});
                                  },
                                  title: Content(
                                    text: _viewModel.supportedLocales[index]["label"].toString(),
                                    textAlign: start,
                                    color: ColorUtils.TEXT_COLOR_DARK,
                                    fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                                    fontFamily: FontUtils.FONT_FAMILY,
                                    fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                                  ),
                                  subtitle: Content(
                                    text: _viewModel.supportedLocales[index]["converted_label"].toString(),
                                    textAlign: start,
                                    color: ColorUtils.PROMPT_COLOR,
                                    fontSize: FontUtils.FONT_SIZE_TEXT_MINI,
                                    fontFamily: FontUtils.FONT_FAMILY,
                                    fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                                  ),
                                ),
                                borderColor: ColorUtils.BORDER_COLOR_LIGHT,
                                margin: const [10],
                                isShadow: true,
                              );
                            }
                        )
                    )
            )
    );
  }
}
