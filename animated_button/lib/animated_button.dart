import 'package:flutter/material.dart';

enum ButtonState {
  BUTTON_BEGINNING,
  BUTTON_COMPLETION,
}

extension ButtonStateExtension on ButtonState {
  // ignore: missing_return
  static bool _value(ButtonState val) {
    switch (val) {
      case ButtonState.BUTTON_BEGINNING:
        return true;
      case ButtonState.BUTTON_COMPLETION:
        return false;
    }
  }

  bool get value => _value(this);
}

class ButtonDecoration {
  Duration duration;
  Color beginningColor;
  Color completionColor;
  Curve curves;

  ButtonDecoration(
      {this.curves, this.duration, this.beginningColor, this.completionColor});
}

// ignore: must_be_immutable
class AnimatedButton extends StatefulWidget {
  ButtonDecoration buttonDecoration;
  Widget beginningWidget;
  Widget completionWidget;
  double containerHeight;
  double containerWidth;

  AnimatedButton(
      {Key key,
      @required this.containerHeight,
      this.containerWidth,
      this.buttonDecoration,
      this.beginningWidget,
      this.completionWidget})
      : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;
  ButtonState buttonState = ButtonState.BUTTON_BEGINNING;
  bool activationStatus = false;
  ButtonDecoration buttonDecoration;
  Widget beginningWidget;
  Widget completionWidget;
  double containerHeight;
  double containerWidth;

  void updateButtonState() {
    buttonState == ButtonState.BUTTON_BEGINNING
        ? buttonState = ButtonState.BUTTON_COMPLETION
        : buttonState = ButtonState.BUTTON_BEGINNING;
  }

  @override
  void initState() {
    super.initState();

    buttonDecoration = widget.buttonDecoration;
    beginningWidget = widget.beginningWidget;
    completionWidget = widget.completionWidget;
    containerHeight = widget.containerHeight;
    containerWidth = widget.containerWidth;

    _controller = AnimationController(
        duration: widget.buttonDecoration.duration, vsync: this);
    animation = CurvedAnimation(
        parent: _controller, curve: widget.buttonDecoration.curves);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            updateButtonState();
          });
        });

        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (buttonState.value) {
      return activationStatus
          ? AnimatedContainer(
              duration: buttonDecoration.duration,
              height: containerHeight,
              width: containerWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: buttonDecoration.completionColor,
              ),
              child: InkWell(

                  /// Error prevention
                  onDoubleTap: () {},
                  onTap: () {
                    _controller.forward();

                    setState(() {
                      updateButtonState();
                      activationStatus = !activationStatus;
                    });
                  },
                  child: completionWidget),
            )
          : AnimatedContainer(
              duration: buttonDecoration.duration,
              height: containerHeight,
              width: containerWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: buttonDecoration.beginningColor,
              ),
              child: InkWell(

                  /// Error prevention
                  onDoubleTap: () {},
                  onTap: () {
                    _controller.forward();

                    setState(() {
                      updateButtonState();
                      activationStatus = !activationStatus;
                    });
                  },
                  child: beginningWidget),
            );
    } else {
      return activationStatus
          ? iconContainer(
              Colors.green,
              Icon(
                Icons.check,
                color: Colors.white,
              ))
          : iconContainer(
              Colors.red,
              Icon(
                Icons.close,
                color: Colors.white,
              ));
    }
  }

  AnimatedContainer iconContainer(Color backgroundColor, Icon icon) {
    return AnimatedContainer(
      duration: buttonDecoration.duration,
      height: containerHeight,
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: backgroundColor,
      ),
      child: Container(alignment: Alignment.center, child: icon),
    );
  }
}
