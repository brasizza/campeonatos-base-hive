import '../export/championship.dart';

class ChampionshipServiceImpl implements ChampionshipService {
  String baseUrl = 'https://www.scorebat.com/api/competition/2/';
  @override
  Future<Championship?> getScore(String? link, {bool refresh = false}) async {
    String url = baseUrl + (link ?? '');
    return await _repository.getScore(url, refresh: refresh);
  }

  static ChampionshipServiceImpl? _instance;
  static late ChampionshipRepository _repository;

  ChampionshipServiceImpl._({required ChampionshipRepository repository}) {
    Developer.logInstance(this);
  }

  static ChampionshipServiceImpl get instance {
    if (_instance == null) {
      throw Exception();
    }
    return _instance!;
  }

  factory ChampionshipServiceImpl.init({required ChampionshipRepository repository, bool singleton = true}) {
    _repository = repository;
    if (singleton == true) {
      _instance ??= ChampionshipServiceImpl._(repository: repository);
    } else {
      _instance = ChampionshipServiceImpl._(repository: repository);
    }
    return _instance!;
  }
}
