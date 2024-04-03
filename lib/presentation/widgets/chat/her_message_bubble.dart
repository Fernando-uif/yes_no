import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message herText;
  final String imageUrl;

  const HerMessageBubble(
      {super.key, required this.herText, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // Busca el tema dentro del contexto
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 10,
          // width: 10,
          decoration: BoxDecoration(
              color: colors.tertiary, borderRadius: BorderRadius.circular(20)),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
                herText.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        // TODO Imagen
        _ImageBubble(imageUrl: imageUrl),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // Media queri hace referencia al elemento donde se esta ejecutando
    // Context hace referencia a nuestro arbol de widgets
    // Como sabemos donde lo corre entonces podemos obtener el size

    final size = MediaQuery.of(context).size;
    // Nos permite hacer border redondeados
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          width: size.width * .7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Container(
                width: size.width * 0.7,
                height: 150,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Text('Se esta enviando imagen...'),
              );
            }
          },
        ));
  }
}
