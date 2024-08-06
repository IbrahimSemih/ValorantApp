final List<Map<String, String>> agents = [
  {
    "name": "JETT",
    "role": "DUELIST",
    "image": "lib/assets/images/agents/jett.png"
  },
  {
    "name": "RAZE",
    "role": "DUELIST",
    "image": "lib/assets/images/agents/raze.png"
  },
  {
    "name": "REYNA",
    "role": "DUELIST",
    "image": "lib/assets/images/agents/reyna.png"
  },
  {
    "name": "PHOENIX",
    "role": "DUELIST",
    "image": "lib/assets/images/agents/phoenix.png"
  },
  {
    "name": "ISO",
    "role": "DUELIST",
    "image": "lib/assets/images/agents/iso.png"
  },
  {
    "name": "NEON",
    "role": "DUELIST",
    "image": "lib/assets/images/agents/neon.png"
  },
  {
    "name": "YORU",
    "role": "DUELIST",
    "image": "lib/assets/images/agents/yoru.png"
  },
  {
    "name": "DEADLOCK",
    "role": "SENTINEL",
    "image": "lib/assets/images/agents/deadlock.png"
  },
  {
    "name": "CYPHER",
    "role": "SENTINEL",
    "image": "lib/assets/images/agents/cypher.png"
  },
  {
    "name": "KILLJOY",
    "role": "SENTINEL",
    "image": "lib/assets/images/agents/killjoy.png"
  },
  {
    "name": "CHAMBER",
    "role": "SENTINEL",
    "image": "lib/assets/images/agents/chamber.png"
  },
  {
    "name": "SAGE",
    "role": "SENTINEL",
    "image": "lib/assets/images/agents/sage.png"
  },
  {
    "name": "FADE",
    "role": "INITIATOR",
    "image": "lib/assets/images/agents/fade.png"
  },
  {
    "name": "SOVA",
    "role": "INITIATOR",
    "image": "lib/assets/images/agents/sova.png"
  },
  {
    "name": "GEKKO",
    "role": "INITIATOR",
    "image": "lib/assets/images/agents/gekko.png"
  },
  {
    "name": "BREACH",
    "role": "INITIATOR",
    "image": "lib/assets/images/agents/breach.png"
  },
  {
    "name": "SKYE",
    "role": "INITIATOR",
    "image": "lib/assets/images/agents/skye.png"
  },
  {
    "name": "KAY/O",
    "role": "INITIATOR",
    "image": "lib/assets/images/agents/kayo.png"
  },
  {
    "name": "OMEN",
    "role": "CONTROLLER",
    "image": "lib/assets/images/agents/omen.png"
  },
  {
    "name": "BRIMSTONE",
    "role": "CONTROLLER",
    "image": "lib/assets/images/agents/brimstone.png"
  },
  {
    "name": "VIPER",
    "role": "CONTROLLER",
    "image": "lib/assets/images/agents/viper.png"
  },
  {
    "name": "HARBOR",
    "role": "CONTROLLER",
    "image": "lib/assets/images/agents/harbor.png"
  },
  {
    "name": "CLOVE",
    "role": "CONTROLLER",
    "image": "lib/assets/images/agents/clove.png"
  },
  {
    "name": "ASTRA",
    "role": "CONTROLLER",
    "image": "lib/assets/images/agents/astra.png"
  },
];

List<Map<String, String>> getFilteredAgents(String role) {
  if (role == "ALL") {
    return agents;
  }
  return agents.where((agent) => agent["role"] == role).toList();
}
