import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Option extends StatelessWidget {

  final IconData icon;
  final String title;
  final String? subTitle;
  final VoidCallback onClick;
  final Color bgColor;
  final Color iconColor;
  final Color txtColor;
  final bool isBorder;

  const Option({
    Key? key,
    required this.onClick,
    required this.title,
    required this.icon,
    this.subTitle,
    this.bgColor = white,
    this.isBorder = true,
    this.iconColor = textColor,
    this.txtColor = textColor
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onClick,
        child: Box(
          bgColor: bgColor,
          decoration: isBorder?const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: borderColor
                  )
              )
          ):null,
          child: ListTile(
            tileColor: bgColor,
            title: Label(
              mainAxisAlignment: mainStart,
              textAlign: start,
              fontFamily: GoogleFonts.openSans().fontFamily,
              fontSize: 14,
              color: txtColor,
              label: title,),
            subtitle: subTitle!=null?Label(
              label: subTitle!,
              color: borderColor,
              mainAxisAlignment: mainStart,
              fontSize: 12,
              margin: const [0,0,5,0],
              textAlign: start,
            ):null,
            leading: Icon(icon,color: iconColor),
            trailing: Icon(Icons.keyboard_arrow_right,color: iconColor),
          ),
        ),
      ),
    );
  }
}
