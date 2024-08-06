import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:valorant_app/constants/color.dart';
import 'package:valorant_app/models/map_item.dart';

class VideoPage extends StatefulWidget {
  final Map<String, String> agent;
  final MapItem map;
  final String region;

  const VideoPage(
      {super.key,
      required this.agent,
      required this.map,
      required this.region});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  String videoType =
      'attack'; // Varsayılan olarak 'attack' videosu gösterilecek

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  void _loadVideo() {
    String videoPath =
        getVideoPath(widget.agent, widget.map, widget.region, videoType);
    _videoPlayerController = VideoPlayerController.asset(videoPath);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      fullScreenByDefault: true,
      // Diğer Chewie seçeneklerini buraya ekleyebilirsiniz
    );

    _videoPlayerController.initialize().then((_) {
      setState(() {});
    }).catchError((error) {
      print("Error initializing video player: $error");
    });
  }

  String getVideoPath(
      Map<String, String> agent, MapItem map, String region, String type) {
    String agentName =
        agent["name"]?.toLowerCase().replaceAll(" ", "_") ?? "default_agent";
    String mapName = map.name.toLowerCase().replaceAll(" ", "_");
    String regionName = region.toLowerCase().replaceAll(" ", "_");
    String path =
        'lib/assets/videos/${agentName}_${mapName}_${regionName}_$type.mp4';
    return path;
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: HexColor(backgroundColor),
      appBar: AppBar(
        backgroundColor: HexColor(backgroundColor),
        title: Text(
          widget.map.name,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        toolbarHeight: height / 11,
        leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Center(
              child: _chewieController.videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController,
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  setState(() {
                    videoType = 'attack';
                    _loadVideo(); // Videoyu yeniden yükle
                  });
                },
                child: const Text(
                  'Attack',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  setState(() {
                    videoType = 'defence';
                    _loadVideo(); // Videoyu yeniden yükle
                  });
                },
                child: const Text('Defence',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
