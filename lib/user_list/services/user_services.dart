import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvvm_app/user_list/models/user_list_model.dart';
import 'package:mvvvm_app/user_list/services/api_status.dart';
import 'package:mvvvm_app/util/constants.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var response = await http.get(Uri.parse(USER_LIST));
      if (200 == response.statusCode) {
        return Success(response: userListModelFromJson(response.body));
      }
      return Failure(
          errorResponse: 'Invalid Response', code: USER_INVALID_RESPONSE);
    } on HttpException {
      return Failure(errorResponse: 'No Internet', code: USER_NO_INTERNET);
    } on SocketException {
      return Failure(
          errorResponse: 'No Internet Connection', code: USER_NO_INTERNET);
    } on FormatException {
      return Failure(
          errorResponse: 'Invalid Format', code: USER_INVALID_FORMAT);
    } catch (e) {
      return Failure(errorResponse: 'Unknown Error $e', code: 103);
    }
  }
}
