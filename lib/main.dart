import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pokemon_cubit.dart';
import 'core/routes/app_routes.dart';
import 'data/repositories/pokemon_repository.dart';
import 'presentation/screens/pokemon_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio();
  final pokemonRepository = PokemonRepository(dio);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PokemonCubit(pokemonRepository)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.launch,
      onGenerateRoute: AppRoutes.generateRoute,
      onUnknownRoute: AppRoutes.onUnknownRoute,
      theme: ThemeData.light(),
      // home: const HomeScreen(),
    );
  }
}
