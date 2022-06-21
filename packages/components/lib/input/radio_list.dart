part of components;

class RadioList extends StatefulWidget {
  const RadioList({
    Key? key,
    required this.getSelectedValue,
    required this.options
  }) : super(key: key);

  final ValueChanged<dynamic> getSelectedValue;
  final List<String> options;

  @override
  RadioListState createState() => RadioListState();
}

class RadioListState extends State<RadioList> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.options.length,
      shrinkWrap: true,
      itemBuilder: (context,index){
        return RadioListTile(
          value: index,
          groupValue: value,
          onChanged: (ind){
            setState(() => value = ind as int);
            widget.getSelectedValue(widget.options[index]);
            },
          title: Content( text:widget.options[index],textAlign: start,fontSize: 16,),
        );
      },
      separatorBuilder: (context,state){
        return const Divider(height: 1,);
      },
    );
  }
}