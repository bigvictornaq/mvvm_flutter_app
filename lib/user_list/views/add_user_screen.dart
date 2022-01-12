import 'package:flutter/material.dart';
import 'package:mvvvm_app/user_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text('add User'), actions: [
        IconButton(
            onPressed: () async {
              bool userAdded = await userViewModel.addUser();
              if (!userAdded) {
                return;
              }
              Navigator.pop(context);
            },
            icon: Icon(Icons.save))
      ]),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Name"),
              onChanged: (val) async {
                userViewModel.addingUser.name = val;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Email"),
              onChanged: (value) async {
                userViewModel.addingUser.email = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
