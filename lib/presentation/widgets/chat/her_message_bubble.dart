import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

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
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        // TODO Imagen
        _ImageBubble(),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
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
          
            'https://yesno.wtf/assets/yes/10-271c872c91cd72c1e38e72d2f8eda676.gif',
            width: size.width * .7,
            height: 150,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if(loadingProgress == null) {
                return child;
              }else{
                return Container(
                  width: size.width *0.7,
                  height: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child:const Text('Se esta enviando imagen...'),
                );
              }
            },
            )
            );
  }
}
