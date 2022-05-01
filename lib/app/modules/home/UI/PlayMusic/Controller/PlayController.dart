import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/modules/home/controllers/home_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class PlayController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      currentPage.value = pageController.page!;
    });
    // ints.value = 0;
    songModel.value = Get.arguments;

    if (kIsWeb) {
      // Calls to Platform.isIOS fails on web
      return;
    }
    if (Platform.isIOS) {
      audioCache.fixedPlayer?.notificationService.startHeadlessService();
    }
    audioPlayer.play(songModel.value.data);
    audioPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      duration.value = d;
    });
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      print('Current position: $p');
      sliderValue.value = p;
    });
    audioPlayer.onPlayerCompletion.listen((event) {
      var matcheditem = homeController.musicList.value
          .indexWhere((song) => song.data == songModel.value.data);
      print(matcheditem);

      resumed.value = true;
      sliderValue.value = Duration(milliseconds: 0);
      songModel.value = homeController.musicList.value[matcheditem + 1];
      audioPlayer.play(homeController.musicList.value[matcheditem + 1].data);
    });
  }

  Rx<SongModel> songModel = SongModel({}).obs;
  late PageController pageController;
  var currentPage = 0.0.obs;
  var resumed = true.obs;
  // var sliderValue = 0.0.obs;
  Rx<Duration> duration = Duration().obs;
  Rx<Duration> sliderValue = Duration().obs;

  HomeController homeController = Get.put(HomeController());
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  void onClose() {
    // TODO: implement dispose
    super.onClose();
    audioPlayer.pause();
  }
}
