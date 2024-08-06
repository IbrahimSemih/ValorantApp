import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant_app/constants/color.dart';
import 'package:valorant_app/models/map_item.dart';
import 'package:valorant_app/screens/video_page.dart';

class MapsSection extends StatelessWidget {
  final Map<String, String> agent;
  final MapItem map;

  const MapsSection({
    super.key,
    required this.agent,
    required this.map,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: HexColor(backgroundColor),
      appBar: AppBar(
        backgroundColor: HexColor(backgroundColor),
        title: Text(
          map.name,
          style: const TextStyle(color: Colors.white, fontSize: 30),
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
          Image.asset(
            map.regionImagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 280),
            child: Text(
              "Regions",
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  fontFamily: "Valorant"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: map.regions.length,
              itemBuilder: (context, index) {
                final section = map.regions[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ListTile(
                    title: Text(
                      textAlign: TextAlign.center,
                      section,
                      style: const TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPage(
                            agent: agent,
                            map: map,
                            region: section,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
