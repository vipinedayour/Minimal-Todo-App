import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class VibrateWidget extends StatefulWidget {
  const VibrateWidget({super.key, required this.child});
  final Widget child;
  @override
  State<VibrateWidget> createState() => _VibrateWidgetState();
}

class _VibrateWidgetState extends State<VibrateWidget> {
  @override
  void initState() {
    super.initState();
    HapticFeedback.heavyImpact();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: widget.child);
  }
}
