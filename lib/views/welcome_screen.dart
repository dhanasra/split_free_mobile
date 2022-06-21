import 'package:components/components.dart';
import 'package:flutter/material.dart';

import '../app/app.dart';
import '../app/app_routes.dart';
import '../widgets/button/app_button.dart';
import '../utils/color_utils.dart';
import '../utils/font_utils.dart';
import '../view_models/welcome_view_model.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late WelcomeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = WelcomeViewModel(App());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Box(
          bgColor: ColorUtils.BG_COLOR_1,
          child: _body()
      ),
    );
  }

  Widget _body(){
    return Column(
      children: [
        Expanded(
          child: CarouselContainer(
            items: _viewModel.carouselContainerData.map((e){
              return _buildSliderCard(e);
            }).toList(),
            controller: PageController(),
            indicatorIsVisible: true,
            containerHeight: 550,
          ),
        ),
        Box(
          margin: const [15,15,0,30],
          child: Column(
            mainAxisAlignment: mainEnd,
            children: [
              AppButton.commonButton(
                  text: "launch",
                  onClick: ()=>App().setNavigation(context, AppRoutes.APP_SIGN_UP)
              ),
              ColorShader(
                child: Content(
                  text: "company_name",
                  color: ColorUtils.APP_COLOR_PRIMARY,
                  fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
                  fontFamily: FontUtils.FONT_FAMILY,
                  fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  /*
  Slider card for carousel slider
   */
  Widget _buildSliderCard(List<String> item){
    return Box(
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          Box(asset: item[0],height: 400,width: 400,),
          Content(
            text: item[1],
            color: ColorUtils.TEXT_COLOR_DARK,
            fontSize: FontUtils.FONT_SIZE_HEADER,
            fontFamily: FontUtils.FONT_FAMILY,
            fontWeight: FontUtils.FONT_WEIGHT_HEADER,
          ),
          Content(
            text: item[2],
            color: ColorUtils.TEXT_COLOR_MEDIUM,
            fontSize: FontUtils.FONT_SIZE_TEXT,
            fontFamily: FontUtils.FONT_FAMILY,
            fontWeight: FontUtils.FONT_WEIGHT_TEXT,
            margin: const [10,10],
          ),
        ],
      ),
    );
  }

}
