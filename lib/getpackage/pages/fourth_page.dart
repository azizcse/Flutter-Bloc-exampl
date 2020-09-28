import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_page.dart';

class Fourth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fourth page"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () => Get.back(result: "Hello"),
                child: Text("Return hello"),
              ),

              RaisedButton(
                onPressed: () => Get.back(result: "Word"),
                child: Text("Return word"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
