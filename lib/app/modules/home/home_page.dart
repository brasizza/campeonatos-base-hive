import 'package:flutter/material.dart';
import '../../core/widgets/error.dart';
import '../../core/widgets/loading.dart';
import '../../core/widgets/no_data.dart';
import '../../data/models/competition_model.dart';
import '../../data/models/country_model.dart';
import 'controller/home_controller.dart';
import 'widgets/lists_contries.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({Key? key, required this.controller, Object? arguments}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Competições pelo mundo!'),
      ),
      body: FutureBuilder<Map<Country, List<Competition>>?>(
          future: widget.controller.getCompetitions(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const LoadingWidgetCustom(text: 'Carregando as competições');
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return ErrorWidgetCustom(text: snapshot.error.toString());
                }
                if (!snapshot.hasData) {
                  return const NoDataWidgetCustom(text: 'Nenhuma competição encontrada');
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListCountries(snapshot.data),
                );
            }
          }),
    );
  }
}
