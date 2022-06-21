part of components;

class HorizontalItemList extends StatefulWidget {
  const HorizontalItemList({
    Key? key,
    required this.items
  }) : super(key: key);

  final List<String> items;

  @override
  _HorizontalItemListState createState() => _HorizontalItemListState();
}

class _HorizontalItemListState extends State<HorizontalItemList> {

  @override
  Widget build(BuildContext context) {
    return Box(
      padding: [5],
      height: 50,
      child: body(),
    );
  }

  Widget body(){
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: colorArray.length,
        itemBuilder: (context,index){
          return Box(
            height: 15,
            margin: [10,0],
            borderColor: borderColor,
            child: Content(
              text: widget.items[index],
            ),
          );
        }
    );
  }
}
