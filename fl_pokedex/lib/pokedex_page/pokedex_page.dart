import 'package:flutter/material.dart';

import 'package:fl_pokedex/pokedex_page/grid_pokemon.dart';
import 'package:fl_pokedex/services/pokedex_api.dart';
import 'package:fl_pokedex/model/pokedex_model.dart';

class PokedexPage extends StatefulWidget {
  PokedexPage({super.key});
  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  late Future<List<PokemonModel>> _pokemonListFuture;
  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PokemonModel>>(
        future: _pokemonListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return myPokeCard(
                    color:
                        _getMyColor(snapshot.data![index].type![0].toString()),
                    pokemonName: snapshot.data![index].name.toString(),
                    pokemonType: snapshot.data![index].type![0].toString(),
                    pokemonImage:
                        Image.network(snapshot.data![index].img.toString()),
                  );
                });
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('hata'),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
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

/*   CustomScrollView CustomScroolView() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Pokedex'),
          floating: true,
          snap: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              'https://raw.githubusercontent.com/PokeAPI/media/master/logo/pokeapi_256.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return myPokeCard(
                color: _color,
                pokemonName: _pokemonName,
                pokemonType: _pokemonType,
                pokemonImage: _pokemonImage,
              );
            },
            childCount: 20,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ],
    );
  } */
}
