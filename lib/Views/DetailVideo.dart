import 'package:flutter/material.dart';
import 'package:recipeapp/Models/recipe.dart';
import 'package:video_player/video_player.dart';

class DetailVideo extends StatefulWidget {
  final Resep recipe;

  const DetailVideo({required this.recipe});

  @override
  State<DetailVideo> createState() => _DetailVideoState();
}

class _DetailVideoState extends State<DetailVideo> {

  late VideoPlayerController playerController;

  @override
  void initState() {
    super.initState();
    playerController = VideoPlayerController.network(widget.recipe.videourl)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => playerController.play());
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Video",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: 
          Center(
              child: playerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: playerController.value.aspectRatio,
                      child: VideoPlayer(playerController),
                    )
                  : Container(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            playerController.value.isPlaying
                ? playerController.pause()
                : playerController.play();
          });
        },
        backgroundColor: Colors.orange,
        child: Icon(
          playerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
        ),
      ),
    );
  }
}
