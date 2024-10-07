import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pharmcy/helper/apiExption.dart';
import 'package:pharmcy/helper/http_helper.dart';
import 'package:pharmcy/helper/storage_helper.dart';
import '../models/user.dart';

class UserVm with ChangeNotifier {
  Future<String?> register(User user, String url) async {
    try {
      HttpHelper http = HttpHelper.instance;
      Response res = await http.postRequest(url: url, data: user.authData());
      User u = User.fromJson(res.data['data']);
      print(u.email);
      print(u.name);
      print(u.token);
      print(u.id);
      saveUser(u);
      return "secssed";
    } on DioException catch (x) {
      return ApiException.handleException(x);
    } catch (e) {
      print(e);
      return "anuther exception";
    }
  }

  Future<String?> login(User user, String url) async {
    try {
      HttpHelper http = HttpHelper.instance;
      Response res = await http.postRequest(url: url, data: user.loginData());
      User u = User.fromJson(res.data['data']);
      print(u.email);
      print(u.name);
      print(u.token);
      print(u.id);
      saveUser(u);
      return "secssed";
    } on DioException catch (x) {
      return ApiException.handleException(x);
    } catch (e) {
      print(e);
      return "anuther exception";
    }
  }

  saveUser(User u) {
    StorageHelper storageHelper = StorageHelper.instance;

    storageHelper.writeKey("token", u.token!);
    storageHelper.writeKey("email", u.email!);
    storageHelper.writeKey("name", u.name!);
    storageHelper.writeKey("id", u.id.toString());
  }
} 
/*class UserVm with ChangeNotifier {
  Future<String?> _performRequest(User user, String url, bool isLogin) async {
    try {
      HttpHelper http = HttpHelper.instance;
      Response res = await http.postRequest(
          url: url, data: isLogin ? user.loginData() : user.authData());
      User u = User.fromJson(res.data);
      //saveUser(u);
      // notifyListeners();
      print(res.data);
      return "Success";
    } on DioException catch (x) {
      return ApiException.handleException(x);
    } catch (e) {
      print("Error occurred: $e");
      return "An error occurred. Please try again.";
    }
  }

  Future<String?> register(User user, String url) async {
    return await _performRequest(user, url, false);
  }

  Future<String?> login(User user, String url) async {
    return await _performRequest(user, url, true);
  }

  Future<String?> resetPassword(String email, String url) async {
    try {
      HttpHelper http = HttpHelper.instance;
      Response res = await http.postRequest(url: url, data: {'email': email});
      notifyListeners();
      return "A message has been sent to your email to reset your password.";
    } on DioException catch (x) {
      return ApiException.handleException(x);
    } catch (e) {
      print("Error occurred: $e");
      return "An error occurred. Please try again.";
    }
  }

  void saveUser(User u) {
    StorageHelper storageHelper = StorageHelper.instance;
    storageHelper.writeKey("token", u.token!);
    storageHelper.writeKey("email", u.email!);
    notifyListeners();
  }
}*/
