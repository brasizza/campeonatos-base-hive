import '../models/championship_model.dart';
import 'rest/championship/championship_export.dart';

abstract class ChampionshipRepository {
  Future<Championship?> getScore(String url);
}
