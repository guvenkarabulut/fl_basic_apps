import 'package:flutter/material.dart';
import './model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class SignDetail extends StatefulWidget {
  SignDetail(
    this.sign,
  );
  final Burc sign;

  @override
  State<SignDetail> createState() => _SignDetailState();
}

class _SignDetailState extends State<SignDetail> {
  Color dominantColor = Colors.pink;

  late PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    findDominantColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: CustomScrollView(
          // Slivers are the scrollable regions of the screen
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: dominantColor,
              expandedHeight: 250,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.sign.burcAdi),
                background: Image.asset(
                  "images/" + widget.sign.burcBuyukResim,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Text(
                    widget.sign.burcDetayi,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void findDominantColor() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage("images/" + widget.sign.burcBuyukResim),
    );
    setState(() {
      dominantColor = paletteGenerator.dominantColor!.color;
    });
  }
}
