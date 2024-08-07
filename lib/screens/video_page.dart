import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant_app/services/services.dart';
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
  String videoUrl = ''; // Başlangıçta boş string
  YoutubePlayerController? _youtubePlayerController; // Nullable olarak başlat
  String videoType =
      'attack'; // Varsayılan olarak 'attack' videosu gösterilecek
  bool isVideoDataLoaded =
      false; // Video verisinin yüklenip yüklenmediğini kontrol eder
  bool isVideoReady =
      false; // Videonun tıklanabilir olup olmadığını kontrol eder
  bool isVideoPlaying =
      false; // Videonun oynatılıp oynatılmadığını kontrol eder

  @override
  void initState() {
    super.initState();
    _loadVideoData();
  }

  Future<void> _loadVideoData() async {
    try {
      videoData = await VideoService.loadVideoData();
      setState(() {
        isVideoDataLoaded = true; // Video verisinin yüklendiğini belirtir
      });
      _loadVideo();
    } catch (e) {
      print("Error loading video data: $e");
    }
  }

  void _loadVideo() {
    if (!isVideoDataLoaded)
      return; // Video verisi yüklenmediyse fonksiyondan çık

    String agentName = widget.agent["name"]?.toLowerCase() ?? "default_agent";
    String mapName = widget.map.name.toLowerCase();
    String regionName = widget.region.toLowerCase();
    videoUrl = VideoService.getVideoUrl(
        videoData, agentName, mapName, regionName, videoType);

    // Extract the video ID from the URL
    String videoId = YoutubePlayer.convertUrlToId(videoUrl) ?? '';

    // Initialize the YoutubePlayerController only if videoId is not empty
    if (videoId.isNotEmpty) {
      if (_youtubePlayerController != null) {
        _youtubePlayerController!.dispose(); // Dispose old controller
      }
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false, // Otomatik oynatmayı kapat
          loop: true,
          hideControls: false,
          showLiveFullscreenButton: true,
        ),
      );
      setState(() {
        isVideoReady = true; // Video hazır
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
                    isVideoPlaying =
                        false; // Videoyu yeniden yüklemeden önce durdur
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
                    isVideoPlaying =
                        false; // Videoyu yeniden yüklemeden önce durdur
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
