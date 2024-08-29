// import 'package:audioplayers/audioplayers.dart';
//
// class RunAudio {
//   late AudioPlayer audioPlayer;
//   late AudioCache audioCache;
//   late Uri uri;
//   String musicName;
//
// /*  RunAudio._internal(this.musicName) {
//     audioCache = AudioCache(prefix: "");
//     audioPlayer = AudioPlayer();
//   }
//
//   static RunAudio? _instance;
//
//   factory RunAudio(String musicName) {
//     _instance ??= RunAudio._internal(musicName);
//
//     return _instance!;
//   }*/
//   RunAudio(this.musicName) {
//     audioCache = AudioCache(prefix: "");
//     audioPlayer = AudioPlayer();
//   }
//
//   void play() async {
//     uri = await audioCache.load(musicName);
//     await audioPlayer.play(UrlSource(uri.toString()));
//     audioPlayer.onPlayerComplete.listen((event) {
//       // disposeAudio();
//     });
//   }
//
//   void disposeAudio() {
//     audioCache.clearAll().then((value) {
//       audioPlayer.dispose();
//     });
//   }
// }
