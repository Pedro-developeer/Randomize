import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:random/app/core/widgets/button_card.dart';
import 'package:random/app/models/user.dart';
import 'package:random/app/modules/home/controller/home_controller.dart';
import 'package:random/app/modules/info/info_screen.dart';
import 'package:random/app/core/widgets/loading.dart';
import 'package:random/app/core/constants/constants.dart';
import 'package:random/app/routes/page_routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = HomeController();
  Future usersListFuture;

  @override
  void initState() {
    super.initState();
    this.usersListFuture = this.homeController.fetchUsersData();
  }

  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.kBlackBackground,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: AppColors.kBlackBackground,
        title: Text(
          'Randomize',
          style: AppTextStyles.fontAppBar.copyWith(
            color: AppColors.kWhite,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Observer(
        builder: (context) => SizedBox(
          height: space * 5,
          width: size.width * 0.9,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kWhite,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Show new users',
              style: AppTextStyles.fontText.copyWith(
                color: AppColors.kBlack,
              ),
            ),
            onPressed: () async {
              setState(() {
                this.usersListFuture = this.homeController.fetchUsersData();
              });
            },
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: space),
          Expanded(
            child: Observer(
              builder: (context) => FutureBuilder<List<User>>(
                future: this.homeController.fetchUsersData(),
                // future: this.usersListFuture,
                builder: (context, snapshot) {
                  controller.users = snapshot.data;
                  if (controller.users == null) return Loading();
                  if (controller.users.isEmpty) {
                    return Text(
                      'Sem usuários para mostrar',
                      style: AppTextStyles.fontText.copyWith(
                        color: AppColors.kDarkSubtitle,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.users.length,
                    itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Hero(
                          tag: 'userImg$index',
                          child: Container(
                            padding: EdgeInsets.all(space),
                            height: space * 9,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                backgroundColor: AppColors.kMainGray,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        controller.users[index].userLargeImage,
                                    placeholder: (context, url) =>
                                        LoadingAnimationWidget.inkDrop(
                                      color: AppColors.kWhite,
                                      size: 30,
                                    ),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.error,
                                      color: AppColors.kWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Flexible(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 9),
                                      child: Text(
                                        controller.users[index]
                                            .getNomeCompleto(),
                                        style: AppTextStyles.titleHead.copyWith(
                                          color: AppColors.kWhite,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(height: space * 0.7),
                                    Text(
                                      controller.users[index].getEndereco(),
                                      style: AppTextStyles.fontText,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              ButtonCard(
                                onPressed: () {
                                   Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => InfoScreen(
                                          id: index,
                                          username: controller.users[index]
                                              .getNomeCompleto(),
                                          userImg: controller
                                              .users[index].userLargeImage,
                                          location: controller.users[index]
                                              .getEndereco(),
                                          email: controller.users[index].email,
                                          age: controller.users[index].age,
                                          phoneNumber: controller
                                              .users[index].phoneNumber,
                                        ),
                                      ),
                                    );
                                  // Modular.to.navigate(
                                  //   AppPageRoutes.info.fullPath,
                                  // );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
