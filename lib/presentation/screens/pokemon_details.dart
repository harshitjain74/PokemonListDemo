import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/pokemon_card.dart';

class PokemonDetailScreen extends StatelessWidget {
  final PokemonCard card;

  const PokemonDetailScreen({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 680,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("${card.name}"),
                background: Hero(
                  tag: card.id,
                  child: card.images?.large!=null
                      ? CachedNetworkImage(imageUrl: card.images!.large!)
                      : const Icon(Icons.image_search),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Details",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        _buildDetailRow("Type", card.types?.join(', ') ?? 'Unknown'),
                        _buildDetailRow("Sub Type", card.subtypes?.join(', ') ?? 'Unknown'),
                        _buildDetailRow("HP", card.hp ?? 'Unknown'),
                        _buildDetailRow("Set", card.pokemonCardSet?.name ?? 'Unknown'),
                        _buildDetailRow("Weaknesses",
                            card.weaknesses?.map((w) => "${w.type} - ${w.value}").join(', ') ?? 'None'),
                        _buildDetailRow("Artist", card.artist ?? 'Unknown'),
                        _buildDetailRow("Attacks", _getAttacks(card.attacks)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  String _getAttacks(List<Attack>? attacks) {
    if (attacks == null || attacks.isEmpty) return "None";
    return attacks.map((a) => "${a.name} (${a.damage})").join(', ');
  }
}
