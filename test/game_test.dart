import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_cengel_bulmaca/oyun_cengel_bulmaca.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(cengelConfig.title.length, 33);
    expect(cengelConfig.tagline.length, 33);
    for (final s in cengelConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(cengelConfig.gameId, cengelId);
    expect(cengelRules.gameId, cengelId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(cengelRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: cengelId, optionalMechanics: cengelRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      cengelRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(cengelRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
