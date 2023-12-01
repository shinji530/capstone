import 'package:flutter/material.dart';
import 'logoutPage.dart';
import 'quitPage.dart';
import 'certificationFeed.dart';

class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SettingDetail(),
    );
  }
}

class SettingDetail extends StatefulWidget {
  const SettingDetail({super.key});

  @override
  State<SettingDetail> createState() => _SettingDetailState();
}

class _SettingDetailState extends State<SettingDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListView(
        children: [
          ListTile(
            title: Text('로그아웃'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogoutPage()));
              },
          ),
          ListTile(
            title: Text('회원탈퇴'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuitPage()));
            },
          ),
          ListTile(
            title: Text('인증피드'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FeedPage()));
            },
          ),
        ],

      ),
    );
  }
}
