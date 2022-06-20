import '../../../core/routes/routes.dart';
import 'splash_export.dart';

class SplashRepositoryHive implements SplashRepository {
  static SplashRepositoryHive? _instance;

  static Database? _database;

  SplashRepositoryHive._({Database? database}) {
    Developer.logInstance(this);
    _database = database;
  }

  static SplashRepositoryHive get instance {
    if (_instance == null) {
      throw Exception();
    }
    return _instance!;
  }

  factory SplashRepositoryHive.init({Database? database}) {
    _instance ??= SplashRepositoryHive._(database: database);
    return _instance!;
  }

  @override
  Future<void> populateCompetitions() async {
    if (_database != null) {
      final competitionService = CompetitionServiceImpl.instance;
      final competitions = await competitionService.getCompetitions();
      await _database!.openDatabase('project');
      await _database!.populateCompetitions(competitions);
    }
  }
}
