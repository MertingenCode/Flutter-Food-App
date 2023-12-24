import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icon.dart';
import 'package:yemek_uygulamasi/data/entity/yemekler.dart';
import 'package:yemek_uygulamasi/ui/cubit/detay_sayfa_cubit.dart';
import 'package:yemek_uygulamasi/ui/cubit/favori_cubit.dart';

class DetaySayfa extends StatefulWidget {
  Yemekler yemek;


  DetaySayfa({required this.yemek});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  int adet =1;
  bool favori = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ürün Detayı",style: TextStyle(color: Colors.white,fontSize: 30),)
        ,backgroundColor: Colors.redAccent,centerTitle: true,
      actions: [
        IconButton(onPressed: (){
          setState(() {
            context.read<DetaySayfaCubit>().favoriEkle(widget.yemek.ad, widget.yemek.resim, widget.yemek.fiyat, "oya");
            favori = true;
          });
        }, icon:favori? const Icon(Icons.favorite,color: Colors.red,):const Icon(Icons.favorite,color: Colors.white,)),

      ],),
      body:Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.yemek.ad,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 35)),
            SizedBox(width:220,height:220,child: Image.network("https://yemekapp5678.000webhostapp.com/yemekler/${widget.yemek.resim}")),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),onPressed: (){
                  setState(() {
                    adet--;
                    if(adet<1){
                      adet =1;
                    }
                  });
                }, child: const Icon(Icons.remove,color: Colors.white,)),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Text("$adet",style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 35) ,),
                ),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),onPressed: (){
                  setState(() {
                    adet++;
                  });
                }, child: const Icon(Icons.add,color: Colors.white,)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 150,top: 30),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),onPressed: (){},
                      child: const Text("Ücretsiz Teslimat",style: TextStyle(color: Colors.white,),)),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),onPressed: (){},
                      child: const Text("25-30 dk Teslimat",style: TextStyle(color: Colors.white,),)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text("${widget.yemek.fiyat*adet}₺",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 35)),
                  ),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),onPressed: (){
                    context.read<DetaySayfaCubit>().sepeteEkle(widget.yemek.ad, widget.yemek.resim, widget.yemek.fiyat*adet, adet, "oya");
                  },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: const Text("Sepete Ekle",style: TextStyle(color: Colors.white,fontSize: 25),),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
