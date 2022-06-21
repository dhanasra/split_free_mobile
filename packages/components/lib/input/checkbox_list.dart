part of components;

class CheckboxList extends StatefulWidget {
  const CheckboxList({
    Key? key,
    required this.getSelectedValues,
    required this.options
  }) : super(key: key);

  final ValueChanged<List<dynamic>> getSelectedValues;
  final List<String> options;

  @override
  CheckboxListState createState() => CheckboxListState();
}

class CheckboxListState extends State<CheckboxList> {

  late Map<String, bool> map = {};

  var holder_1 = [];
  var keyList = [];
  var values = [];

  @override
  void initState() {
    super.initState();
    map = { for (var v in widget.options) v: false };
    keyList = map.keys.toList();
    values = map.entries.toList();
  }

  List<dynamic> getItems(){
    holder_1.clear();
    map.forEach((key, value) {
      if(value == true) {
        holder_1.add(key);
      }
    });
    return holder_1;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: keyList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return CheckboxListTile(
              title: Content( text:keyList[index],textAlign: start,),
              value: map[keyList[index]],
              activeColor: primaryColor,
              checkColor: white,
              onChanged: (value) {
                setState(() {
                  map[keyList[index]] = value!;
                });
                widget.getSelectedValues(getItems());
              },
            );
          },

    );
  }
}