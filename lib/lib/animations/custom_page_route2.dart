import 'package:flutter/material.dart';

class CustomPageRoute2 extends PageRouteBuilder {
  final Widget child;
  Offset begin;
  Offset end;
  int duration;

  CustomPageRoute2({
    required this.child,
    this.begin=const Offset(-1,-1),
    this.end=Offset.zero,
    this.duration=900,
}) : super(
    transitionDuration: Duration(milliseconds: duration),
    pageBuilder: (context, animation, secondaryAnimation)=>child,
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    return SlideTransition(
        position: Tween<Offset>(
          begin: begin,
          end: end,
        ).animate(animation),
        child: child);
  }

}
