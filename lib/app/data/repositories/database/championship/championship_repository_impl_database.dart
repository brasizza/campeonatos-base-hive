import '../../../../core/routes/routes.dart';
import '../../rest/championship/championship_export.dart';

class ChampionshipRepositoryDatabase implements ChampionshipRepository {
  late Database _database;

  @override
  Future<Championship?> getScore(String url, {required bool refresh}) async {
    final match = MatchesController.instance;
    final champs = await _database.getData<Championship>('championship');
    if (champs.isEmpty) {
      final repo = ChampionshipRepositoryImpl.instance;
      final score = await repo.getScore(url, refresh: refresh);
      if (score != null) {
        score.competition = match.competition;
        await _database.insert<Championship>(tableName: 'championship', value: score);
        return score;
      }
    } else {
      final existChampionship = champs.firstWhere((champ) => champ.competition == match.competition, orElse: () {
        return Championship(teams: [], matches: [], futureMaches: [], competition: null);
      }) as Championship;

      if (refresh == true && existChampionship.teams.isNotEmpty) {
        await existChampionship.delete();

        existChampionship.competition = null;
      }

      if (existChampionship.competition == null) {
        final repo = ChampionshipRepositoryImpl.instance;
        final score = await repo.getScore(url, refresh: refresh);
        if (score != null) {
          score.competition = match.competition;
          await _database.insert<Championship>(tableName: 'championship', value: score);
          return score;
        }
      } else {
        return existChampionship;
      }
    }
    return null;
  }

  static ChampionshipRepositoryDatabase? _instance;
  ChampionshipRepositoryDatabase._({required Database database}) {
    _database = database;
    Developer.logInstance(this);
  }

  static ChampionshipRepositoryDatabase get instance {
    if (_instance == null) {
      throw Exception();
    }
    return _instance!;
  }

  factory ChampionshipRepositoryDatabase.init({required Database database}) {
    _instance ??= ChampionshipRepositoryDatabase._(database: database);
    return _instance!;
  }
}
