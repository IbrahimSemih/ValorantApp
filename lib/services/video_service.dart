import 'package:firebase_database/firebase_database.dart';

class VideoService {
  static final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  static Future<Map<String, dynamic>> loadVideoData() async {
    try {
      final snapshot = await _dbRef.child('agents').get();
      if (snapshot.exists) {
        final data = snapshot.value;
        if (data is Map<dynamic, dynamic>) {
          // Veriyi doğru türde `Map<String, dynamic>` olarak dönüştür
          return data.map((key, value) =>
              MapEntry(key as String, value as Map<String, dynamic>));
        } else {
          throw Exception('Data is not of type Map');
        }
      } else {
        throw Exception('No data available');
      }
    } catch (e) {
      print("Error loading video data: $e");
      rethrow;
    }
  }

  static String getVideoUrl(Map<String, dynamic> videoData, String agentName,
      String mapName, String regionName, String videoType) {
    if (videoData.containsKey(agentName)) {
      final agentData = videoData[agentName];
      if (agentData is Map<String, dynamic>) {
        final agentVideos = agentData['videos'];
        if (agentVideos is Map<String, dynamic>) {
          return agentVideos[videoType] ?? '';
        } else {
          print("Error: 'videos' is not a Map<String, dynamic>");
        }
      } else {
        print("Error: Agent data is not a Map<String, dynamic>");
      }
    } else {
      print("Error: Agent name not found in video data");
    }
    return '';
  }
}
