import 'package:flutter/material.dart';
import 'package:flutter_widgets/getpackage/pages/fourth_page.dart';
import 'package:flutter_widgets/getpackage/pages/third_page.dart';
import 'package:get/get.dart';

class Second extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Second();
  }
}

class _Second extends State<Second> {
  String dataFromFourthScreen = "0";

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
                onPressed: () => Get.off(Third()),
                child: Text("Go to third remove this screen"),
              ),
              RaisedButton(
                onPressed: () => Get.offAll(Third()),
                child: Text("Go to third remove everything from stack"),
              ),
              Text("Date from fourth screen " + dataFromFourthScreen),
              RaisedButton(
                onPressed: () async {
                  dataFromFourthScreen = await Get.to(Fourth());
                  setState(() {

                  });
                },
                child: Text("Date from fourth screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
