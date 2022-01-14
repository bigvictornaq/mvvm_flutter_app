import 'package:flutter/material.dart';
import 'package:mvvvm_app/components/app_title.dart';
import 'package:mvvvm_app/user_list/models/user_list_model.dart';
import 'package:mvvvm_app/util/constants.dart';

class UserListRow extends StatelessWidget {
  final UserModel userMOdel;
  final VoidCallback onTap;
  UserListRow({required this.userMOdel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [color_verde, color_verde_1, color_verde_2],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Icon(
                  Icons.face,
                  color: color_blanco,
                  size: 50.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AppTitle(
                      text: userMOdel.name!,
                    ),
                    Text(
                      userMOdel.email!,
                      style: TextStyle(color: color_blanco),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
