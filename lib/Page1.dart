import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigationbar/Kullanicilar.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Future<List<Kullanicilar>> kullanicilariGetir() async {
    var kullaniciListesi = <Kullanicilar>[];

    var k1 = Kullanicilar(1, "Alican", "user.png");

    kullaniciListesi.add(k1);

    return kullaniciListesi;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Kullanicilar>>(
      future: kullanicilariGetir(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var uyeList = snapshot.data;

          return ListView.builder(
            itemCount: uyeList!.length,
            itemBuilder: (context, index) {
              var uye = uyeList[index];
              //print("Veri Yüklendi");
              return GestureDetector(
                onTap: () {},
                child: Card(
                  child: Row(
                    children: [
                      SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset("mages/${uye.kullanici_resim}")),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " Ad : ${uye.kullanici_ad}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ), //Style
                          //Style
                          //character restriction
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            print("İcona tıklandı");
                          },
                          child: Icon(Icons.keyboard_arrow_right)),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center();
          print("veri yüklenmedi");
        }
      },
    );
  }
}
