import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piggy_get/pages/account/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(controller.title),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: controller.onBackPress,
          // onPressed: () => Navigator.pop(context, controller.hasMoneyValueChanged),
        ),
      ),
      body: UserView(),
    );
  }
}

class UserView extends GetView<AccountController> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Center(
            child: Obx(
              () => Text(
                controller.money,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: controller.openAddMoney,
            child: Text("הוסף כסף"),
          ),
        ],
      ),
    );
  }
}
