import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_page.dart';

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () => Get.to(GetPackageApp()),
                child: Text("Go to home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
