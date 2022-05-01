import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/modules/home/controllers/home_controller.dart';

class Dummy extends StatefulWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {

  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            height: Get.width*0.5,
            width: Get.width*0.5,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(200)
            ),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: Get.width * 0.3,
                color: Colors.pink,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
