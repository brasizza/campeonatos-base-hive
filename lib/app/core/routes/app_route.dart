import 'package:flutter/material.dart';

import '../../data/repositories/database/championship/championship_repository_impl_database.dart';
import '../../data/repositories/rest/splash/splash_repository_impl.dart';
import 'routes.dart';

class AppRoute extends Route {
  static Route<dynamic> routes(RouteSettings settings) {
    final DioRestClient rest = DioRestClient.instance;
    final Database database = DatabaseHive.init();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            CompetitionRepositoryImpl.init(restClient: rest);

            // final SplashRepository repository = SplashRepositoryHive.init(database: database);
            final SplashRepository repository = SplashRepositoryImpl.init(restClient: rest);
            final SplashService service = SplashServiceImpl.init(repository: repository);
            final controller = SplashController.init(service: service);
            return SplashPage(controller: controller);
          },
        );

      case '/home':
        // final repository = CompetitionRepositoryDatabase.init(database: database);
        final repository = CompetitionRepositoryImpl.init(restClient: rest);
        final service = CompetitionServiceImpl.init(repository: repository);
        final controller = HomeController.init(service: service);
        return MaterialPageRoute(
          builder: (context) {
            return HomePage(
              controller: controller,
            );
          },
        );

      case '/competitions':
        final arguments = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) {
            return CompetitionPage(
              competitions: arguments['competitions'] ?? [],
              country: arguments['country'],
            );
          },
        );

      case '/matches':
        final competiton = settings.arguments as Competition;
        ChampionshipServiceImpl.init(repository: ChampionshipRepositoryImpl.init(restClient: rest));
        final service = ChampionshipServiceImpl.init(repository: ChampionshipRepositoryDatabase.init(database: database));

        final controller = MatchesController.init(service: service)..competition = competiton;
        return MaterialPageRoute(
          builder: (context) {
            return MatchesPage(
              controller: controller,
            );
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const ErrorWidgetCustom(text: 'Rota não encontrada');
          },
        );
    }
  }
}
