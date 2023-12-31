import 'package:flutter/material.dart';
import 'package:capstone/natureStory/nature_info.dart';
import 'package:capstone/natureStory/donationPage.dart';

import 'package:capstone/style.dart';

import '../natureStory/route.dart';

class NaturePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _NaturePage();
  }
}

class _NaturePage extends State<NaturePage> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState(){
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose(){
    controller!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    return  DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          flexibleSpace: TabBar(
            controller: controller,
            tabs: const <Tab>[

              Tab(
                icon: Icon(Icons.compost),
                child: Text(
                  "친환경 정보",
                  style: TextStyle(
                    fontSize: 11.0, // 글씨 크기
                    fontFamily: 'YourFontFamily', // 원하는 글꼴 지정
                    fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
                  ),
                ),
              ),


              Tab(
                icon: Icon(Icons.map),
                child: Text(
                  "친환경 루트",
                  style: TextStyle(
                    fontSize: 11.0, // 글씨 크기
                    //fontFamily: 'Lotte', // 원하는 글꼴 지정
                    fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
                  ),
                ),
              ),



              Tab(
                icon: Icon(Icons.volunteer_activism), //collections
                child: Text(
                  "환경 기부",
                  style: TextStyle(
                    fontSize: 11.0, // 글씨 크기
                    fontFamily: 'YourFontFamily', // 원하는 글꼴 지정
                    fontWeight: FontWeight.bold, // 글꼴 두껍게 설정 (선택 사항)
                  ),
                ),
              ),

            ],
            labelColor: AppColor.deepGreen, // 선택된 탭의 글씨색
            indicatorColor: AppColor.deepGreen, // 탭 아래의 인디케이터 색
            /// 탭바 클릭시 나오는 splash effect 컬러
            overlayColor: const MaterialStatePropertyAll(
              Colors.transparent,
            ),
          ),
        ),
        body: TabBarView(
          controller: controller,
          // physics: NeverScrollableScrollPhysics(),
          children: <Widget>[

            nature_info(),

            Story2(),
            // EcoFriendlyItems(),
            // AppItems(),
            // PointUsageHistory(),

            DonationList(),
          ],
        ),
      ),
    );
  }
}



