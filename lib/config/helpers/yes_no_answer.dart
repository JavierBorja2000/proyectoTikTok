import 'package:dio/dio.dart';
import 'package:yes_no_prueba/domain/entities/chat.dart';
import 'package:yes_no_prueba/infrastructure/models/yes_no_model.dart';

class YesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final hermessage = YesNoModel.fromMapJson(response.data);

    return hermessage.toMessageEntities();
  }
}
