import 'package:components/components.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';

class LoaderDialog extends StatelessWidget {
  const LoaderDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Box(
          bgColor: ColorUtils.BG_COLOR_1,
          width: 100,
          height: width/4,
          padding: const [30],
          child: const CircularProgressIndicator(),
        )
      ],
    );
  }
}
