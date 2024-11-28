part of 'pokemon_cubit.dart';

class PokemonState extends Equatable {
  final List<PokemonCard> cards;
  final bool hasMore;
  final bool isLoading;
  final bool isError;

  const PokemonState({
    this.cards = const [],
    this.hasMore = true,
    this.isLoading = false,
    this.isError = false,
  });

  PokemonState copyWith({
    List<PokemonCard>? cards,
    bool? hasMore,
    bool? isLoading,
    bool? isError,
  }) {
    return PokemonState(
      cards: cards ?? this.cards,
      hasMore: hasMore ?? this.hasMore,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }

  @override
  List<Object?> get props => [cards, hasMore, isLoading, isError];
}
