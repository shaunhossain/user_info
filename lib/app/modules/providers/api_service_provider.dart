import 'dart:developer';

import 'package:get/get.dart';
import 'package:user_info/app/modules/user_info.dart';

abstract class ApiServiceProvider extends GetConnect{
  Future<List<UserInfo>> getUserInfo();
}

class UserInfoProvider extends ApiServiceProvider{
  @override
  Future<List<UserInfo>> getUserInfo() async {
    final response = await get("https://randomuser.me/api/?results=10");
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      log("response : ${response.body}");
      return response.body;
    }
  }
}