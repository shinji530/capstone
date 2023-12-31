import 'package:capstone/schedule/const/colors.dart';
import 'package:flutter/material.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDate;  // ➊ 선택된 날짜
  final int count;  // ➋ 일정 개수

  const TodayBanner({
    required this.selectedDate,
    required this.count,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(  // 기본으로 사용할 글꼴
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    return Container(
      // color: AppColor.deepGreen,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0), //, vertical: 8.0
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일',  // “년 월 일” 형태로 표시
              style: textStyle,
            ),

            //(여행 제목)


            // Text(
            //   '$count개',  // 일정 개수 표시
            //   style: textStyle,
            // ),
          ],
        ),
      ),
    );
  }
}
