import 'package:flutter/material.dart';

class myPokeCard extends StatelessWidget {
  const myPokeCard({
    Key? key,
    required Color color,
    required String pokemonName,
    required String pokemonType,
    required Image pokemonImage,
  })  : _color = color,
        _pokemonName = pokemonName,
        _pokemonType = pokemonType,
        _pokemonImage = pokemonImage,
        super(key: key);

  final Color _color;
  final String _pokemonName;
  final String _pokemonType;
  final Image _pokemonImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
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
                        color: Colors.white,
                      ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(_pokemonType,
                      style: Theme.of(context).textTheme.headline6),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 15,
            child: SizedBox(
              width: 75,
              height: 75,
              child: Image.network(
                  'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fvgboxart.com%2Fresources%2Frender%2F13696_pokeball-prev.png&f=1&nofb=1&ipt=bebb6488a478cee8eb13dc7afdb746db98003f1ec34c4b0ae011d25b63fe3061&ipo=images'),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(width: 100, height: 100, child: _pokemonImage),
          ),
        ],
      ),
    );
  }
}
