import 'rest/competition/competiton_export.dart';

abstract class CompetitionRepository {
  Future<Map<Country, List<Competition>>?> getCompetitions(String url);
}
