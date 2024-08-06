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
      ['A site', 'A Main', 'B site', 'B Main', 'Mid', 'Short', 'B Link'],
      'lib/assets/images/maps/ascent_region.png'),
  MapItem(
      'SPLIT',
      '35°41\'CD\'N,139°41\'WX\'E',
      'lib/assets/images/maps/split.png',
      ['A site', 'A Main', 'B site', 'B Main', 'Mid', 'Short', 'B Link'],
      'lib/assets/images/maps/split_region.png'),
  MapItem(
      'SUNSET',
      '34°2\'C\'N 118°12\'YT\'W',
      'lib/assets/images/maps/sunset.png',
      [
        'A site',
        'A Main',
        'B site',
        'B Main',
        'B Market' 'Mid',
        'Top mid',
        'B Link'
      ],
      'lib/assets/images/maps/sunset_region.png'),
  MapItem(
      'LOTUS',
      '14°07\'AD4\'N8 74°53\'21\'E',
      'lib/assets/images/maps/lotus.png',
      ['A site', 'A Main', 'B site', 'B Main', 'Mid', 'Short', 'B Link'],
      'lib/assets/images/maps/lotus_region.png'),
  MapItem(
      'HAVEN',
      '27°28\'A\'N 89°38\'Wz\'E',
      'lib/assets/images/maps/haven.png',
      ['A site', 'A Main', 'B site', 'B Main', 'Mid', 'Short', 'B Link'],
      'lib/assets/images/maps/haven_region.png'),
  MapItem(
      'BIND',
      '34°2\'A\'N,6°51\'Z\'W',
      'lib/assets/images/maps/bind.png',
      ['A site', 'A Main', 'B site', 'B Main', 'Mid', 'Short', 'B Link'],
      'lib/assets/images/maps/bind_region.png'),
  MapItem(
      'BREEZE',
      '26°11\'AG\'N 71°10\'WY\'W',
      'lib/assets/images/maps/breeze.png',
      ['A site', 'A Main', 'B site', 'B Main', 'Mid', 'Short', 'B Link'],
      'lib/assets/images/maps/breeze_region.png'),
  MapItem(
      'ABYSS',
      '70°50\'AJ\'N 9°00\'VX\'W',
      'lib/assets/images/maps/abyss.png',
      ['A site', 'A Main', 'B site', 'B Main', 'Mid', 'Short', 'B Link'],
      'lib/assets/images/maps/abyss_region.png'),
  MapItem(
      'ICEBOX',
      '76°44\'A\'N 149°30\'Z\'E',
      'lib/assets/images/maps/icebox.png',
      ['A site', 'A Main', 'B site', 'B Main', 'Mid', 'Short', 'B Link'],
      'lib/assets/images/maps/icebox_region.png'),
  MapItem(
      'FRACTURE',
      '35°48\'B1\'N 106°08\'YQ\'W',
      'lib/assets/images/maps/fracture.png',
      ['A site', 'A Main', 'B site', 'B Main', 'Mid', 'Short', 'B Link'],
      'lib/assets/images/maps/fracture_region.png'),
  MapItem(
      'PEARL',
      '76°44\'A\'N 149°30\'XS\'W8',
      'lib/assets/images/maps/pearl.png',
      ['A site', 'A Main', 'B site', 'B Main', 'Mid', 'Short', 'B Link'],
      'lib/assets/images/maps/pearl_region.png'),
];
