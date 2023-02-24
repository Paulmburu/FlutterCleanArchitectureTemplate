import 'package:flutter/material.dart';

class AppLifecycleManager extends StatefulWidget {
  const AppLifecycleManager({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  _AppLifecycleManagerState createState() => _AppLifecycleManagerState();
}

class _AppLifecycleManagerState extends State<AppLifecycleManager>
    with WidgetsBindingObserver {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Widget build(BuildContext context) => widget.child;
}
