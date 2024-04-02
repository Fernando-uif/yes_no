import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// El provider nos permite tener nuestro ChangeNotifier en un contexto mayor
class ChatProvider extends ChangeNotifier {
  // puede notificar cuando hay cambios
  List<Message> messageList = [
    Message(text: 'Hola ', fromWho: FromWho.me),
    Message(text: 'Como te enuentras?', fromWho: FromWho.me),
  ];
  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);

    messageList.add(newMessage);
    // Tenemos que llamar este elemento para que actualize, algo del provider cambio, notifica a todos los que esten escuchando y redibuja
    notifyListeners();
  }
}
