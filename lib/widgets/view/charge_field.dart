import 'package:components/components.dart';
import 'package:flutter/material.dart';

class ChargeField extends StatefulWidget {
  final Widget? child;
  final bool isAmountLabel;
  final bool isNone;
  final bool isCloseable;
  final VoidCallback onClick;
  final bool addInput;
  final String? amount;
  final double? inputWidth;
  final TextEditingController? chargeController;
  final TextEditingController? amountController;
  final List<double> margin;

  const ChargeField({
    Key? key,
    this.child,
    this.margin = const [],
    this.isAmountLabel = false,
    this.isNone = false,
    this.isCloseable = true,
    this.inputWidth = 80,
    required this.onClick,
    this.amount,
    this.addInput = true,
    this.chargeController,
    this.amountController
  }):super(key:key);

  @override
  _ChargeFieldState createState() => _ChargeFieldState();
}

class _ChargeFieldState extends State<ChargeField> {
  @override
  Widget build(BuildContext context) {
    return Box(
      padding: const [5,10,0,0],
      margin: widget.margin,
      bgColor: white,
      child: Row(
        mainAxisSize: max,
        children: [
          Visibility(
            visible: widget.isCloseable,
            child:SizedBox(
                width: 40,
                child: IconButton(
                    onPressed: widget.onClick,
                    icon: const Icon(Icons.cancel,size: 20,color: iconColor,)
                ),
              ),
          ),
          Visibility(
            visible: !widget.addInput,
            child: Expanded(child: widget.child??const Spacer()),
          ),
          Visibility(
            visible: widget.addInput ,
              child: Expanded(
                  child: Box(
                    margin: const [0,10,0,0],
                    bottomBorder: true,
                    child: TextInput(
                      width: 80,
                      contentPadding: const [0,5],
                      textHeight: 1.2,
                      height: 30,
                      hintText: "charge_name",
                      textAlign: start,
                      controller: widget.chargeController,
                      isFilled :false,
                      noBorder: true,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
          ),
          Box(
              width: widget.inputWidth,
              bottomBorder: true,
              child: Row(
                mainAxisAlignment: mainSpace,
                children: [
                  Label(label:Global.getMoneySymbol("IN"),fontWeight: FontWeight.w400,color: widget.isAmountLabel?textColor:promptColor,),
                  widget.isAmountLabel?
                  Label(
                    bgColor: white,
                    color: textColor,
                    fontSize: 14,
                    textAlign: end,
                    textHeight: 1.2,
                    width: 60,
                    fontWeight: FontWeight.w500,
                    textPadding: const [0,5],
                    label: widget.amount??"00.00",
                    mainAxisAlignment: mainEnd,
                  ):
                  TextInput(
                    fontSize: 14,
                    width: widget.inputWidth!-20,
                    textAlign: end,
                    textHeight: 1.2,
                    height: 30,
                    hintText: "00.00",
                    hintColor: promptColor,
                    contentPadding: const [0,5],
                    isFilled: false,
                    noBorder: true,
                    controller: widget.amountController,
                    fontWeight: FontWeight.w500,
                    enabledBorderColor: borderColor,
                    focusedBorderColor: borderColor,
                    radius: blunt,
                    textAlignVertical: TextAlignVertical.top,
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
