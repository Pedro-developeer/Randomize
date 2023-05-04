import 'package:flutter/material.dart';
import 'package:random/app/core/constants/constants.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    Key key,
    this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 37,
      child: ElevatedButton(
          child: Text(
            'Follow',
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kDarkSubtitle,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            onPressed();
          }),
    );
  }
}
