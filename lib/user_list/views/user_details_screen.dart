import 'package:flutter/material.dart';
import 'package:mvvvm_app/components/app_title.dart';
import 'package:mvvvm_app/components/profile_menu_details.dart';
import 'package:mvvvm_app/user_list/models/user_list_model.dart';
import 'package:mvvvm_app/user_list/view_models/users_view_model.dart';
import 'package:mvvvm_app/util/SizeConfig.dart';
import 'package:mvvvm_app/util/constants.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);

    UserViewModel userViewModel = context.watch<UserViewModel>();
    Address? address = userViewModel.selectedUser.address;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.white, color_blanco],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      )),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [color_verde, color_verde_1, color_verde_2],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 240.0,
                child: Stack(
                  children: <Widget>[
                    ClipPath(
                      clipper: CustomShape(),
                      child: Container(
                        height: 150.0,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [color_verde, color_verde_1, color_verde_2],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                        )),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 140.0,
                            width: 140.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: color_blanco, width: 8.0),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/img/avatar.jpg'))),
                          ),
                          Text(
                            userViewModel.selectedUser.name!,
                            style:
                                TextStyle(fontSize: 22.0, color: color_verde_1),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            userViewModel.selectedUser.email!,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: color_verde),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ProfileMenu(
                iconSrc: const Icon(
                  Icons.account_box,
                  color: color_verde,
                ),
                press: () {},
                title: 'Username: ' + userViewModel.selectedUser.username!,
              ),
              ProfileMenu(
                iconSrc: const Icon(
                  Icons.web,
                  color: color_verde,
                ),
                press: () {},
                title: 'Website: ' + userViewModel.selectedUser.website!,
              ),
              ProfileMenu(
                iconSrc: const Icon(
                  Icons.call,
                  color: color_verde,
                ),
                press: () {},
                title: 'Phone: ' + userViewModel.selectedUser.phone!,
              ),
              ProfileMenu(
                iconSrc: const Icon(
                  Icons.home,
                  color: color_verde,
                ),
                press: () {},
                title: 'Address: ' + address!.street!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
