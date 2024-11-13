import 'package:flutter/material.dart';
import 'package:yes_no_prueba/domain/entities/chat.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            decoration: BoxDecoration(
                color: theme.primary, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Text(
                message.message,
                style: const TextStyle(color: Colors.white)),
              )) ,
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
