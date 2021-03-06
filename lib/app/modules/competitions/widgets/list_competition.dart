import 'package:flutter/material.dart';

import '../../../data/models/competition_model.dart';

class ListCompetition extends StatelessWidget {
  final List<Competition> competitions;
  const ListCompetition(this.competitions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: competitions.length,
      itemBuilder: ((context, index) {
        final competition = competitions[index];
        return InkWell(
          onTap: () => Navigator.pushNamed(context, '/matches', arguments: competition),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    competition.name,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                (competition.country.flag == null)
                    ? const SizedBox.shrink()
                    : Image.network(
                        competition.country.flag!,
                        errorBuilder: (context, error, stackTrace) => const Text('Sem bandeira.'),
                      )
              ],
            ),
          ),
        );
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
    );
  }
}
