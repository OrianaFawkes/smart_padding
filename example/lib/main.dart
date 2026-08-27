import 'package:flutter/material.dart';
import 'package:smart_padding/smart_padding.dart';

void main() {
  runApp(SmartPaddingExampleApp());
}

class SmartPaddingExampleApp extends StatelessWidget {
  const SmartPaddingExampleApp({super.key});

  @override
  Widget build(_) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('SmartPadding Example')),
        body: SmartPadding(
          horizontal: 16.0,
          bottom: 8.0,
          child: Text(
            'This text has 16.0 padding on the left and right '
            'and 8.0 padding on the bottom.',
          ),
        ),
      ),
    );
  }
}
