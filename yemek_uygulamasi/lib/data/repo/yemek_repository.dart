import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

class YemekRepository{
  var collectionYemekler = FirebaseFirestore.instance.collection("Sepet");
  var collectionFavoriler = FirebaseFirestore.instance.collection("Favoriler");
  Future<void> sepeteEkle(String ad,String resim,int fiyat,int adet,String kullanici_adi) async{
    var yeniYemek = HashMap<String,dynamic>();
    yeniYemek["id"] = "";
    yeniYemek["ad"] = ad;
    yeniYemek["resim"] = resim;
    yeniYemek["fiyat"] = fiyat;
    yeniYemek["adet"] = adet;
    yeniYemek["kullanici_adi"] = kullanici_adi;
    collectionYemekler.add(yeniYemek);
  }
  Future<void> favoriEkle(String ad,String resim,int fiyat,String kullanici_adi) async{
    var yeniFavori = HashMap<String,dynamic>();
    yeniFavori["id"] = "";
    yeniFavori["ad"] = ad;
    yeniFavori["resim"] = resim;
    yeniFavori["fiyat"] = fiyat;
    yeniFavori["kullanici_adi"] = kullanici_adi;
    collectionFavoriler.add(yeniFavori);
  }

  Future<void> sil(String kullanici_adi) async{
    collectionYemekler.doc(kullanici_adi).delete();
  }

  Future<void> favoriSil(String favori_id) async{
    collectionFavoriler.doc(favori_id).delete();
  }
}