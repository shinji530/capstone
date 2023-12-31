import 'package:capstone/myAccount/certificationFeed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capstone/myAccount/setting.dart';

import 'package:capstone/3catagories/naturePage.dart';
import 'package:capstone/3catagories/mapPage.dart';
import 'package:capstone/3catagories/planPage.dart';
import 'package:table_calendar/table_calendar.dart';

// import 'package:capstone/schedule/component/2.schedule_card.dart';
// import 'package:capstone/schedule/component/3.today_banner.dart';
import 'package:capstone/schedule/const/colors.dart';


class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}


class _MainPage extends State<MainPage> {
  int _selectedIndex = 1; // Index of the selected tab
  IconData _floatingButtonIcon = Icons.edit_calendar; // Default icon

  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;


  final List<Widget> _pages = [
    const MapPage(),
    const PlanPage(),
    NaturePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            '그린패스',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Lotte", fontSize: 25,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ),
              );
            },
            icon: const Icon(Icons.settings, color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedPage(),
                  ),
                );
              },
              icon: const Icon(Icons.grid_view, color: Colors.black),
            ),
          ],
        ),
      ),

      body: _pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: BottomAppBar(
          color: Colors.white, // 네비게이션 바의 배경색
          shape: const CircularNotchedRectangle(), // 테두리를 둥글게 만듭니다.
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                        _floatingButtonIcon = Icons.edit_calendar;
                      });
                    },
                    child: Text(
                      '친환경 지도',
                      style: TextStyle(
                        fontFamily: "Lotte",
                        fontSize: 15,
                        color: _selectedIndex == 0 ? AppColor.deepGreen : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                        _floatingButtonIcon = Icons.edit_calendar;
                      });
                    },
                    child: Text(
                      '환경 스토리',
                      style: TextStyle(
                        fontFamily: "Lotte",
                        fontSize: 15,
                        color: _selectedIndex == 2 ? AppColor.deepGreen : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: _selectedIndex ==1 ? Container()
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: AppColor.lightGreen,
            onPressed: () {
              // _floatingButtonIcon = _selectedIndex == 1 ? Icons.edit_calendar : Icons.add;
              // if (_selectedIndex == 1) {

              //   // 정보 입력 다이얼로그 표시
              //   showCupertinoModalPopup(  // ➋ BottomSheet 열기
              //     context: context,
              //     builder: (_) => ScheduleBottomSheet(),
              //   );
              //
              //
              // } else {
                setState(() {
                   _selectedIndex = 1; // 현재 페이지가 인덱스 1이 아닐 때는 PlanPage로 이동
                });
              // }
            },
            child: Column(
                children: [
                  Container(height: 17,),
                  Icon(_floatingButtonIcon, color: Colors.black, size: 23,),
                ]
            ),
          ),
        ),
      ),

    );
  }
}


