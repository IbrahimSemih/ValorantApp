import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant_app/constants/color.dart';
import 'package:valorant_app/models/agents.dart';
import 'package:valorant_app/screens/maps_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Map<String, String>> filteredAgents;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    filteredAgents = getFilteredAgents("ALL");

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          switch (_tabController.index) {
            case 0:
              filteredAgents = getFilteredAgents("ALL");
              break;
            case 1:
              filteredAgents = getFilteredAgents("DUELIST");
              break;
            case 2:
              filteredAgents = getFilteredAgents("SENTINEL");
              break;
            case 3:
              filteredAgents = getFilteredAgents("INITIATOR");
              break;
            case 4:
              filteredAgents = getFilteredAgents("CONTROLLER");
              break;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return MaterialApp(
      theme: ThemeData(fontFamily: "Valorant"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        appBar: AppBar(
          title: const Text(
            "AGENTS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: HexColor(backgroundColor),
          toolbarHeight: height / 11,
        ),
        body: Column(
          children: [
            Container(
              color: HexColor(backgroundColor),
              child: Center(
                child: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.red,
                  ),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: "Valorant",
                    fontSize: 15,
                  ),
                  tabs: const [
                    Tab(text: "ALL"),
                    Tab(text: "DUELIST"),
                    Tab(text: "SENTINEL"),
                    Tab(text: "INITIATOR"),
                    Tab(text: "CONTROLLER"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: filteredAgents.length,
                itemBuilder: (context, index) {
                  final agent = filteredAgents[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapsPage(agent: agent),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.grey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(75, 15, 0, 0),
                                child: Image.asset(
                                  agent["image"]!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  agent["role"]!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  agent["name"]!,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
