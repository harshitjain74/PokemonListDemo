import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/pokemon_cubit.dart';
import '../widgets/pokemon_card_grid.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  int _page = 1;
  late final ScrollController _scrollController;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        _page++;
        context.read<PokemonCubit>().fetchCards(_page);
      }
    });

    // Fetch initial data
    context.read<PokemonCubit>().fetchCards(_page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: "Search Pokémon...",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black87),
          ),
          style: const TextStyle(color: Colors.black),
          onChanged: (query) {
            if (query.isNotEmpty) {
              context.read<PokemonCubit>().fetchCards(_page, query:query);
            } else {
              context.read<PokemonCubit>().fetchCards(_page);
            }
          },
        )
            : const Text("Pokémon List"),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  _page = 1;
                  context.read<PokemonCubit>().fetchCards(_page);
                }
              });
            },
          ),
        ],
        // backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          if (state.isError) return const Center(child: Text('Error loading data'));
          if (state.cards.isEmpty && state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return PokemonCardGrid(
            cards: state.cards,
            scrollController: _scrollController,
          );
        },
      ),
    );
  }
}
