import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piggy_get/utils.dart';

import 'dialog_controllers.dart';

class AddUserDialog extends GetView<AddUserController> {
  const AddUserDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Container(
          height: 250,
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Text("הוסף משתמש"),
                TextFormField(
                  decoration: const InputDecoration(labelText: "שם"),
                  validator: FormValidators.name,
                  onChanged: controller.name,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "כסף",
                  ),
                  keyboardType: TextInputType.number,
                  validator: FormValidators.money,
                  onChanged: controller.money,
                ),
                SizedBox(height: 46),

                /// reactive button
                Obx(
                  () => ElevatedButton(
                    onPressed: controller.onSavePress,
                    child: Text('הוסף'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
