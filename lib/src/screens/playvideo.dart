import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Course'),
      ),
      body: ListView(
        children: <Widget>[
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'videos/video1.mp4',
            ),
            looping: true,
            key: UniqueKey(),
            containerHeight: 200.0, // Set the desired height here
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'videos/video2.mp4',
            ),
            looping: true,
            key: UniqueKey(),
            containerHeight: 200.0, // Set the desired height here
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'videos/video4.mp4',
            ),
            looping: true,
            key: UniqueKey(),
            containerHeight: 200.0, // Set the desired height here
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'videos/video3.mp4',
            ),
            looping: true,
            key: UniqueKey(),
            containerHeight: 200.0, // Set the desired height here
          ),
        ],
      ),
    );
  }
}

class ChewieListItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final double containerHeight; // Add this property

  ChewieListItem({
    required this.videoPlayerController,
    required this.looping,
    required Key key,
    required this.containerHeight, // Initialize the property
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: widget.containerHeight,
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
