import 'package:flutter/material.dart';
import 'package:mvvvm_app/components/app_title.dart';
import 'package:mvvvm_app/user_list/models/user_list_model.dart';

class UserListRow extends StatelessWidget {
  final UserModel userMOdel;
  final VoidCallback onTap;
  UserListRow({required this.userMOdel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              text: userMOdel.name!,
            ),
            Text(
              userMOdel.email!,
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
