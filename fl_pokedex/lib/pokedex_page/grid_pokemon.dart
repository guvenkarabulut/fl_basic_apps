import 'package:fl_pokedex/constants/constants.dart';
import 'package:fl_pokedex/model/pokedex_model.dart';
import 'package:fl_pokedex/pokedex_page/pokemon_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPokeCard extends StatelessWidget {
  const MyPokeCard(
      {Key? key,
      required Color color,
      required String pokemonName,
      required String pokemonType,
      required Image pokemonImage,
      required PokemonModel pokemonModel})
      : _color = color,
        _pokemonName = pokemonName,
        _pokemonType = pokemonType,
        _pokemonImage = pokemonImage,
        _pokemonModel = pokemonModel,
        super(key: key);

  final Color _color;
  final String _pokemonName;
  final String _pokemonType;
  final Image _pokemonImage;
  final PokemonModel _pokemonModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PokemonDetailPage(pokemonModel: _pokemonModel))),
      child: Card(
        elevation: Constants.elevation,
        child: Container(
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 5,
                child: Column(
                  children: [
                    Text(
                      _pokemonName,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Constants.pokemonTitleColor,
                          ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Constants.pokemonTypeBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(_pokemonType,
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                right: 15,
                child: SizedBox(
                  width: 75.w,
                  height: 75.h,
                  child: Image.network(Constants.pokeBallImageUrl),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child:
                    SizedBox(width: 100.w, height: 100.h, child: _pokemonImage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
