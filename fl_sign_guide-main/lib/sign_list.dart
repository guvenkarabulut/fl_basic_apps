import 'package:flutter/material.dart';
import './data/strings.dart';
import './model/burc.dart';
import './sign_detail.dart';

class SignList extends StatelessWidget {
  late List<Burc> allSigns;
  SignList() {
    allSigns = makeSignList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading:
                      Image.asset("images/" + allSigns[index].burcKucukResim),
                  title: Text(allSigns[index].burcAdi),
                  subtitle: Text(allSigns[index].burcTarihi),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignDetail(allSigns[index]),
                      ),
                    );
                  },
                ),
              );
            },
            itemCount: allSigns.length),
      ),
    );
  }

  List<Burc> makeSignList() {
    List<Burc> dummy = [];
    for (int i = 0; i < 12; i++) {
      Burc sign = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png",
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png");
      dummy.add(sign);
    }
    return dummy;
  }
}
