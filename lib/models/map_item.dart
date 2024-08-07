class MapItem {
  final String name;
  final String coordinates;
  final String imagePath;
  final List<String> regions;
  final String regionImagePath;

  MapItem(this.name, this.coordinates, this.imagePath, this.regions,
      this.regionImagePath);
}

final List<MapItem> maps = [
  MapItem(
      'ASCENT',
      '45°26\'BF\'N,12°20\'Q\'E',
      'lib/assets/images/maps/ascent.png',
      [
        'A Site Default Plant',
        'A Heaven',
        'A Generator',
        'A Main',
        'B Site Default Plant',
        'B Main',
        'Mid Pizza',
        'Market',
        'Short',
        'Mid Link'
      ],
      'lib/assets/images/maps/ascent_region.png'),
  MapItem(
      'SPLIT',
      '35°41\'CD\'N,139°41\'WX\'E',
      'lib/assets/images/maps/split.png',
      [
        'A Site Default Plant',
        'A Main',
        'A Ramps',
        'B Site Default Plant',
        'B Main',
        'Mid Vent',
        'B Link'
      ],
      'lib/assets/images/maps/split_region.png'),
  MapItem(
      'SUNSET',
      '34°2\'C\'N 118°12\'YT\'W',
      'lib/assets/images/maps/sunset.png',
      [
        'A Site Default Plant',
        'A Main',
        'A Link',
        'B Site Default Plant',
        'B Main',
        'B Market',
        'Top Mid',
        'Bottom Mid'
      ],
      'lib/assets/images/maps/sunset_region.png'),
  MapItem(
      'LOTUS',
      '14°07\'AD4\'N8 74°53\'21\'E',
      'lib/assets/images/maps/lotus.png',
      [
        'A Site Default Plant',
        'A Main',
        'B Site Default Plant',
        'B Main',
        'C Site Default Plant',
        'C Main'
      ],
      'lib/assets/images/maps/lotus_region.png'),
  MapItem(
      'HAVEN',
      '27°28\'A\'N 89°38\'Wz\'E',
      'lib/assets/images/maps/haven.png',
      [
        'A Site Default Plant',
        'A Long',
        'B Site Default Plant',
        'B BackSite',
        'Garage',
        'C Site Default Plant',
        'C Long',
        'C Link'
      ],
      'lib/assets/images/maps/haven_region.png'),
  MapItem(
      'BIND',
      '34°2\'A\'N,6°51\'Z\'W',
      'lib/assets/images/maps/bind.png',
      [
        'A Site Default Plant',
        'A BackSite',
        'A Short',
        'A Lamps',
        'A Shower',
        'B Site Default Plant',
        'B BackSite',
        'B Garden',
        'Hookah'
      ],
      'lib/assets/images/maps/bind_region.png'),
  MapItem(
      'BREEZE',
      '26°11\'AG\'N 71°10\'WY\'W',
      'lib/assets/images/maps/breeze.png',
      [
        'A Site Default Plant',
        'A BackSite',
        'A Yellow',
        'A Main',
        'B Site Default Plant',
        'B BackSite',
        'B Main',
        'B Wall',
        'Mid Nest'
      ],
      'lib/assets/images/maps/breeze_region.png'),
  MapItem(
      'ABYSS',
      '70°50\'AJ\'N 9°00\'VX\'W',
      'lib/assets/images/maps/abyss.png',
      [
        'A Site Default Plant',
        'A BackSite',
        'A Main',
        'B Site Default Plant',
        'B BackSite',
        'B Heaven',
        'B Main',
        'B Nest',
        'Mid'
      ],
      'lib/assets/images/maps/abyss_region.png'),
  MapItem(
      'ICEBOX',
      '76°44\'A\'N 149°30\'Z\'E',
      'lib/assets/images/maps/icebox.png',
      [
        'A Site Default Plant',
        'A BackSite',
        'A Rafters',
        'A Main',
        'Top Mid',
        'Bottom Mid',
        'B Site Default Plant',
        'B Main',
        'B Yellow',
        'B Tower',
      ],
      'lib/assets/images/maps/icebox_region.png'),
  MapItem(
      'FRACTURE',
      '35°48\'B1\'N 106°08\'YQ\'W',
      'lib/assets/images/maps/fracture.png',
      [
        'A Site Default Plant',
        'A Main',
        'A Sand',
        'A Dish',
        'B Site Default Plant',
        'B Main',
        'B Arcade',
        'B Tower',
        'B Tree'
      ],
      'lib/assets/images/maps/fracture_region.png'),
  MapItem(
      'PEARL',
      '76°44\'A\'N 149°30\'XS\'W8',
      'lib/assets/images/maps/pearl.png',
      [
        'A Site Default Plant',
        'A Main',
        'A BackSite',
        'A Dugout',
        'A Flowers',
        'B Site Default Plant',
        'B Main',
        'B BackSite',
        'B Screen',
        'B Tower',
        'B Link',
        'Mid Doors',
        'Mid Art',
        'Top Mid'
      ],
      'lib/assets/images/maps/pearl_region.png'),
];
