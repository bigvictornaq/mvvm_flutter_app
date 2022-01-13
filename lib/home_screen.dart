import 'package:flutter/material.dart';
import 'package:mvvvm_app/components/app_error.dart';
import 'package:mvvvm_app/components/app_loading.dart';
import 'package:mvvvm_app/components/app_title.dart';
import 'package:mvvvm_app/components/user_list_row.dart';
import 'package:mvvvm_app/user_list/models/user_list_model.dart';
import 'package:mvvvm_app/user_list/view_models/users_view_model.dart';
import 'package:mvvvm_app/util/navigation_utils.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Users'),
          actions: [
            IconButton(
                onPressed: () async {
                  openAddUser(context);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              _ui(userViewModel),
            ],
          ),
        ));
  }

  _ui(UserViewModel userViewModel) {
    if (userViewModel.leading) {
      return AppLoading();
    }
    if (userViewModel.userError != null) {
      return AppError(
        errortxt:
            userViewModel.userError!.message.toString(), //maybe change is not
      );
    }
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              UserModel userMOdel = userViewModel.userListModel[index];

              return UserListRow(
                userMOdel: userMOdel,
                onTap: () async {
                  userViewModel.setSelectedUser(userMOdel);
                  openUserDetails(context);
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: userViewModel.userListModel.length));
  }
}
