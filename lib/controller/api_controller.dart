import 'dart:convert';

import 'package:api_call/model/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  final String baseUrl = 'https://api.github.com/users';

  RxList<UserModel> userList = RxList<UserModel>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getApi();
  }

  void getApi() async {
    isLoading.value = true;
    var response = await http.get(Uri.parse(baseUrl));

    print(response.body);
    print(response.statusCode);

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var user in data) {
        userList.add(UserModel.fromJson(user));
      }
      print(userList);
      isLoading.value = false;
    } else {
      print('Somthing is wrong');
      isLoading.value = false;
    }
  }
}
