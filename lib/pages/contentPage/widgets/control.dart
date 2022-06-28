import 'package:bookapp/models/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:bookapp/pages/constants/color.dart';
import 'package:provider/provider.dart';

class AudioControl extends StatefulWidget {
  final String srcUrl;
  AudioControl(this.srcUrl, {Key? key}) : super(key: key);

  @override
  State<AudioControl> createState() => _AudioControlState(srcUrl);
}

class _AudioControlState extends State<AudioControl> {
  final String srcUrl;
  _AudioControlState(this.srcUrl);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AudioBookPlayer(srcUrl),
      child: Container(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 60,
            child: SliderTheme(
              data: SliderThemeData(
                  trackHeight: 5,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8)),
              child: Consumer<AudioBookPlayer>(
                builder: (_, myBookModel, child) => Slider(
                    value: myBookModel.position == null
                        ? 0.0
                        : myBookModel.position!.inSeconds.toDouble(),
                    activeColor: activeColor,
                    inactiveColor: inActiveColor,
                    onChanged: (value) {
                      setState(() {
                        myBookModel.seekAudio(Duration(seconds: value.toInt()));
                      });
                    },
                    min: 0,
                    max: myBookModel.totDuration == null
                        ? 20
                        : myBookModel.totDuration!.inSeconds.toDouble()),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallButton(Icons.volume_up_outlined),
              SmallButton(Icons.replay_10_outlined),
              PlayButton(),
              SmallButton(Icons.forward_10_outlined),
              SmallButton(Icons.share),
            ],
          )
        ],
      )),
    );
  }
}

class SmallButton extends StatelessWidget {
  final IconData icon;
  const SmallButton(this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioBookPlayer>(
      builder: (_, myBookModel, child) => GestureDetector(
        onTap: () => {
          icon == Icons.forward_10_outlined
              ? myBookModel.forward10Sec()
              : icon == Icons.replay_10_outlined
                  ? myBookModel.replay10Sec()
                  : myBookModel.pauseAudio()
        },
        child: Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [bookAppShadow],
            color: bgBlack,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioBookPlayer>(
      builder: (_, myBookModel, child) => GestureDetector(
        onTap: () => {
          myBookModel.audioState == "playing"
              ? myBookModel.pauseAudio()
              : myBookModel.playAudio()
        },
        child: Container(
          width: 70,
          height: 70,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [bookAppShadow],
            color: bgBlack,
          ),
          child: Icon(
            myBookModel.audioState == "playing"
                ? Icons.pause_outlined
                : Icons.play_arrow_outlined,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}
