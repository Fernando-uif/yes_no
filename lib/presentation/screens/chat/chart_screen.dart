import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage('https://picsum.photos/id/129/300/300'),
          ),
        ),
        title: const Text('Juan Pérez'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // watch si queremos estar endiente de los cambios
    // Esto estara al pendiente de los cambios que haya en el provider
    final chatProvider = context.watch<ChatProvider>();

    // El SafeArea nos permite ajustar el contenedor a una parte de la pantalla donde no choca con botones del celular , entonces se recorre
    return SafeArea(
        // left: false,
        child: Padding(
      // Aplicamos un padding, en este caso queremos que sea simetrico y de manera horizontal con unos 10px
      padding: const EdgeInsets.symmetric(horizontal: 10),
      // Column , nos permite colocar varios widgets en columna
      child: Column(
        children: [
          // Expanded se expande a todo lo que tengamos disponible de pantalla
          Expanded(
              child:
                  // Container(color: Colors.amber)
                  ListView.builder(
            controller: chatProvider.chatScrollController,
            itemCount: chatProvider.messageList.length,
            itemBuilder: (context, index) {
              final message = chatProvider.messageList[index];

              return (message.fromWho == FromWho.hers
                  ? HerMessageBubble(
                      herText: message, imageUrl: message.imageUrl!)
                  : MyMessageBubble(message: message));
            },
          )),
          MessageFieldBox(
            onValue: (value) => chatProvider.sendMessage(value),
          )
        ],
      ),
    ));
  }
}
