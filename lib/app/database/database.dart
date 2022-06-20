import '../data/models/competition_model.dart';
import '../data/models/country_model.dart';

abstract class Database {
  Future openDatabase(String path);
  Future<void> populateCompetitions(Map<Country, List<Competition>>? competitions);
  Future<List> getData<T>(String query);

  insert<T>({String tableName, T value});
}
