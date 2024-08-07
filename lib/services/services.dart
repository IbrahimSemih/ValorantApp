import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class VideoService {
  static Future<Map<String, dynamic>> loadVideoData() async {
    try {
      final jsonString = await rootBundle.loadString('lib/assets/videos.json');
      final jsonResponse = json.decode(jsonString);
      return jsonResponse;
    } catch (e) {
      print("Error loading video data: $e");
      rethrow; // Hata ile ilgili daha fazla bilgi almak için
    }
  }

  static String getVideoUrl(Map<String, dynamic> videoData, String agentName,
      String mapName, String regionName, String videoType) {
    final agentVideos = videoData["videos"] as List<dynamic>;
    final agentData = agentVideos.firstWhere(
      (video) =>
          video["agent"].toLowerCase() == agentName.toLowerCase() &&
          video["map"].toLowerCase() == mapName.toLowerCase(),
      orElse: () => {"sections": []},
    );

    final sections = agentData["sections"] as List<dynamic>;
    final sectionData = sections.firstWhere(
      (section) => section["section"].toLowerCase() == regionName.toLowerCase(),
      orElse: () => {"attack": [], "defence": []},
    );

    final urls = sectionData[videoType] as List<dynamic>;
    return urls.isNotEmpty ? urls[0] : ''; // İlk URL'yi kullan
  }
}
