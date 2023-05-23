import 'package:flutter/material.dart';

class PageScaffold extends StatelessWidget {
  final Widget child;
  final List<Widget> actions;
  final bool showBack;
  final bool showAppBar;
  const PageScaffold({
    Key? key,
    required this.child,
    this.actions = const [],
    this.showBack = true,
    this.showAppBar = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:showAppBar? AppBar(
          automaticallyImplyLeading: showBack ?? true,
          title: const Text('IServices'),
          centerTitle: false,
          actions: actions,
        ):null,
        body: child,
      ),
    );
  }
}
