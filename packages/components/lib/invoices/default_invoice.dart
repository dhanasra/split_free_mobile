part of components;

class DefaultInvoice extends StatelessWidget {
  const DefaultInvoice({
    Key? key,
    this.theme = const Color(0xFF4ABDAC)
  }) : super(key: key);

  final Color? theme;

  @override
  Widget build(BuildContext context) {
    return Box(
      decoration: BoxDecoration(
          color: bright,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: borderColor)
      ),
      margin: const [0],
      padding: const [0,0,0,5],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child:
            Row(
                children: [
                  Expanded(
                    child: Row(children: [
                      const Box(width: 50,height: 50,asset: "logo.png",radius: 30,margin: [5,4],),
                      Column(
                        mainAxisAlignment: mainCenter,
                        crossAxisAlignment: crossStart,
                        children: [
                          Content(text: "Business Name",fontSize: 12,textAlign: start,fontWeight: FontWeight.bold,color: primaryColor,),
                          Content(text: "8056384773",fontSize: 8,textAlign: start,fontWeight: FontWeight.bold,padding: [0,0,5,0],),
                        ],
                      )
                    ],),
                  ),
                  VerticalDivider(
                      width: 1,
                      color: borderColor
                  ),
                  Box(
                    width: 120,
                    child: Column(
                      mainAxisAlignment: mainCenter,
                      children: [
                        ExpandedRow(children: [
                          Content(text: "Invoice No :",textAlign: start,fontSize:7,padding: [2,0,0,0]),
                          Content(text: "#22",textAlign: end,fontSize: 7,padding: [0,2,0,0],),
                        ],),
                        ExpandedRow(children: [
                          Content(text: "Invoice Date :",textAlign: start,fontSize: 7,padding: [2,0,4,0]),
                          Content(text: "10-01-2022",textAlign: end,fontSize: 7,padding: [0,2,4,0],),
                        ],),
                      ],
                    ),
                  )
                ]
            ),),
          ExpandedRow(
              bgColor: theme?.withOpacity(0.1)??colorArray[0],
              padding: [2],
              children: [
                Content(text: "BILL TO",fontSize: 7,textAlign: start,fontWeight: FontWeight.bold,color: theme,),
                Content(text: "SHIP TO",fontSize: 7,textAlign: start,fontWeight: FontWeight.bold,color: theme,),
              ]
          ),
          ExpandedRow(
              padding: [2,5],
              children: [
                Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    Content(text: "RAKESH ENTERPRISES",fontSize: 7,fontWeight: FontWeight.w500,),
                    Content(text: "2nd Floor, 12th Main Road, Sector 6, Tamilnadu, 625009",fontSize: 6,textAlign: start),
                    Content(text: "GSTIN : 29BDNPXXXXXXXX",fontSize: 6,),
                    Content(text: "PLACE OF SUPPLY : Mumbai",fontSize: 6,),
                    Content(text: "PHONE NUMBER : 8056384773",fontSize: 6,),
                  ],
                ),
                Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    Content(text: "RAKESH ENTERPRISES",fontSize: 7,fontWeight: FontWeight.w500,),
                    Content(text: "2nd Floor, 12th Main Road, Sector 6, Tamilnadu, 625009",fontSize: 6,textAlign: start,),
                    Content(text: "GSTIN : 29BDNPXXXXXXXX",fontSize:6,),
                  ],
                )
              ]
          ),
          Box(
            padding: [2,2,5,8],
            child: IMTable.invoiceTable(
              [
                Items(name: "A1 Rice Flour", rate: "120", qty: "2 KG", disc: "12%", mrp: "130", tax: "-", amount: "1000"),
                Items(name: "RSR seed oil", rate: "120", qty: "2 KG", disc: "12%", mrp: "130", tax: "-", amount: "1000"),
                Items(name: "Tide powder", rate: "120", qty: "2 KG", disc: "12%", mrp: "130", tax: "-", amount: "1000"),
                Items(name: "Asiant paints", rate: "120", qty: "2 KG", disc: "12%", mrp: "130", tax: "-", amount: "1000"),
                Items(name: "VV sugar", rate: "120", qty: "2 KG", disc: "12%", mrp: "130", tax: "-", amount: "1000"),
              ],
              headerTheme: theme
            )
          ),
          IntrinsicHeight(
            child:  Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: crossStart,
                      children: const [
                      Content(text: "BANK DETAILS",textAlign: start,fontSize: 7,padding: [2,0,0,5],fontWeight: FontWeight.w500,),

                      ExpandedRow(children: [
                        Content(text: "Name :",textAlign: start,fontSize: 7,padding: [2,0]),
                        Content(text: "Dhana Sekaran",textAlign: start,fontSize: 7,padding: [2,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Account Number :",textAlign: start,fontSize: 7,padding: [2,0]),
                        Content(text: "12345667788",textAlign: start,fontSize: 7,padding: [2,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "IFSC Code :",textAlign: start,fontSize: 7,padding: [2,0]),
                        Content(text: "6767676767",textAlign: start,fontSize: 7,padding: [2,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Bank :",textAlign: start,fontSize: 7,padding: [2,0]),
                        Content(text: "SBI Bank",textAlign: start,fontSize: 7,padding: [2,0],),
                      ],),
                      SizedBox(height: 20,),
                      Content(text: "NOTES",textAlign: start,fontSize: 7,padding: [2],fontWeight: FontWeight.w500,),
                    ],),

                  ),
                  VerticalDivider(
                      width: 1,
                      color: borderColor
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: crossEnd,
                      children: [
                      ExpandedRow(children: [
                        Content(text: "Taxable Amount :",textAlign: end,fontSize: 7,padding: [0]),
                        Content(text: "${Global.getMoneySymbol("IN")} 120",textAlign: end,fontSize: 7,padding: [4,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Subtotal :",textAlign: end,fontSize: 7,padding: [0]),
                        Content(text: "${Global.getMoneySymbol("IN")} 220",textAlign: end,fontSize: 7,padding: [4,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Round Off :",textAlign: end,fontSize: 7,padding: [0]),
                        Content(text: "${Global.getMoneySymbol("IN")} 12",textAlign: end,fontSize: 7,padding: [4,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Discount :",textAlign: end,fontSize: 7,padding: [0]),
                        Content(text: "${Global.getMoneySymbol("IN")} -10",textAlign: end,fontSize: 7,padding: [4,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Delivery Charges :",textAlign: end,fontSize: 7,padding: [0]),
                        Content(text: "${Global.getMoneySymbol("IN")} 100",textAlign: end,fontSize: 7,padding: [4,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Total :",textAlign: end,fontSize: 7,padding: [0],fontWeight: FontWeight.w500,),
                        Content(text: "${Global.getMoneySymbol("IN")} 320",textAlign: end,fontSize: 7,padding: [4,0],fontWeight: FontWeight.w500,),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Received :",textAlign: end,fontSize: 7,padding: [0]),
                        Content(text: "${Global.getMoneySymbol("IN")} 120",textAlign: end,fontSize: 7,padding: [4,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Balance :",textAlign: end,fontSize: 7,padding: [0],fontWeight: FontWeight.w500,),
                        Content(text: "${Global.getMoneySymbol("IN")} 100",textAlign: end,fontSize: 7,padding: [4,0],fontWeight: FontWeight.w500,),
                      ],),
                      Content(text: "Total Amount In Words",textAlign: end,fontSize: 7,padding: [4,4,6,4],fontWeight: FontWeight.w500,),
                      Content(text: "Hundred ten",textAlign: end,fontSize: 7,padding: [4,0],fontWeight: FontWeight.w500,),
                    ],
                    )
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}
