import 'dart:math';

import 'package:components/components.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:split_free/utils/color_utils.dart';
import 'package:split_free/utils/font_utils.dart';

import '../../utils/date_utils.dart';

class Chart extends StatelessWidget {
  Chart({Key? key}) : super(key: key);

  // Generate some dummy data for the cahrt
  // This will be used to draw the red line
  final List<FlSpot> dummyData1 = List.generate(6, (index) {
    return FlSpot(index.toDouble(), index!*1000 * Random().nextDouble());
  });

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(6, (index) {
    return FlSpot(index.toDouble(), index*1000 * Random().nextDouble());
  });


  @override
  Widget build(BuildContext context) {
    return LineChart(
          LineChartData(
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 60,
                  getTitlesWidget: (val,data){
                    return Content(
                      text: "${Global.getMoneySymbol("IN")} ${data.formattedValue}",
                      width: 100,
                      color: ColorUtils.PROMPT_COLOR,
                      fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
                      fontFamily: FontUtils.FONT_FAMILY,
                      fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                    );
                  },
                )
              ),
              rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 20,
                    getTitlesWidget: (val,data){
                      return const Box();
                    },
                  ),

              ),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (val,data){
                        return Content(
                          text: DateTimeUtils.getMonthByIndex(data.formattedValue),
                          width: 100,
                          padding: const [0,0,20,0],
                          color: ColorUtils.PROMPT_COLOR,
                          fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                          fontFamily: FontUtils.FONT_FAMILY,
                          fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                        );
                      },
                      reservedSize: 60,
                    interval: 1
                  )
              ),
              topTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: false
                  )
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: dummyData1,
                isCurved: true,
                barWidth: 2,
                color: ColorUtils.CUSTOMER,
              ),
              // The orange line
              LineChartBarData(
                spots: dummyData2,
                isCurved: true,
                barWidth: 2,
                color: ColorUtils.VENDOR,
              )
            ],
          )
    );
  }
}
