import 'package:flutter/material.dart';
import 'package:mvvvm_app/components/app_title.dart';
import 'package:mvvvm_app/user_list/models/user_list_model.dart';
import 'package:mvvvm_app/user_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              text: userViewModel.selectedUser.name!,
            ),
            Text(
              userViewModel.selectedUser.email!,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
