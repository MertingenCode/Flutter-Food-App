import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yemek_uygulamasi/data/entity/yemekler.dart';
import 'package:yemek_uygulamasi/ui/cubit/anasayfa_cubit.dart';
import 'package:yemek_uygulamasi/ui/views/detay_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().yemekleriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Anasayfa",style: TextStyle(color: Colors.white,fontSize: 30),),
        backgroundColor: Colors.redAccent,centerTitle: true,),
      body: Column(
        children: [
          Gap(15),
          Container(
            width: 330,height: 50,
            decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                  color: Colors.grey
                )
              ],
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
            child: TextField(decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
                hintText: "Yemekleri Ara...",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // Arama çizgisini kaldırır
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white),
              onChanged: (aramaSonucu){
              context.read<AnasayfaCubit>().ara(aramaSonucu);
              },
          )),
          Gap(15),
          Expanded(
            child: BlocBuilder<AnasayfaCubit,List<Yemekler>>(
              builder: (context,yemeklerListesi){
                if(yemeklerListesi.isNotEmpty){
                  return Center(
                    child: Container(width: 340,
                      child: GridView.builder(
                        itemCount: yemeklerListesi.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.65/2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemBuilder: (context,indeks){
                          var yemek = yemeklerListesi[indeks];
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(yemek: yemek)));
                            },
                            child: Container(
                              width: 130,
                              height: 195,
                              padding: const EdgeInsets.all(8),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x0A000000),
                                    blurRadius: 60,
                                    offset: Offset(6, 6),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child:Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 137,
                                    height: 106,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(image: NetworkImage("https://yemekapp5678.000webhostapp.com/yemekler/${yemek.resim}"),
                                          fit: BoxFit.fitHeight),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ),
                                  Gap(20),
                                  Text(yemek.ad,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0.09,)),
                                  Gap(12),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:5,right: 3),
                                        child: Icon(Icons.star,color: Colors.red,size: 16,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 37),
                                        child: Text("4.9",style: TextStyle(
                                          color: Color(0xFF0F0F0F),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          height: 0.11,)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 3),
                                        child: Icon(Icons.location_pin,color: Colors.red,size: 16,),
                                      ),
                                      Text("190m",style: TextStyle(
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0.11,)),
                                    ],
                                  ),
                                  Gap(15),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 60),
                                    child: Text(
                                      "${yemek.fiyat},00TL",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 19,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0.09,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }else{
                  return const Center(
                    child: Text("Yemek Listesi Yüklenemedi :("),
                  );
                }
              }
                ),
          ),
        ],
      ),
    );
  }
}
