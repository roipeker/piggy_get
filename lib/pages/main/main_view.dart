import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('קופה דיגיטלית'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              /// special StateMixin "widget"
              child: controller.obx(
                (state) => ListView.builder(
                  itemCount: state!.length,
                  itemBuilder: (_, idx) {
                    final user = state[idx];
                    return ListTile(
                      onTap: () => controller.openUser(user),
                      title: Text(user.name),
                      subtitle: Text('${user.money} ש"ח '),
                    );
                  },
                ),
                onEmpty: Center(child: Text('no results')),
                onLoading: Center(child: CircularProgressIndicator()),
                onError: (error) => Text('error: $error'),
              ),
            ),
            ElevatedButton(
              onPressed: controller.onAddUserTap,
              child: Text("הוסף חשבון"),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
