import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:music_player/dummy.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
               controller.listMusics();
                // Get.to(Dummy());
              },
              icon: Icon(
                Icons.refresh,
                color: CupertinoColors.white,
              )),

        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              // height: Get.height * 0.1,
              // color: Colors.transparent,
              child: Wrap(
            spacing: 10,
            children: [
              Chip(
                label: Text('Songs'),
                backgroundColor: Colors.pink,
              ),
              Chip(label: Text('Album')),
              Chip(label: Text('Artist')),
              Chip(label: Text('Generis')),
              Chip(label: Text('Playlists')),
            ],
          )),
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                    itemCount: controller.musicList.value.length,
                    itemBuilder: (context, i) {
                      SongModel songModel = controller.musicList.value[i];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 1),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed('/play', arguments: songModel);
                            print(songModel);
                          },
                          child: Container(
                            height: Get.height * 0.1,
                            decoration: BoxDecoration(
                              color: Color(0x60F3F3E9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    child: Text(
                                      '${songModel.album}',
                                      style: TextStyle(fontSize: Get.width * 0.02),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: Container(
                                        child: Text(
                                          songModel.displayName,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 2.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Text(
                                            songModel.duration.toString(),
                                            maxLines: 2,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            (songModel.size / 1024 / 1024)
                                                    .toStringAsFixed(2)
                                                    .toString() +
                                                ' ' +
                                                'Mb',
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }
            ),
          ),
        ],
      ),
    );
  }
}
