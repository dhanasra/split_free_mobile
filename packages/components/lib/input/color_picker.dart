part of components;

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    Key? key,
    this.width,
    this.height,
    this.padding = const [],
    this.margin = const [],
    required this.selected,
  }) : super(key: key);

  //overall division
  final double? width;
  final double? height;
  final ValueChanged<Color> selected;
  final List<double>? padding;
  final List<double>? margin;

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Box(
      margin: widget.margin??[0],
      padding: widget.padding??[15,5],
      width: widget.width,
      height: widget.height??50,
      child: body(),
    );
  }

  Widget body(){
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: colorArray.length,
      itemBuilder: (context,index){
        return InkWell(
            onTap: (){
              setState(() {
                selectedIndex = index;
              });
              widget.selected(colorArray[index]);
            },
            child: Box(
              width: 35,
              height: 15,
              margin: const [0,10,0,0],
              bgColor: colorArray[index],
              child: Visibility(
                visible: selectedIndex==index,
                child: const Icon(Icons.check,color: white,),
              ),
            )
        );
      }
    );
  }
}
