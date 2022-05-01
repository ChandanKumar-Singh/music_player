import 'package:get/get.dart';
import 'package:music_player/app/modules/home/UI/PlayMusic/Bindings/PlayControllerBindings.dart';
import 'package:music_player/app/modules/home/UI/PlayMusic/view/PlayMusic.dart';

import 'package:music_player/app/modules/home/bindings/home_binding.dart';
import 'package:music_player/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PLAY,
      page: () => PlayMusic(),
      binding: PlayControllerBindings(),
    ),
  ];
}
