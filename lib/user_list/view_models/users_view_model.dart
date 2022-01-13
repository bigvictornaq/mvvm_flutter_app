import 'package:flutter/material.dart';
import 'package:mvvvm_app/user_list/models/user_error.dart';
import 'package:mvvvm_app/user_list/models/user_list_model.dart';
import 'package:mvvvm_app/user_list/services/api_status.dart';
import 'package:mvvvm_app/user_list/services/user_services.dart';

class UserViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModerl = [];
  UserError? _userError;
  late UserModel _selectedUser;
  late UserModel _addingUser;

  bool get leading => _loading;
  List<UserModel> get userListModel => _userListModerl;
  UserError? get userError => _userError;
  UserModel get selectedUser => _selectedUser;
  UserModel get addingUser => _addingUser;

  UserViewModel() {
    getUser();
    _addingUser = UserModel();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModerl = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
  }

  addUser() async {
    if (!isValid()) {
      return;
    }
    _userListModerl.add(addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if (addingUser.name == null || addingUser.name!.isEmpty) {
      return false;
    }
    if (addingUser.email == null || addingUser.email!.isEmpty) {
      return false;
    }
    return true;
  }

  getUser() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse,
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
