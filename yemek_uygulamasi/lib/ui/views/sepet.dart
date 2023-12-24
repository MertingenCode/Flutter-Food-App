import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_uygulamasi/ui/cubit/sepet_cubit.dart';

import '../../data/entity/sepett.dart';

class Sepet extends StatefulWidget {
  const Sepet({super.key});

  @override
  State<Sepet> createState() => _SepetState();
}

class _SepetState extends State<Sepet> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<SepetCubit>().sepetYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepet",style: TextStyle(color: Colors.white,fontSize: 30),),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: BlocBuilder<SepetCubit,List<Sepett>>(
          builder: (context,sepetListesi){
            if(sepetListesi.isNotEmpty){
              int toplamFiyat = 0;
              for (var sepetUrun in sepetListesi) {
                toplamFiyat += sepetUrun.sepet_fiyat;
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: sepetListesi.length,//3
                      itemBuilder: (context,indeks){//0,1,2
                        var sepetUrun = sepetListesi[indeks];
                        return Card(color: Colors.white,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: SizedBox(width:90,height:90,child: Image.network("https://yemekapp5678.000webhostapp.com/yemekler/${sepetUrun.sepet_resim}")),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(sepetUrun.sepet_ad,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 25)),
                                  Text("${sepetUrun.sepet_adet} Adet",style: const TextStyle(fontSize: 20),),
                                ],
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(onPressed: (){
                                    context.read<SepetCubit>().sil(sepetUrun.sepet_id);
                                  }, icon: const Icon(Icons.delete,size: 33,)),
                                  Text("${sepetUrun.sepet_fiyat}₺",style:const TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 25) ,),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:15),
                          child: const Text("Toplam:",style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text("$toplamFiyat₺",style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: SizedBox(width: 300,height: 65,
                      child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),onPressed: (){},
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: const Text("Sipariş Ver",style: TextStyle(color: Colors.white,fontSize: 25),),
                          )),
                    ),
                  ),
                ],
              );
            }else{
              return const Center(
                child: Text("Sepetiniz Boş",style: TextStyle(fontSize: 30),),
              );
            }
          }
      ),
    );
  }
}
