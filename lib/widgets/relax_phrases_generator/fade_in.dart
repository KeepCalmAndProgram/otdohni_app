import 'package:flutter/material.dart';

class FadeInOut extends StatefulWidget {
  final Widget child;
  VoidCallback? fadeCompleteCallback;

  FadeInOut({Key? key, required this.child, this.fadeCompleteCallback})
      : super(key: key);

  @override
  createState() => _FadeInOutState();
}

class _FadeInOutState extends State<FadeInOut>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _animation.addStatusListener(_animationStatusListener);

    super.initState();
  }

  @override
  dispose() {
    _controller.dispose();
    _animation.removeStatusListener(_animationStatusListener);

    super.dispose();
  }

  void _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _controller.stop();
      widget.fadeCompleteCallback?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
