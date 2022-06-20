import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/championship_model.dart';
import '../../data/models/game.dart';
import '../../data/models/team_model.dart';
import '../../data/repositories/rest/competition/competiton_export.dart';
import '../database.dart';

class DatabaseHive implements Database {
  static DatabaseHive? _instance;

  DatabaseHive._() {
    Developer.logInstance(this);
  }

  factory DatabaseHive.init() {
    _instance ??= DatabaseHive._();

    return _instance!;
  }

  @override
  Future openDatabase(String path) async {
    await Hive.initFlutter();
    // await Hive.deleteFromDisk();
    // await Hive.deleteBoxFromDisk('competition');
    // await Hive.deleteBoxFromDisk('championship');
    Hive.registerAdapter(CountryAdapter());
    Hive.registerAdapter(CompetitionAdapter());
    Hive.registerAdapter(GameAdapter());
    Hive.registerAdapter(TeamAdapter());
    Hive.registerAdapter(ChampionshipAdapter());
    await Hive.openBox<Competition>('competition');
    await Hive.openBox<Championship>('championship');
  }

  @override
  Future<void> populateCompetitions(Map<Country, List<Competition>>? competitions) async {
    if (competitions != null) {
      for (var competitions in competitions.values.toList()) {
        for (var competition in competitions) {
          await Hive.box<Competition>('competition').add(competition);
        }
      }
    }
  }

  @override
  Future<List> getData<T>(String query) async {
    return Hive.box<T>(query).values.toList();
  }

  @override
  Future insert<T>({String tableName = 'default', T? value}) async {
    if (value != null) {
      Hive.openBox<T>(tableName).then((box) {
        box.add(value);
      });
    }
  }
}
