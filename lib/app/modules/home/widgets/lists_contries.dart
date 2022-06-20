import 'package:flutter/material.dart';

import '../../../data/models/competition_model.dart';
import '../../../data/models/country_model.dart';

class ListCountries extends StatelessWidget {
  final Map<Country, List<Competition>>? competitions;
  const ListCountries(this.competitions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paises = competitions!.keys.toList();
    return GridView.builder(
      itemCount: paises.length,
      itemBuilder: ((context, index) {
        final pais = paises[index];
        return InkWell(
          onTap: () => Navigator.pushNamed(context, '/competitions', arguments: {'competitions': competitions?[pais], 'country': pais}),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  pais.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                (pais.flag == null)
                    ? const SizedBox.shrink()
                    : Image.network(
                        pais.flag!,
                        errorBuilder: (context, error, stackTrace) => const Text('Sem bandeira.'),
                      )
              ],
            ),
          ),
        );
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
    );
  }
}
