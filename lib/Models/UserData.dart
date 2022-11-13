import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'UserData.g.dart';

@freezed
@HiveType(typeId: 0)
class UserData {
  @HiveField(0)
  final String? firstname;
  @HiveField(1)
  final String? lastaname;
  @HiveField(2)
  final String? emailId;

  UserData(
      {required this.firstname,
      required this.lastaname,
      required this.emailId});
}
