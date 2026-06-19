import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AudioVideoPage extends StatefulWidget {
  const AudioVideoPage({super.key});

  @override
  State<AudioVideoPage> createState() => _AudioVideoPageState();
}

class _AudioVideoPageState extends State<AudioVideoPage> {

  final AudioPlayer audioPlayer = AudioPlayer();

  late VideoPlayerController videoController;

  bool isPlayingAudio = false;

  @override
  void initState() {

    super.initState();

    videoController = VideoPlayerController.asset(
      'assets/video/CINEMATIC.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
      });

  }

  Future<void> playAudio() async {

    await audioPlayer.play(
      AssetSource('audio/rekaman.mp3'),
    );

    setState(() {
      isPlayingAudio = true;
    });

  }

  Future<void> pauseAudio() async {

    await audioPlayer.pause();

    setState(() {
      isPlayingAudio = false;
    });

  }

  @override
  void dispose() {

    audioPlayer.dispose();
    videoController.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Audio dan Video",
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Card(

              elevation: 5,

              child: Padding(

                padding: const EdgeInsets.all(20),

                child: Column(

                  children: [

                    const Icon(
                      Icons.music_note,
                      size: 80,
                      color: Colors.deepPurple,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Audio Player",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      "Lagu Pembelajaran Flutter",
                    ),

                    const SizedBox(height: 20),

                    Row(

                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [

                        ElevatedButton.icon(

                          onPressed: playAudio,

                          icon: const Icon(
                            Icons.play_arrow,
                          ),

                          label: const Text(
                            "Play",
                          ),

                        ),

                        const SizedBox(width: 10),

                        ElevatedButton.icon(

                          onPressed: pauseAudio,

                          icon: const Icon(
                            Icons.pause,
                          ),

                          label: const Text(
                            "Pause",
                          ),

                        ),

                      ],

                    ),

                  ],

                ),

              ),

            ),

            const SizedBox(height: 30),

            Card(

              elevation: 5,

              child: Padding(

                padding: const EdgeInsets.all(15),

                child: Column(

                  children: [

                    const Text(

                      "Video Player",

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),

                    ),

                    const SizedBox(height: 15),

                    if (videoController.value.isInitialized)

                      AspectRatio(

                        aspectRatio:
                        videoController.value.aspectRatio,

                        child: VideoPlayer(
                          videoController,
                        ),

                      ),

                    const SizedBox(height: 10),

                    ElevatedButton.icon(

                      onPressed: () {

                        setState(() {

                          if (videoController.value.isPlaying) {

                            videoController.pause();

                          } else {

                            videoController.play();

                          }

                        });

                      },

                      icon: Icon(

                        videoController.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,

                      ),

                      label: Text(

                        videoController.value.isPlaying
                            ? "Pause"
                            : "Play",

                      ),

                    ),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}