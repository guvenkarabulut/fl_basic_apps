import 'package:flutter/material.dart';
import 'package:fl_pokedex/model/pokedex_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required pokemonModel})
      : _pokemonModel = pokemonModel;

  final PokemonModel? _pokemonModel;

  final String _string = 'a';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300.h,
          child: Card(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(_pokemonModel!.img.toString()),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyString(
                          string: 'Name:${_pokemonModel!.name.toString()}',
                        ),
                        MyString(
                          string: 'Type:${_pokemonModel!.type.toString()}',
                        ),
                        MyString(
                          string: 'Height:${_pokemonModel!.height.toString()}',
                        ),
                        MyString(
                          string: 'Weight:${_pokemonModel!.weight.toString()}',
                        ),
                        MyString(
                          string:
                              'Weaknesses:${_pokemonModel!.weaknesses.toString()}',
                        ),
                        MyString(
                          string:
                              'Next Evolution:${_pokemonModel!.nextEvolution.toString()}',
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyString extends StatelessWidget {
  const MyString({
    Key? key,
    required String string,
  })  : _string = string,
        super(key: key);

  final String _string;

  @override
  Widget build(BuildContext context) {
    return Text(_string,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold));
  }
}
