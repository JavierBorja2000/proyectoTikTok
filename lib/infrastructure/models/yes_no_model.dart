import 'package:yes_no_prueba/domain/entities/chat.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  factory YesNoModel.fromMapJson(Map<String, dynamic> json) => YesNoModel(
      answer: json["answer"], forced: json["forced"], image: json["image"]);

  YesNoModel({required this.answer, required this.forced, required this.image});

  Message toMessageEntities() {
    return Message(message: answer, fromWho: FromWho.hers, imageUrl: image);
  }
}
