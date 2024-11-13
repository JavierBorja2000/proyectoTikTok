import 'package:flutter/material.dart';
import 'package:yes_no_prueba/domain/entities/chat.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorSecondary = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colorSecondary.secondary,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Text(message.message,
                style: const TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(urlImage: message.imageUrl!),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String urlImage;

  const _ImageBubble({ required this.urlImage});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.network(
          urlImage,
          width: size.width * 0.7,
          height: 250,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return SizedBox(
                width: size.width * 0.7,
                height: 250,
                child: const Center(child: CircularProgressIndicator()));
          },
        ));
  }
}
