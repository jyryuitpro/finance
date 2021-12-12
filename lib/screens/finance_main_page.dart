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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(LineIcons.bars),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.zero,
                    ),
                    Text(
                      'Services',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
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
                      height: MediaQuery.of(context).size.height / 3.8,
                      child: Placeholder(),
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