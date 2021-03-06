import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class FinanceMainPage extends StatefulWidget {
  const FinanceMainPage({Key? key}) : super(key: key);

  @override
  _FinanceMainPageState createState() => _FinanceMainPageState();
}

class _FinanceMainPageState extends State<FinanceMainPage> {
  int _tabIndex = 0;
  int _chartTableIndex = 0;
  final fromDate = DateTime(2021, 12, 01);
  final toDate = DateTime.now();

  List<DataPoint> vList = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 8; i++) {
      vList.add(DataPoint<DateTime>(value: i.toDouble() * 10, xAxis: DateTime.now().subtract(Duration(days: i)),));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(LineIcons.bars),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.zero,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'BroCombi',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Icon(
                              Icons.notifications_none,
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: CircleAvatar(
                              radius: 4,
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.6,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 16,
                                top: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Savings',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                    Text(
                                      '\$5200.00',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 16,
                                right: 16,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _chartTableIndex = 0;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                        decoration: _chartTableIndex == 0 ? BoxDecoration(
                                          color: Colors.white.withOpacity(0.4),
                                          borderRadius: BorderRadius.circular(16.0),
                                        ) : null,
                                        child: Center(
                                          child: Text(
                                            'Chart',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _chartTableIndex = 1;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                        decoration: _chartTableIndex == 1 ? BoxDecoration(
                                          color: Colors.white.withOpacity(0.4),
                                          borderRadius: BorderRadius.circular(16.0),
                                        ) : null,
                                        child: Center(
                                          child: Text(
                                            'Table',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 65,
                                left: 16,
                                right: 16,
                                bottom: 10,
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  color: Colors.red,
                                  child: BezierChart(
                                    bezierChartScale: BezierChartScale.WEEKLY,
                                    fromDate: fromDate,
                                    toDate: toDate,
                                    selectedDate: toDate,
                                    series: [
                                      BezierLine(
                                        data: vList,
                                      ),
                                    ],
                                    config: BezierChartConfig(
                                      snap: false,
                                      backgroundColor: Colors.teal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 58,
                      child: Placeholder(),
                    ),
                    SizedBox(
                      height: 84,
                      child: Placeholder(),
                    ),
                    SizedBox(
                      height: 100,
                      child: Placeholder(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Placeholder(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(LineIcons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(LineIcons.barChart), label: ''),
          BottomNavigationBarItem(icon: Icon(LineIcons.creditCard), label: ''),
          BottomNavigationBarItem(icon: Icon(LineIcons.user), label: ''),
        ],
      ),
    );
  }
}
