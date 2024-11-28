import 'package:dio/dio.dart';
import '../models/pokemon_card.dart';

class PokemonRepository {
  final Dio _dio;

  PokemonRepository(this._dio);

  Future<List<PokemonCard>> fetchCards(int page, String? query) async {
    late final Response response;
    if(query!=null && query.isNotEmpty){
        response = await _dio.get(
          'https://api.pokemontcg.io/v2/cards',
          queryParameters: {'q': "set.name:$query"});
    } else {
        response = await _dio.get(
          'https://api.pokemontcg.io/v2/cards',
          queryParameters: {'page': page, 'pageSize': 10},
        );
    }
    final data = response.data['data'] as List;
    return data.map((json) => PokemonCard.fromJson(json)).toList();;
  }
}
