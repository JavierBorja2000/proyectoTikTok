import 'package:flutter/material.dart';
import 'package:yes_no_prueba/config/helpers/yes_no_answer.dart';
import 'package:yes_no_prueba/domain/entities/chat.dart';

class ChatProvider extends ChangeNotifier {
  final getYesNoAnswer = YesNoAnswer();
  final chatScrollController = ScrollController();
  List<Message> listMessages = [
    Message(message: 'Hola mi amor', fromWho: FromWho.me),
    Message(message: 'Tienes Hambre?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) {
      return;
    }

    listMessages.add(Message(message: text, fromWho: FromWho.me));

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    listMessages.add(herMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn);
  }
}
