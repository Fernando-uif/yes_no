import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// El provider nos permite tener nuestro ChangeNotifier en un contexto mayor
class ChatProvider extends ChangeNotifier {
  final GetYesNoAnswer getYesNoAnwer = GetYesNoAnswer();
  final ScrollController chatScrollController = ScrollController();

  // puede notificar cuando hay cambios
  List<Message> messageList = [
    Message(text: 'Hola ', fromWho: FromWho.me),
    Message(text: 'Como te enuentras?', fromWho: FromWho.me),
  ];
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    if (text.endsWith('?')) {
      herReply();
    }
    // Tenemos que llamar este elemento para que actualize, algo del provider cambio, notifica a todos los que esten escuchando y redibuja
    notifyListeners();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      moveScrollToBottom();
    });
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnwer.getAnswer();
  }

  void moveScrollToBottom() {
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
