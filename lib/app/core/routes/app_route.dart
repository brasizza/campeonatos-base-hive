import 'package:flutter/material.dart';

import 'routes.dart';

class AppRoute extends Route {
  static Route<dynamic> routes(RouteSettings settings) {
    final DioRestClient rest = DioRestClient.instance;
    final Database database = DatabaseHive.init();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            CompetitionServiceImpl.init(
              repository: CompetitionRepositoryImpl.init(restClient: rest),
            );
            final SplashRepository repository = SplashRepositoryHive.init(database: database);
            final SplashService service = SplashServiceImpl.init(repository: repository);
            final controller = SplashController.init(service: service);
            return SplashPage(controller: controller);
          },
        );

      case '/home':
        final repository = CompetitionRepositoryDatabase.init(database: database);
        // final repository = CompetitionRepositoryImpl.init(restClient: rest);
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

      case '/leagues':
        final competiton = settings.arguments as Competition;
        final repository = ChampionshipRepositoryImpl.init(restClient: rest);
        final service = ChampionshipServiceImpl.init(repository: repository);
        final controller = LeaguesController.init(service: service)..competition = competiton;
        return MaterialPageRoute(
          builder: (context) {
            return LeaguesPage(
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
