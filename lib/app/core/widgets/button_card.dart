import 'package:flutter/material.dart';
import 'package:random/app/core/constants/constants.dart';

class ButtonCard extends StatefulWidget {
  const ButtonCard({
    Key key,
    this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;

  @override
  _ButtonCardState createState() => _ButtonCardState();
}

class _ButtonCardState extends State<ButtonCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 128,
      height: 37,
      child: ElevatedButton(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          padding: EdgeInsets.symmetric(
            horizontal: _isPressed ? 18 : 16,
            vertical: 10,
          ),
          child: Text(
            'Follow',
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kDarkSubtitle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
          widget.onPressed();
        },
      ),
    );
  }
}
