import '../export/championship.dart';

class ChampionshipServiceImpl implements ChampionshipService {
  String baseUrl = 'https://www.scorebat.com/api/competition/2/';
  @override
  Future<Championship?> getScore(String? link) async {
    String url = baseUrl + (link ?? '');
    return await _repository.getScore(url);
  }

  static ChampionshipServiceImpl? _instance;
  late ChampionshipRepository _repository;

  ChampionshipServiceImpl._({required ChampionshipRepository repository}) {
    _repository = repository;
    Developer.logInstance(this);
  }

  static ChampionshipServiceImpl get instance {
    if (_instance == null) {
      throw Exception();
    }
    return _instance!;
  }

  factory ChampionshipServiceImpl.init({required ChampionshipRepository repository}) {
    _instance ??= ChampionshipServiceImpl._(repository: repository);
    return _instance!;
  }
}
