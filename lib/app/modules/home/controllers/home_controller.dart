import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final OnAudioQuery _audioQuery = OnAudioQuery();
  RxList<SongModel> musicList = <SongModel>[].obs;

  List<Permission> permissions = [
    Permission.storage,
    Permission.manageExternalStorage,
  ];
  void listMusics() async {
    await permissions.request();
    // DEFAULT:
    // SongSortType.TITLE,
    // OrderType.ASC_OR_SMALLER,
    // UriType.EXTERNAL,
    List<SongModel> something = await _audioQuery.querySongs();
    print(something.length);
    musicList.value = something;

    //album
    List<AlbumModel> allAlbums = await _audioQuery.queryAlbums();

    //playlist
    List<PlaylistModel> playList = await _audioQuery.queryPlaylists();

    //listGeners
    List<GenreModel> listGeners = await _audioQuery.queryGenres();

    //
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    listMusics();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
