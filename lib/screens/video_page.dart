import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant_app/services/video_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:valorant_app/constants/color.dart';
import 'package:valorant_app/models/map_item.dart';

class VideoPage extends StatefulWidget {
  final Map<String, String> agent;
  final MapItem map;
  final String region;

  const VideoPage({
    super.key,
    required this.agent,
    required this.map,
    required this.region,
  });

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late Map<String, dynamic> videoData;
  String videoUrl = '';
  YoutubePlayerController? _youtubePlayerController;
  String videoType = 'attack'; // Varsayılan video türü
  bool isVideoDataLoaded = false;
  bool isVideoReady = false;
  bool isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _loadVideoData();
  }

  Future<void> _loadVideoData() async {
    try {
      videoData = await VideoService.loadVideoData();
      print('Video data loaded successfully: $videoData'); // Hata ayıklama
      setState(() {
        isVideoDataLoaded = true;
      });
      _loadVideo(); // Video verileri yüklendikten sonra videoyu yükle
    } catch (e) {
      print("Error loading video data: $e");
      // Kullanıcıya hata mesajı göstermek için bir yöntem ekleyin
    }
  }

  void _loadVideo() {
    if (!isVideoDataLoaded) return;

    String agentName = widget.agent["name"]?.toLowerCase() ?? "default_agent";
    videoUrl = VideoService.getVideoUrl(
        videoData, agentName, widget.map.name, widget.region, videoType);

    // Video URL'sinin geçerli olup olmadığını kontrol et
    if (videoUrl.isEmpty || YoutubePlayer.convertUrlToId(videoUrl) == null) {
      videoUrl = 'https://www.youtube.com/watch?v=7zsVIVufpbM'; // Test URL'si
    }

    String videoId = YoutubePlayer.convertUrlToId(videoUrl) ?? '';

    if (videoId.isNotEmpty) {
      _youtubePlayerController?.dispose();
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          loop: true,
          hideControls: false,
          showLiveFullscreenButton: true,
        ),
      );
      setState(() {
        isVideoReady = true;
      });
    } else {
      print("Error: Video ID is empty");
    }
  }

  @override
  void dispose() {
    _youtubePlayerController?.dispose();
    super.dispose();
  }

  void _playVideo() {
    if (_youtubePlayerController != null) {
      setState(() {
        isVideoPlaying = true;
      });
      _youtubePlayerController!.play();
    }
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
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Center(
              child: isVideoReady
                  ? Stack(
                      children: [
                        YoutubePlayer(
                          controller: _youtubePlayerController!,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.blueAccent,
                          progressColors: const ProgressBarColors(
                            playedColor: Colors.blueAccent,
                            handleColor: Colors.blueAccent,
                          ),
                        ),
                        if (!isVideoPlaying)
                          Positioned.fill(
                            child: Container(
                              color: Colors.black54,
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: _playVideo,
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
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
                    isVideoPlaying = false;
                    _loadVideo(); // Attack videosunu yükle
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
                    isVideoPlaying = false;
                    _loadVideo(); // Defence videosunu yükle
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
