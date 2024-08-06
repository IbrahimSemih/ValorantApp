import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant_app/constants/color.dart';
import 'package:valorant_app/models/map_item.dart';
import 'package:valorant_app/screens/map_section_page.dart';

class MapsPage extends StatelessWidget {
  final Map<String, String> agent;

  const MapsPage({
    super.key,
    required this.agent,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Valorant"),
      home: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        appBar: AppBar(
          backgroundColor: HexColor(backgroundColor),
          title: const Text(
            'Maps',
            style: TextStyle(color: Colors.white, fontSize: 30),
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
        body: MapList(agent: agent),
      ),
    );
  }
}

class MapList extends StatelessWidget {
  final Map<String, String> agent;

  const MapList({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: maps.length,
      itemBuilder: (context, index) {
        return MapCard(map: maps[index], agent: agent);
      },
    );
  }
}

class MapCard extends StatelessWidget {
  final MapItem map;
  final Map<String, String> agent;

  const MapCard({super.key, required this.map, required this.agent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapsSection(map: map, agent: agent),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              map.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150.0,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    map.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    map.coordinates,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
