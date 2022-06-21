import 'package:components/components.dart';
import 'package:flutter/material.dart';

import '../../app/app.dart';
import '../../utils/color_utils.dart';
import '../../utils/font_utils.dart';

class StackButton extends StatefulWidget {
  final Widget child;
  final String btnText;
  final String route;
  final IconData icon;

  const StackButton({
    Key? key,
    required this.btnText,
    required this.route,
    required this.icon,
    required this.child,
  }) : super(key:key);

  @override
  _StackButtonState createState() => _StackButtonState();
}

class _StackButtonState extends State<StackButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Align(
            alignment: Alignment.bottomCenter,
            child: Box(
              margin: const [0, 10],
              child: FloatingActionButton.extended(
                  onPressed: () {
                    App().setNavigation(context, widget.route);
                  },
                  icon: Icon(widget.icon),
                  backgroundColor: ColorUtils.BUTTON_COLOR_PRIMARY,
                  label: Content(
                    text: widget.btnText,
                    fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                    color: ColorUtils.BUTTON_TEXT_COLOR_DARK,
                    fontFamily: FontUtils.FONT_FAMILY,
                    fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                  )
              ),
            )
        ),
      ],
    );
  }
}