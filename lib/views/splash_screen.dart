import 'package:components/components.dart';
import 'package:flutter/material.dart';
import '../view_models/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashViewModel _viewModel;

  @override
  void initState() {
    _viewModel = SplashViewModel(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _body(),
          const Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: ColorShader(
                child: Content(
                  text: "company_name",
                  color: primaryColor,
                  fontSize: 12,
                ),
              )
          )
        ],
      ),
    );
  }

  Widget _body() {
    return Box(
        expanded: true,
        alignment: center,
        bgColor: white,
        child:RotationAnimation(
            child: const Box(
                width: 80,
                height: 80,
                asset: 'logo.png'
            ),
            duration: 8,
            controller: (control)=>control.forward(),
            animation: (anim){}
        )
    );
  }
}
