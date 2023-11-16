import 'package:capstone/schedule/model/schedule.dart';
import 'package:drift/drift.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'drift_database.g.dart'; // part 파일 지정
//private 값들도 사용 가능.

@DriftDatabase( // 사용할 테이블
  tables: [
    Schedules,
  ],
)

class LocalDatabase extends _$LocalDatabase{
  LocalDatabase():super(_openConnection());

  Stream<List<Schedule>> watchSchedules(DateTime date) =>
      //데이터 조회 및 변화 감지
      (select(schedules)..where((tbl)=>tbl.date.equals(date))).watch();

  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);

  Future<int> removeSchedule(int id) =>
      (delete(schedules)..where((tbl)=>tbl.id.equals(id))).go();


  @override
  int get schemaVersion => 1;
  //1부터 시작. 테이블 변화가 있을 시 1씩 올려줘서 구조 변경사항 인지시킴.

}
//코드 생성 클래스


LazyDatabase _openConnection(){
  return LazyDatabase(() async{
    final dbFolder =await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
