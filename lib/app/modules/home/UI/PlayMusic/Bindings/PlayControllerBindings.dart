import 'package:get/get.dart';

import '../Controller/PlayController.dart';

class PlayControllerBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PlayController>(() => PlayController());
  }
}