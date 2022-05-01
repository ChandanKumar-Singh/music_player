import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../Controller/PlayController.dart';

class PlayMusic extends GetView<PlayController> {
  @override
  Widget build(BuildContext context) {
    print(controller.songModel);
    return Scaffold(
      body: Container(
        color: Colors.black54,
        child: Column(
          children: [
            Container(
              height: Get.height * 0.2,
              color: Colors.black54,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() {
                        // int seconds = (['duration']/1000).round();
                        var duration =
                            ((controller.songModel.value.duration! / 1000) / 60)
                                    .round()
                                    .toString() +
                                ':' +
                                ((controller.songModel.value.duration! / 1000) %
                                        60)
                                    .round()
                                    .toString();
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Spacer(),
                            Text(
                              controller.songModel.value.displayName,
                              style: TextStyle(
                                  fontSize: Get.width * 0.05,
                                  color: Colors.white),
                              maxLines: 2,
                            ),
                            Row(
                              children: [
                                Text(
                                  controller.songModel.value.artist.toString(),
                                  style: TextStyle(
                                      fontSize: Get.width * 0.03,
                                      color: Colors.white),
                                  maxLines: 1,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  duration,
                                  style: TextStyle(
                                      fontSize: Get.width * 0.03,
                                      color: Colors.white),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    // height: Get.height * 0.2,
                    color: Colors.white60,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Stack(
                      children: [
                        Container(
                          // color: Colors.greenAccent,
                          height: Get.height * 0.5,
                          child: PageView.builder(
                              controller: controller.pageController,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: Get.width * 0.13,
                                    right: Get.width * 0.13,
                                    top: Get.width * 0.13,
                                    bottom: Get.width * 0.18,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xCDE4ECEC),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(Get.width * 0.1),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage('assets/music.jfif'),
                                        fit: BoxFit.cover
                                      )
                                    ),
                                    // height: Get.,
                                  ),
                                );
                              }),
                        ),
                        Positioned(
                          // alignment: Alignment.bottomLeft,
                          bottom: 0,
                          child: Container(
                              height: Get.height * 0.07,
                              width: Get.width,
                              // color: Colors.yellow,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildCircleAvatar(0),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  buildCircleAvatar(1),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  buildCircleAvatar(2),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: Get.height * 0.3,
                      decoration: BoxDecoration(
                        color: Color(0xC35A66DB),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Get.width * 0.1),
                          topLeft: Radius.circular(Get.width * 0.1),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Obx(() {
                          return Column(
                            children: [
                              Container(
                                height: Get.height * 0.05,
                                // color: Colors.green,
                                child: Row(
                                  children: [
                                    Obx(() {
                                      // int seconds = (['duration']/1000).round();
                                      var duration = (controller.sliderValue
                                                      .value.inHours /
                                                  60)
                                              .round()
                                              .toString() +
                                          ':' +
                                          (controller
                                                  .sliderValue.value.inMinutes)
                                              .round()
                                              .toString() +
                                          ':' +
                                          ((controller.sliderValue.value
                                                      .inSeconds) %
                                                  60)
                                              .round()
                                              .toString();
                                      return Text(
                                        duration,
                                        style: TextStyle(
                                            fontSize: Get.width * 0.03,
                                            color: Colors.white),
                                        maxLines: 1,
                                      );
                                    }),
                                    Expanded(
                                      child: Slider(
                                        min: 0,
                                        max: controller
                                            .songModel.value.duration!
                                            .toDouble(),
                                        value: controller
                                            .sliderValue.value.inMilliseconds
                                            .toDouble(),
                                        onChanged: (val) {
                                          controller.sliderValue.value =
                                              Duration(
                                                  microseconds:
                                                      (val * 1000).toInt());
                                          controller.audioPlayer.seek(Duration(
                                              microseconds:
                                                  (val * 1000).toInt()));
                                          // print(controller.sliderValue.value.toString() + '--------------------');
                                          // print(controller.sliderValue.value.inSeconds.toDouble().toString() + '------ftedgwedgefgdfgedgegegeg--------------');
                                        },
                                        activeColor: Colors.blue,
                                        inactiveColor: Colors.white,
                                      ),
                                    ),
                                    Obx(() {
                                      // int seconds = (['duration']/1000).round();
                                      var duration = ((controller.songModel
                                                          .value.duration! /
                                                      1000) /
                                                  60)
                                              .round()
                                              .toString() +
                                          ':' +
                                          ((controller.songModel.value
                                                          .duration! /
                                                      1000) %
                                                  60)
                                              .round()
                                              .toString();
                                      return Text(
                                        duration,
                                        style: TextStyle(
                                            fontSize: Get.width * 0.03,
                                            color: Colors.white),
                                        maxLines: 1,
                                      );
                                    }),
                                  ],
                                ),
                              ),
                              Container(
                                height: Get.height * 0.07,
                                // color: Colors.yellow,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.repeat,
                                        color: Colors.white,
                                        size: Get.width * 0.08,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_outline_rounded,
                                        color: Colors.white,
                                        size: Get.width * 0.08,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.format_list_bulleted_rounded,
                                        color: Colors.white,
                                        size: Get.width * 0.09,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: Get.height * 0.1,
                                // color: Colors.green,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        var matcheditem = controller
                                            .homeController.musicList.value
                                            .indexWhere((song) =>
                                                song.data ==
                                                controller
                                                    .songModel.value.data);
                                        print(matcheditem);

                                        controller.resumed.value = true;
                                        controller.songModel.value = controller
                                            .homeController
                                            .musicList
                                            .value[matcheditem - 1];
                                        controller.audioPlayer.play(controller
                                            .homeController
                                            .musicList
                                            .value[matcheditem - 1]
                                            .data);
                                      },
                                      icon: Icon(
                                        Icons.skip_previous_rounded,
                                        color: Colors.white,
                                        size: Get.width * 0.12,
                                      ),
                                    ),
                                    Obx(() {
                                      return IconButton(
                                        onPressed: () {
                                          
                                          controller.resumed.value =
                                              !controller.resumed.value;
                                          print(controller.resumed.value);
                                          controller.resumed.value
                                              ? controller.audioPlayer.resume()
                                              : controller.audioPlayer.pause();
                                        },
                                        icon: Icon(
                                          !controller.resumed.value
                                              ? Icons.play_circle_filled
                                              : Icons.pause,
                                          color: Colors.white,
                                          size: Get.width * 0.12,
                                        ),
                                      );
                                    }),
                                    IconButton(
                                      onPressed: () {
                                        var matcheditem = controller
                                            .homeController.musicList.value
                                            .indexWhere((song) =>
                                                song.data ==
                                                controller
                                                    .songModel.value.data);
                                        print(matcheditem);

                                        controller.resumed.value = true;
                                        controller.songModel.value = controller
                                            .homeController
                                            .musicList
                                            .value[matcheditem + 1];
                                        controller.audioPlayer.play(controller
                                            .homeController
                                            .musicList
                                            .value[matcheditem + 1]
                                            .data);
                                      },
                                      icon: Icon(
                                        Icons.skip_next_rounded,
                                        color: Colors.white,
                                        size: Get.width * 0.12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Obx buildCircleAvatar(int index) => Obx(() {
        return CircleAvatar(
          radius: 5,
          backgroundColor: index == controller.currentPage.value.toInt()
              ? Colors.blue
              : Colors.grey,
        );
      });
}
