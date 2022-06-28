import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioBookPlayer with ChangeNotifier {
  Duration? totDuration;
  Duration? position;
  String audioState = "stopped";
  final String url;
  AudioBookPlayer(this.url) {
    initAudio();
  }
  static AudioPlayer audioPlayer = AudioPlayer();
  initAudio() {
    // duration change
    audioPlayer.onDurationChanged.listen((updateDuration) {
      totDuration = updateDuration;
      notifyListeners();
    });
    // position change
    audioPlayer.onPositionChanged.listen((updateDuration) {
      position = updateDuration;
      notifyListeners();
    });

    // state change
    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == PlayerState.playing) {
        audioState = "playing";
      } else if (playerState == PlayerState.paused) {
        audioState = "paused";
      } else if (playerState == PlayerState.completed) {
        audioState = "completed";
      } else {
        audioState = "stopped";
      }
      notifyListeners();
    });
  }

  playAudio() {
    print(audioState);
    if (audioState == "paused")
      audioPlayer.resume();
    else if (audioState == "playing") {
      audioPlayer.stop();
      audioPlayer.play(UrlSource(url));
    } else
      audioPlayer.play(UrlSource(url));
  }

  pauseAudio() {
    audioPlayer.pause();
  }

  stopAudio() {
    audioPlayer.stop();
  }

  forward10Sec() {
    if (position == null) return;
    int time = position!.inSeconds.toInt() + 10.toInt();
    time <= totDuration!.inSeconds.toInt()
        ? seekAudio(Duration(seconds: time))
        : seekAudio(totDuration!);
  }

  replay10Sec() {
    if (position == totDuration) return;
    int time = position!.inSeconds.toInt() - 10.toInt();
    time > 0
        ? seekAudio(Duration(seconds: time))
        : seekAudio(Duration(seconds: 0));
  }

  seekAudio(Duration durationToSeek) {
    audioPlayer.seek(durationToSeek);
  }
}
