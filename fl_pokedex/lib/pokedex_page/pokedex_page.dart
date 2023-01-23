import 'package:fl_pokedex/constants/constants.dart';
import 'package:flutter/material.dart';

import 'pokemon_list.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          myAppBar(),
          const SliverToBoxAdapter(
            child: PokemonList(),
          ),
        ],
      ),
    );
  }

  SliverAppBar myAppBar() {
    return SliverAppBar(
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: const Text(Constants.title),
        background: Image.network(
          Constants.appBarImageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
