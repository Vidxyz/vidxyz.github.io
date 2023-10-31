import 'package:flutter/cupertino.dart';

class HoverContainer extends StatefulWidget {
  final Widget child;
  final double hoverLimit;

  const HoverContainer({
    required this.child,
    required this.hoverLimit,
  });

  @override
  State createState() {
    return HoverContainerState();
  }
}

class HoverContainerState extends State<HoverContainer>
    with SingleTickerProviderStateMixin {

  bool _hovering = false;
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween(begin: 0.0, end: -widget.hoverLimit).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuart),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
    _animateCard();
  }

  Future<void> _animateCard() async {
    if (_hovering) {
      try {
        await _controller.forward().orCancel;
      } on TickerCanceled {}
    } else {
      try {
        await _controller.reverse().orCancel;
      } on TickerCanceled {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, animation.value),
            child: widget.child,
          );
        },
      ),
    );
  }
}