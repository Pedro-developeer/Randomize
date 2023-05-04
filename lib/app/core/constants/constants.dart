import 'package:flutter/material.dart';

final double space = 10;

class AppColors {
  static const kMainGray = Color(0xFF131313);
  static const kRed = Color(0xFFE74C3C);
  static const kSecBlue = Color(0xFF52658C);
  static const kWhite = Color(0xFFF5F5F5);
  static const kGrayContainer = Color(0xFF202020);
  static const kDarkSubtitle = Color(0xFF333333);
  static const kBlack = Color(0xFF000000);
  static const kGrey = Color(0xFFA0A0A0);
  static const kBlackBackground = Color(0xFF131313);
}

class AppTextStyles {
  static const fontButton = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: '.SF UI Display',
    fontWeight: FontWeight.bold,
  );

  static const fontTextButton = TextStyle(
    color: AppColors.kWhite,
    fontSize: 18,
    fontFamily: '.SF UI Display',
    fontWeight: FontWeight.bold,
  );

  static const fontTextButtonSec = TextStyle(
    color: AppColors.kMainGray,
    fontSize: 18,
    fontFamily: '.SF UI Display',
    fontWeight: FontWeight.bold,
  );

  static const fontAppBar = TextStyle(
    color: AppColors.kWhite,
    fontSize: 18,
    fontFamily: '.SF UI Display',
    fontWeight: FontWeight.bold,
  );

  static const fontText = TextStyle(
    color: AppColors.kDarkSubtitle,
    fontSize: 15,
    fontFamily: '.SF UI Display',
  );
  static const fontTextSub = TextStyle(
    color: AppColors.kGrey,
    fontSize: 13,
    fontFamily: '.SF UI Display',
  );

  static const fontTextHome = TextStyle(
    color: AppColors.kWhite,
    fontSize: 15,
    fontFamily: '.SF UI Display',
  );

  static const titleHead = TextStyle(
    color: AppColors.kDarkSubtitle,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: '.SF UI Display',
  );

  static const descriptionHead = TextStyle(
    color: AppColors.kDarkSubtitle,
    fontSize: 16,
    fontFamily: '.SF UI Display',
  );
}
