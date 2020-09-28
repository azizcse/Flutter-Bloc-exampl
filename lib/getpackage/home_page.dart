import 'package:flutter/material.dart';
import 'package:flutter_widgets/getpackage/pages/second_page.dart';
import 'package:flutter_widgets/getpackage/state/count_controller.dart';
import 'package:flutter_widgets/getpackage/state/user_controller.dart';
import 'package:get/get.dart';

class GetStateManage extends StatelessWidget {
  //final CountController controller = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get X state"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CountController>(
              init: CountController(),
              builder: (_) {
                return Text("Current count value is ${_.count}");
              },
            ),
            SizedBox(
              height: 30,
            ),
            GetX<UserController>(
              init: UserController(),
              builder: (_) {
                return Text("Name ${_.user.value.name}");
              },
            ),
            Obx((){
              return Text("Stored count: ${Get.find<UserController>().user.value.count}");
            }),

            RaisedButton(
              onPressed: () {
                Get.find<UserController>().updateUser(Get.find<CountController>().count);
              },
              child: Text("Update name and count"),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: null,
              child: Text("Next screen"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.find<CountController>().increment();
        },
      ),
    );
  }
}

class GetPackageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get package home"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () => _gotToNext(),
              child: Text("Go to second"),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () => _showSnackBar(),
              child: Text("Snackbar"),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () => _showDialog(),
              child: Text("Dialog"),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () => __showBottomsheet(),
              child: Text("Bottom sheet"),
            ),
          ],
        ),
      ),
    );
  }

  void _gotToNext() {
    Get.to(Second());
  }

  void _showSnackBar() {
    Get.snackbar("GetX snack bar", "Snackbar from get x",
        snackPosition: SnackPosition.BOTTOM);
  }

  void _showDialog() {
    Get.defaultDialog(
      title: "Dialog from Get",
      content: Text("Supersimple dialog"),
    );
  }

  void __showBottomsheet() {
    Get.bottomSheet(Container(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Text("Bottom sheet"),
        ),
      ),
      color: Colors.black12,
    ));
  }
}
