import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/pokemon_card.dart';
import '../data/repositories/pokemon_repository.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokemonRepository repository;

  PokemonCubit(this.repository) : super(PokemonState());

  void fetchCards(int page, {String? query}) async {
    if (state.isLoading || !state.hasMore) return;
    emit(state.copyWith(isLoading: true));

    try {
      final newCards = await repository.fetchCards(page, query);
      emit(
        state.copyWith(
          cards: [...state.cards, ...newCards],
          hasMore: newCards.isNotEmpty,
          isLoading: false,
        ),
      );
    } catch (_) {
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }
}
