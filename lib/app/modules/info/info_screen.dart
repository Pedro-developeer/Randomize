import 'package:flutter/material.dart';
import 'package:random/app/core/constants/constants.dart';
import 'package:random/app/core/widgets/container_information.dart';
import 'package:random/app/modules/info/controller/info_controller.dart';

class InfoScreen extends StatelessWidget {
  final int id;
  final String username;
  final String userImg;
  final String location;
  final String email;
  final int age;
  final String phoneNumber;

  const InfoScreen({
    Key key,
    this.id,
    this.username,
    this.userImg,
    this.location,
    this.email,
    this.age,
    this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = InfoController();
    return Scaffold(
      backgroundColor: AppColors.kMainGray,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kMainGray,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'User Profile',
          style: AppTextStyles.fontAppBar.copyWith(
            color: AppColors.kWhite,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/backgroundprofile.png',
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(userImg),
                  ),
                  SizedBox(height: space),
                  Text(
                    '$username',
                    style: AppTextStyles.fontTextButton.copyWith(
                      color: AppColors.kWhite,
                    ),
                  ),
                  Text(
                    '$age years old',
                    style: AppTextStyles.fontText.copyWith(
                      color: AppColors.kGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: space * 3,
                vertical: space * 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: space * 2),
                  ContainerProfile(
                    information: location,
                    icon: Icons.location_on,
                  ),
                  SizedBox(height: space * 2),
                  ContainerProfile(
                    information: email,
                    icon: Icons.mail,
                  ),
                  SizedBox(height: space * 2),
                  ContainerProfile(
                    information: phoneNumber,
                    icon: Icons.phone,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
