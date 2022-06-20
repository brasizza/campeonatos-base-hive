import '../../../../core/rest/rest_client.dart';
import '../../../../core/routes/routes.dart';
import '../../splash/splash_export.dart';

class SplashRepositoryImpl implements SplashRepository {
  static SplashRepositoryImpl? _instance;

  static RestClient? _restClient;

  SplashRepositoryImpl._({RestClient? restClient}) {
    Developer.logInstance(this);
    _restClient = restClient;
  }

  static SplashRepositoryImpl get instance {
    if (_instance == null) {
      throw Exception();
    }
    return _instance!;
  }

  factory SplashRepositoryImpl.init({RestClient? restClient}) {
    _instance ??= SplashRepositoryImpl._(restClient: restClient);
    return _instance!;
  }

  @override
  Future<void> populateCompetitions() async {}
}
