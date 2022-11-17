import 'package:flutter/material.dart';

class DummyTab extends StatefulWidget {

  final Color color;

  const DummyTab({Key? key, required this.color}) : super(key: key);

  @override
  State<DummyTab> createState() => _DummyTabState();
}

class _DummyTabState extends State<DummyTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Container(
        color: widget.color,
      ),
    );
  }
}
