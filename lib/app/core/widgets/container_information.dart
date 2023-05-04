import 'package:flutter/material.dart';
import 'package:random/app/core/constants/constants.dart';

class ContainerProfile extends StatelessWidget {
  const ContainerProfile({
    Key key,
    @required this.information,
    @required this.icon,
  }) : super(key: key);

  final String information;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kGrayContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 353,
      height: 58,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 33,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.kWhite,
            ),
            SizedBox(width: 4),
            Flexible(
              child: Text(
                information,
                style: AppTextStyles.fontText.copyWith(
                  color: AppColors.kWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
