import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piggy_get/pages/main/main_controller.dart';
import 'package:piggy_get/pages/main/main_view.dart';
import 'package:piggy_get/services/services.dart';

void main() {
  initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'piggy',
      theme: ThemeData(primarySwatch: Colors.purple),
      initialBinding: BindingsBuilder.put(() => MainController()),
      home: MainView(),
    );
  }
}
