import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:u_credit_card/u_credit_card.dart' show CreditCardUi;
import 'package:flutter_day2/profile_page.dart';

class Wallets extends StatefulWidget {
  const Wallets({Key? key}) : super(key: key);

  @override
  State<Wallets> createState() => _WalletsState();
}

class _WalletsState extends State<Wallets> {
  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 100,top: 80),
                  child:
                  Text(
                    "Wallet",
                    style: TextStyle(fontSize: 19),
                  ),
                ),

                Padding(padding:  EdgeInsets.only(left: 190,top: 80),
                  child:    Icon(Icons.search),
                )

              ],
            ),



            SizedBox(height: 20),
            CreditCardUi(
              width: MediaQuery.of(context).size.width,
              cardHolderFullName: 'John Doe',
              cardNumber: '1234567812345678',
              validFrom: '01/23',
              validThru: '01/28',
              topLeftColor: Colors.blue,
              doesSupportNfc: true,
              placeNfcIconAtTheEnd: true,
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Total Spending",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            DefaultTabController(length: 1, child: TabBar(
              tabs: [
                Tab(text: 'Day'),
                Tab(text: 'Week'),
                Tab(text: 'Month'),
                Tab(text: 'Custum Range'),
              ],
            ),),
            Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.70,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 18,
                      left: 12,
                      top: 24,
                      bottom: 12,
                    ),
                    child: Chart(),
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 34,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        showAvg = !showAvg;
                      });
                    },
                    child: Text(
                      'avg',
                      style: TextStyle(
                        fontSize: 12,
                        color: showAvg
                            ? Colors.white.withValues(alpha: 0.5)
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
        Text("Weekly Spend",style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),),
        Text("\$23435",style: TextStyle(fontSize: 15,),)
            ],
          ),
          Column(
            children: [
        Text("Weekly Spend",style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),),
        Text("\$23435",style: TextStyle(fontSize: 15,),)
            ],
          ),
          Column(
            children: [
        Text("Weekly Spend",style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),),
        Text("\$23435",style: TextStyle(fontSize: 15,),)
            ],
          )
        ],
            ),
            Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
        Text("Weekly home",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
        Text("\$24443",style: TextStyle(fontSize: 16),)

            ],
          ),
          TextButton(onPressed: (){}, child: Text("See Details"))
        ],
            )

            //TabBarView()

        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Gift"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }











  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      meta: meta,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.pink,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.pink,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              Colors.pink
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [Colors.pink]
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
             Colors.pink,Colors.pink
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                Colors.blue,Colors.red
              ],
            ),
          ),
        ),
      ],
    );
  }











}
