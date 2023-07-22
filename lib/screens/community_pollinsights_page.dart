import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:syncfusion_flutter_charts/charts.dart';

class PollInsights extends StatefulWidget {
   const PollInsights({super.key});

  @override
  State<PollInsights> createState() => _PollInsightsState();
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}


class _PollInsightsState extends State<PollInsights> {

  String dropdownvalueVotes = 'Day';
  var items = [
    'Day',
    'Hours',
  ];

  String dropdownvaluePollReaction = '10 Days Ago';
  var timeTypes  = [
    '10 Days Ago',
    '10 Months Ago',
    '10 Months Ago',
    'After Poll',
  ];

  final List<ChartData> chartData = [
    ChartData('New participants', 20, Color(0xff33357D)),
    ChartData('Old participants', 330, Color(0xffFE8067)),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Poll Insights",
          style: TextStyle(
            color: Color.fromARGB(255, 40, 40, 40),
            fontWeight: FontWeight.normal,
            fontFamily: 'Lato-Black',
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 237, 238, 255)
                    )
                ),
                shadowColor: const Color.fromRGBO(45, 47, 116, 0.4),
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Text(
                              'What steps do you think the Indian education system can take to better promote critical thinking and analytical skills among students?',
                              style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff282828),
                              ),
                            ),

                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Posted On 29 May 10:39 AM',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Lato-Regular',
                      color: Color(0xff282828)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 237, 238, 255)
                    )
                ),
                shadowColor: const Color.fromRGBO(45, 47, 116, 0.4),
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Overview',
                              style: TextStyle(
                                fontFamily: 'Lato-Bold',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff282828),
                              ),
                            ),
                            Divider(thickness: 1, color: Color(0xffEDEEFF)),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total No.Of Votes',
                                  style: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 14,
                                    color: Color(0xff282828),
                                  ),
                                ),
                                Text(
                                  '140',
                                  style: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 14,
                                    color: Color(0xff282828),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Likes',
                                  style: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 14,
                                    color: Color(0xff282828),
                                  ),
                                ),
                                Text(
                                  '80',
                                  style: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 14,
                                    color: Color(0xff282828),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total No.Of Shares',
                                  style: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 14,
                                    color: Color(0xff282828),
                                  ),
                                ),
                                Text(
                                  '8',
                                  style: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 14,
                                    color: Color(0xff282828),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'New Followers',
                                  style: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 14,
                                    color: Color(0xff282828),
                                  ),
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 14,
                                    color: Color(0xff282828),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Profile Visit',
                                  style: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 14,
                                    color: Color(0xff282828),
                                  ),
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                    fontFamily: 'Roboto-Regular',
                                    fontSize: 14,
                                    color: Color(0xff282828),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 237, 238, 255)
                    )
                ),
                shadowColor: const Color.fromRGBO(45, 47, 116, 0.4),
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Votes',
                                  style: TextStyle(
                                    fontFamily: 'Lato-Bold',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff282828),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Total no.of Votes ',
                                      style: TextStyle(
                                        fontFamily: 'Lato-Regular',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff282828),
                                      ),
                                    ),
                                    Text(
                                      '350',
                                      style: TextStyle(
                                        fontFamily: 'Lato-Bold',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff33357D),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(thickness: 1, color: Color(0xffEDEEFF)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 100,
                                  height: 30,
                                  // color: Colors.white,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color.fromARGB(255, 7, 20, 44),
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                      child: DropdownButtonFormField2<String>(
                                        isExpanded: true,
                                        decoration: InputDecoration(
                                            fillColor: const Color.fromARGB(255, 249, 249, 249),
                                            filled: true,
                                            focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(51, 53 , 125, 0.3)
                                                )
                                            ),
                                            enabledBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xff33357D),
                                              ),
                                            ),
                                            contentPadding: const EdgeInsets.symmetric(vertical: 5),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(4),
                                              borderSide: BorderSide.none,
                                            ),
                                        ),
                                        value: dropdownvalueVotes,
                                        buttonStyleData: const ButtonStyleData(
                                          padding: EdgeInsets.only(right: 8),
                                        ),
                                        iconStyleData: const IconStyleData(
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Color.fromARGB(255,80,80,80),
                                          ),
                                          iconSize: 20,
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                            useSafeArea: true,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12.0),
                                              color: const Color.fromARGB(255,255,255,255),
                                              boxShadow: [
                                                const BoxShadow(
                                                  blurRadius: 8.0,
                                                  color: Color.fromRGBO(45, 47, 116, 0.4),
                                                ), //BoxShadow
                                              ],
                                            ),
                                            elevation: 8
                                        ),
                                        menuItemStyleData: const MenuItemStyleData(
                                          padding: EdgeInsets.symmetric(horizontal: 16),
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'Roboto-Regular',
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff33357D),
                                        ),
                                        onChanged: (String? value) {
                                          setState(() {
                                            dropdownvalueVotes = value!;
                                          });
                                        },
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(
                                              items,
                                              style: const TextStyle(
                                                fontFamily: "Roboto-Regular",
                                                fontSize: 11,
                                                letterSpacing: 1,
                                                color: Color(0xff33357D),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Visibility(
                              visible: dropdownvalueVotes == 'Day',
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(2),
                                child: BarChartMonthData(),
                              ),
                            ),
                            Visibility(
                              visible: dropdownvalueVotes == 'Hours',
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(2),
                                child: BarChartHourData(),
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 237, 238, 255)
                    )
                ),
                shadowColor: const Color.fromRGBO(45, 47, 116, 0.4),
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                const Text(
                                  'Poll Reactions',
                                  style: TextStyle(
                                    fontFamily: 'Lato-Bold',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff282828),
                                  ),
                                ),
                            const Divider(thickness: 1, color: Color(0xffEDEEFF)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.info_outline, color: Color(0xffB1B3B7)),
                                    SizedBox(width: 5,),
                                    Text('Filter and view voter join dates for poll reactions analysis.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Roboto-Regular',
                                        color: Color(0xffB1B3B7),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 130,
                                  height: 30,
                                  // color: Colors.white,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color.fromARGB(255, 7, 20, 44),
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownButtonFormField2<String>(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      fillColor: const Color.fromARGB(255, 249, 249, 249),
                                      filled: true,
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(51, 53 , 125, 0.3)
                                          )
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff33357D),
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    value: dropdownvaluePollReaction,
                                    buttonStyleData: const ButtonStyleData(
                                      padding: EdgeInsets.only(right: 8),
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Color.fromARGB(255,80,80,80),
                                      ),
                                      iconSize: 20,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                        useSafeArea: true,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12.0),
                                          color: const Color.fromARGB(255,255,255,255),
                                          boxShadow: [
                                            const BoxShadow(
                                              blurRadius: 8.0,
                                              color: Color.fromRGBO(45, 47, 116, 0.4),
                                            ), //BoxShadow
                                          ],
                                        ),
                                        elevation: 8
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                    ),
                                    style: const TextStyle(
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff33357D),
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownvaluePollReaction = value!;
                                      });
                                    },
                                    items: timeTypes.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                          style: const TextStyle(
                                            fontFamily: "Roboto-Regular",
                                            fontSize: 11,
                                            letterSpacing: 1,
                                            color: Color(0xff33357D),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Container(
                              height: MediaQuery.of(context).size.height*0.20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.40,
                                    child: SfCircularChart(
                                        series: <RadialBarSeries>[
                                          RadialBarSeries<ChartData, String>(
                                              useSeriesColor: true,
                                              dataSource: chartData,
                                              xValueMapper: (ChartData data, _) => data.x,
                                              yValueMapper: (ChartData data, _) => data.y,
                                              cornerStyle: CornerStyle.bothCurve,
                                              innerRadius: '60%',
                                              gap: '20%',
                                              trackOpacity: 0.1,
                                              legendIconType: LegendIconType.circle

                                          )
                                        ]
                                    ),
                                  ),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '350',
                                            style: TextStyle(
                                              fontFamily: 'Lato-Bold',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff33357D),
                                            ),
                                          ),
                                          Text(
                                            'Total votes',
                                            style: TextStyle(
                                              fontFamily: 'Lato-Bold',
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff282828),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.circle,color: Color(0xffFE8067),size: 10,),
                                                  SizedBox(width: 5,),
                                                  Text(
                                                    'New participants',
                                                    style: TextStyle(
                                                      fontFamily: 'Lato-Bold',
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xff282828),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '20 ',
                                                    style: TextStyle(
                                                      fontFamily: 'Lato-Bold',
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xff2B2F6F),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Votes',
                                                    style: TextStyle(
                                                      fontFamily: 'Lato-Bold',
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xff2B2F6F),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.circle,color: Color(0xff2B2F6F),size: 10,),
                                                  SizedBox(width: 5,),
                                                  Text(
                                                    'Old participants',
                                                    style: TextStyle(
                                                      fontFamily: 'Lato-Bold',
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xff282828),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '330 ',
                                                    style: TextStyle(
                                                      fontFamily: 'Lato-Bold',
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xff2B2F6F),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Votes',
                                                    style: TextStyle(
                                                      fontFamily: 'Lato-Bold',
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xff2B2F6F),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class BarChartMonthData extends StatefulWidget {
  BarChartMonthData({super.key});

  final Color barBackgroundColor = const Color.fromARGB(255, 255, 255, 255);
  // AppColors.contentColorWhite.darken().withOpacity(0.3);
  final Color barColor = const Color(0xffE5E6FE); //AppColors.contentColorWhite;
  final Color touchedBarColor = const Color(0xffFE8067); //.contentColorGreen;

  @override
  State<StatefulWidget> createState() => BarChartMonthDataState();
}

class BarChartMonthDataState extends State<BarChartMonthData> {
  final Duration animDuration = const Duration(milliseconds: 100);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: BarChart(
                  mainBarData(),
                  swapAnimationDuration: animDuration,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color? barColor,
        double width = 20, //bar width
        List<int> showTooltips = const [],
      }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: isTouched ? width+10 : width,
          borderSide: isTouched
              ? const BorderSide(
              color: Color.fromARGB(255, 24, 34, 77),
              width: 20)
              : const BorderSide(
              color: Color.fromARGB(255, 255, 255, 255), width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 60,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(6, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 30, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 55, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 40, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 60, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 26, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 20, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: const Color(0xffF4F4FE),
          tooltipRoundedRadius: 4,
          tooltipBorder: const BorderSide(
            color: Color(0xffEBEBFF),
          ),
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              " ",
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "${(rod.toY - 1).toInt()} votes",
                  style: TextStyle(
                    color: widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 25,
            reservedSize: 40
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 40,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(
        drawHorizontalLine: true,
        horizontalInterval: 25,
        show: true,
        drawVerticalLine: false,
      ), //grid
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('29 May', style: style);
        break;
      case 1:
        text = const Text('30 May', style: style);
        break;
      case 2:
        text = const Text('1 June', style: style);
        break;
      case 3:
        text = const Text('2 June', style: style);
        break;
      case 4:
        text = const Text('3 June', style: style);
        break;
      case 5:
        text = const Text('4 June', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  // BarChartData randomData() {
  //   return BarChartData(
  //     // alignment: BarChartAlignment.spaceBetween,
  //     barTouchData: BarTouchData(
  //       enabled: false,
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           getTitlesWidget: getTitles,
  //           reservedSize: 38,
  //         ),
  //       ),
  //       leftTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //       topTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //       rightTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //       show: false,
  //     ),
  //     barGroups: List.generate(7, (i) {
  //       switch (i) {
  //         case 0:
  //           return makeGroupData(
  //             0,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 1:
  //           return makeGroupData(
  //             1,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 2:
  //           return makeGroupData(
  //             2,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 3:
  //           return makeGroupData(
  //             3,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 4:
  //           return makeGroupData(
  //             4,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 5:
  //           return makeGroupData(
  //             5,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 6:
  //           return makeGroupData(
  //             6,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         default:
  //           return throw Error();
  //       }
  //     }),
  //     gridData: const FlGridData(show: false),
  //   );
  // }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}


class BarChartHourData extends StatefulWidget {
  BarChartHourData({super.key});

  final Color barBackgroundColor = const Color.fromARGB(255, 255, 255, 255);
  // AppColors.contentColorWhite.darken().withOpacity(0.3);
  final Color barColor = const Color(0xffE5E6FE); //AppColors.contentColorWhite;
  final Color touchedBarColor = const Color(0xffFE8067); //.contentColorGreen;

  @override
  State<StatefulWidget> createState() => BarChartHourDataState();
}

class BarChartHourDataState extends State<BarChartHourData> {
  final Duration animDuration = const Duration(milliseconds: 100);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: BarChart(
                  mainBarData(),
                  swapAnimationDuration: animDuration,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color? barColor,
        double width = 20, //bar width
        List<int> showTooltips = const [],
      }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: isTouched ? width+10 : width,
          borderSide: isTouched
              ? const BorderSide(
              color: Color.fromARGB(255, 24, 34, 77),
              width: 20)
              : const BorderSide(
              color: Color.fromARGB(255, 255, 255, 255), width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 60,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(6, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 30, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 55, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 40, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 60, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 26, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 20, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: const Color(0xffF4F4FE),
          tooltipRoundedRadius: 4,
          tooltipBorder: const BorderSide(
            color: Color(0xffEBEBFF),
          ),
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              " ",
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "${(rod.toY - 1).toInt()} votes",
                  style: TextStyle(
                    color: widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              interval: 25,
              reservedSize: 40
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 40,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(
        drawHorizontalLine: true,
        horizontalInterval: 25,
        show: true,
        drawVerticalLine: false,
      ), //grid
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('4 Pm', style: style);
        break;
      case 1:
        text = const Text('5 Pm', style: style);
        break;
      case 2:
        text = const Text('6 Pm', style: style);
        break;
      case 3:
        text = const Text('7 Pm', style: style);
        break;
      case 4:
        text = const Text('8 Pm', style: style);
        break;
      case 5:
        text = const Text('9 Pm', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  // BarChartData randomData() {
  //   return BarChartData(
  //     // alignment: BarChartAlignment.spaceBetween,
  //     barTouchData: BarTouchData(
  //       enabled: false,
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           getTitlesWidget: getTitles,
  //           reservedSize: 38,
  //         ),
  //       ),
  //       leftTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //       topTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //       rightTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //       show: false,
  //     ),
  //     barGroups: List.generate(7, (i) {
  //       switch (i) {
  //         case 0:
  //           return makeGroupData(
  //             0,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 1:
  //           return makeGroupData(
  //             1,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 2:
  //           return makeGroupData(
  //             2,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 3:
  //           return makeGroupData(
  //             3,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 4:
  //           return makeGroupData(
  //             4,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 5:
  //           return makeGroupData(
  //             5,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         case 6:
  //           return makeGroupData(
  //             6,
  //             Random().nextInt(15).toDouble() + 6,
  //             barColor: widget.availableColors[
  //             Random().nextInt(widget.availableColors.length)],
  //           );
  //         default:
  //           return throw Error();
  //       }
  //     }),
  //     gridData: const FlGridData(show: false),
  //   );
  // }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}