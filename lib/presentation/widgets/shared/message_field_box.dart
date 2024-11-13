import 'package:flutter/material.dart';

class MessageFormField extends StatelessWidget {
  final ValueChanged onValue;
  const MessageFormField({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final underlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));

    final decorationField = InputDecoration(
        hintText: 'Debe terminar en ?',
        enabledBorder: underlineInputBorder,
        focusedBorder: underlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              final value = textController.value.text;
              onValue(value);
              textController.clear();
              focusNode.requestFocus();
            },
            icon: const Icon(Icons.send_rounded)));

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      decoration: decorationField,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
      onTapOutside: (event) {
        focusNode.unfocus();
      },
    );
  }
}
