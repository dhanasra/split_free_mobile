part of components;

class RichColumn extends StatefulWidget {
  const RichColumn({
    Key? key,
    this.bgColor,
    this.borderColor,
    this.width,
    this.height,
    this.borderWidth,
    this.radius = blunt,
    this.isShadow = false,
    this.padding = const [],
    this.margin = const [],
    this.constraints,
    this.bottomBorder = false,
    this.decoration,
    this.alignment,
    this.border,
    this.children = const [],
    this.mainAxisAlignment = mainStart,
    this.crossAxisAlignment = crossCenter
  }) : super(key: key);


  final Color? bgColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? borderWidth;
  final double radius;
  final bool isShadow;
  final bool bottomBorder;
  final List<double> padding;
  final List<double> margin;
  final BoxConstraints? constraints;
  final BoxDecoration? decoration;
  final Alignment? alignment;
  final Border? border;

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  _RichColumnState createState() => _RichColumnState();
}

class _RichColumnState extends State<RichColumn> {
  @override
  Widget build(BuildContext context) {
    return Box(
      bgColor: widget.bgColor,
      borderColor: widget.borderColor,
      width: widget.width,
      height: widget.height,
      borderWidth: widget.borderWidth,
      radius: widget.radius,
      isShadow: widget.isShadow,
      padding: widget.padding,
      margin: widget.margin,
      constraints: widget.constraints,
      bottomBorder: widget.bottomBorder,
      decoration: widget.decoration,
      alignment: widget.alignment,
      border: widget.border,
      child: body(),
    );
  }

  Widget body(){
    return Column(
        mainAxisAlignment: widget.mainAxisAlignment,
        crossAxisAlignment: widget.crossAxisAlignment,
        children: widget.children
    );
  }
}
