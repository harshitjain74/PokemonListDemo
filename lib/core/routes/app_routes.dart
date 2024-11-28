import 'package:flutter/material.dart';
import '../../data/models/pokemon_card.dart';
import '../../presentation/screens/pokemon_details.dart';
import '../../presentation/screens/pokemon_list.dart';
import '../../presentation/widgets/unknown_routes_view.dart';
import 'slide_route_builder.dart';

class AppRoutes {
  // const AppRoutes();

  static const launch = '/';
  static const cardDetails = 'card-details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case launch:
        return SlideRouteBuilder(page: const PokemonListScreen(), route: launch);
      case cardDetails:
        final PokemonCard details = (settings.arguments ?? "") as PokemonCard;
        return SlideRouteBuilder(
            page: PokemonDetailScreen(card: details), route: AppRoutes.cardDetails);
    default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => const UnknownView());
  }
}
