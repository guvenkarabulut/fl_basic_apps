import 'package:flutter/material.dart';

import 'package:fl_pokedex/model/pokedex_model.dart';
import 'package:fl_pokedex/services/pokedex_api.dart';
import 'package:fl_pokedex/pokedex_page/grid_pokemon.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;
  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return MyPokeCard(
                color: _getMyColor(snapshot.data![index].type![0].toString()),
                pokemonName: snapshot.data![index].name.toString(),
                pokemonType: snapshot.data![index].type![0].toString(),
                pokemonImage:
                    Image.network(snapshot.data![index].img.toString()),
                pokemonModel: snapshot.data![index],
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('hata'),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  _getMyColor(String type) {
    switch (type) {
      case 'Grass':
        return Colors.green;
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Bug':
        return Colors.lightGreen;
      case 'Normal':
        return Colors.grey;
      case 'Poison':
        return Colors.purple;
      case 'Electric':
        return Colors.yellow;
      case 'Ground':
        return Colors.brown;
      case 'Fairy':
        return Colors.pink;
      case 'Fighting':
        return Colors.orange;
      case 'Psychic':
        return Colors.purpleAccent;
      case 'Rock':
        return Colors.brown.shade300;
      case 'Ghost':
        return Colors.indigo;
      case 'Ice':
        return Colors.lightBlueAccent;
      case 'Dragon':
        return Colors.deepPurple;
      case 'Dark':
        return Colors.black;
      case 'Steel':
        return Colors.blueGrey;
      default:
        return Colors.grey;
    }
  }
}
