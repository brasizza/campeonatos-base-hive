import 'package:hive_flutter/hive_flutter.dart';

import '../../data/repositories/rest/competition/competiton_export.dart';
import '../database.dart';

class DatabaseHive implements Database {
  static DatabaseHive? _instance;

  DatabaseHive._() {
    Developer.logInstance(this);
    Hive.deleteFromDisk();
    Hive.initFlutter();
    Hive.registerAdapter(CountryAdapter());
    Hive.registerAdapter(CompetitionAdapter());
  }

  factory DatabaseHive.init() {
    _instance ??= DatabaseHive._();

    return _instance!;
  }

  @override
  Future openDatabase(String path) async {
    await Hive.openBox<Competition>('competition');
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
  Future<dynamic> getData<T>(String query) async {
    return Hive.box<T>(query).values;
  }
}
