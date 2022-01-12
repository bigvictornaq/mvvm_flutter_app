import 'package:flutter/material.dart';
import 'package:mvvvm_app/user_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserViewModel())],
      child: MaterialApp(
        title: 'MVVM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: HomeScreen(),
      ),
    );
  }
}
