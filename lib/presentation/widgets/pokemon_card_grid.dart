import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemontcg/core/config/app_config.dart';
import '../../data/models/pokemon_card.dart';

class PokemonCardGrid extends StatelessWidget {
  final List<PokemonCard> cards;
  final ScrollController scrollController;

  const PokemonCardGrid({required this.cards, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      itemCount: cards.length,
      itemBuilder: (_, index) {
        final card = cards[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.cardDetails, arguments: card);
          },
          child: Card(
            child: Column(
              children: [
                card.images?.small!=null
                    ? CachedNetworkImage(imageUrl: card.images!.small!, height: 280,)
                    : const Icon(Icons.image_search),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${card.name}", maxLines: 1),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
