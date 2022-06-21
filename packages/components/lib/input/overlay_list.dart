part of components;

class OverlayList extends StatefulWidget {
  const OverlayList({
    Key? key,
    required this.child,
    required this.items,
    required this.selectedValue
  }) : super(key: key);

  final Widget child;
  final List<dynamic> items;
  final ValueChanged selectedValue;
  @override
  _OverlayListState createState() => _OverlayListState();
}

class _OverlayListState extends State<OverlayList> {

  late OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();
  List? filteredList = <dynamic>[];


  @override
  void initState() {
    super.initState();
    filteredList = widget.items;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context)!.insert(this._overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: CompositedTransformTarget(
          link: this._layerLink,
          child: widget.child
      ),
      focusNode: _focusNode,
      onFocusChange: (bool){
        print("focus change $bool");
      },
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size overlaySize = renderBox.size;
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return OverlayEntry(
        builder: (context) => Positioned(
          width: overlaySize.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, overlaySize.height + 5.0),
            child: Material(
              elevation: 4.0,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: screenWidth,
                    maxWidth: screenWidth,
                    minHeight: 0,
                    // max height set to 150
                    maxHeight: 150 ,
                  ),
                  child:_listViewContainer(context)),
            ),
          ),
        ));
  }

  Widget? _listViewContainer(context) {
    double _height = filteredList!.length > 1 ? 150 : 55;
    return Container(
      height: _height,
      color: Colors.white,
      child: _listViewBuilder(context),
    );
  }

  ListView _listViewBuilder(context) {
    return ListView.builder(
      itemCount: filteredList!.length,
      itemBuilder: (context, i) {
        return GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedValue(filteredList![i]);
              });
              FocusScope.of(context).unfocus();
            },
            child: ListTile(
                title: Text(filteredList![i])));
      },
      padding: EdgeInsets.zero,
      shrinkWrap: true,
    );
  }

}
