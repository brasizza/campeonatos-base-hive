import '../../../../database/database.dart';
import '../../rest/competition/competiton_export.dart';

class CompetitionRepositoryDatabase implements CompetitionRepository {
  late Database _database;

  @override
  Future<Map<Country, List<Competition>>?> getCompetitions(String url) async {
    Map<Country, List<Competition>> competicoes = {};

    try {
      final competitions = await _database.getData<Competition>('competition');
      for (var competition in competitions) {
        final country = (competition.country);
        if (!competicoes.containsKey(country)) {
          competicoes[country] = [];
        }
        competicoes[country]?.add((competition));
      }

      return competicoes;
    } catch (error) {
      return Future.error('Falha ao recuperar os dados');
    }
  }

  static CompetitionRepositoryDatabase? _instance;
  CompetitionRepositoryDatabase._({required Database database}) {
    _database = database;
    Developer.logInstance(this);
  }

  static CompetitionRepositoryDatabase get instance {
    if (_instance == null) {
      throw Exception();
    }
    return _instance!;
  }

  factory CompetitionRepositoryDatabase.init({required Database database}) {
    _instance ??= CompetitionRepositoryDatabase._(database: database);
    return _instance!;
  }
}
