import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const CopyableText('ロングプレスでクリップボードにコピー'),
              const SizedBox(height: 30),
              const SelectableText('部分選択でクリップボードにコピー'),
              const SizedBox(height: 30),
              TextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}

class CopyableText extends Text {
  const CopyableText(super.data, {super.key, super.style});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        if (data != null) {
          Clipboard.setData(ClipboardData(text: data!));
        }
      },
      child: super.build(context),
    );
  }
}
