import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobil/core/models/entity.dart';

class AnnouncementModel extends Entity {
  final String type;
  final String organisation;
  final String title;
  final String content;
  final DateTime date;

  AnnouncementModel({
    required this.type,
    required this.organisation,
    required this.title,
    required this.content,
    required this.date,
  });

  factory AnnouncementModel.fromMap(Map<String, dynamic> map) {
    return AnnouncementModel(
      type: map["type"] as String,
      organisation: map["organisation"] as String,
      title: map["title"] as String,
      content: map["content"] as String,
      date: (map["date"] as Timestamp).toDate(),
    );
  }
}
