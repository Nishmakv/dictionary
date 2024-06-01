import 'package:just_audio/just_audio.dart';

class AudioService {
  final player = AudioPlayer();
  Future audioService(String url) async {
    try {
      await player.setUrl(url);
      player.play();
    } catch (e) {
      print('error setting url:$e');
    }
  }

  void dispose() {
    player.dispose();
  }
}
