import 'package:api_call/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiController apiController = Get.put(ApiController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'API CALL',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(
        () => apiController.isLoading.value
            ? const LinearProgressIndicator(
                color: Colors.black,
                minHeight: 8,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      children: apiController.userList
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    // 'https://avatars.githubusercontent.com/u/1?v=4', single image link.
                                    e.avatarUrl!,
                                  ),
                                ),
                                title: Text(
                                  e.login.toString(),
                                ),
                                subtitle: Text(
                                  e.id.toString(),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
