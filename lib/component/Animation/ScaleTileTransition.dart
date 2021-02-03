import 'package:flutter/material.dart';

class ScaleTileTransition extends StatefulWidget {
  Widget child;

  ScaleTileTransition({@required this.child});

  @override
  _ScaleTileTransitionState createState() => _ScaleTileTransitionState();
}

class _ScaleTileTransitionState extends State<ScaleTileTransition>
    with SingleTickerProviderStateMixin<ScaleTileTransition> {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this, value: 0.1);
    //todo atur gaya transisi disini
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
