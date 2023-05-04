import 'package:flutter/material.dart';
import 'package:random/app/core/constants/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.center,
        child: Center(
          child: LoadingAnimationWidget.inkDrop(
            color: AppColors.kWhite,
            size: 30,
          ),
        ),
      );
}
