import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_uygulamasi/data/entity/favoriler.dart';
import 'package:yemek_uygulamasi/ui/cubit/favori_cubit.dart';

class Favori extends StatefulWidget {
  const Favori({super.key});

  @override
  State<Favori> createState() => _FavoriState();
}

class _FavoriState extends State<Favori> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavoriCubit>().favoriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorilerim",style: TextStyle(color: Colors.white,fontSize: 30),),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: BlocBuilder<FavoriCubit,List<Favoriler>>(
          builder: (context,favoriListesi){
            if(favoriListesi.isNotEmpty){
              return ListView.builder(
                itemCount: favoriListesi.length,//3
                itemBuilder: (context,indeks){//0,1,2
                  var favoriUrun = favoriListesi[indeks];
                  return Card(color: Colors.white,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: SizedBox(width:90,height:90,child: Image.network("https://yemekapp5678.000webhostapp.com/yemekler/${favoriUrun.favori_resim}")),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(favoriUrun.favori_ad,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 25)),
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${favoriUrun.favori_fiyat}₺",style:const TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 25) ,),
                            IconButton(onPressed: (){
                              context.read<FavoriCubit>().favoriSil(favoriUrun.favori_id);
                            }, icon: const Icon(Icons.delete,size: 33,)),

                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }else{
              return const Center(
                child: Text("Favorileriniz Boş, Hemen Bir Şeyler Ekle :)",style: TextStyle(fontSize: 18),),
              );
            }

            }

      ),
    );
  }
}

