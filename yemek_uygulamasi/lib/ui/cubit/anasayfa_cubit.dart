import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_uygulamasi/data/entity/yemekler.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>>{
  AnasayfaCubit():super(<Yemekler>[]);

  var collectionYemekler = FirebaseFirestore.instance.collection("Yemekler");

  Future<void> yemekleriYukle() async{
    var yemeklerListesi = <Yemekler>[];

    collectionYemekler.snapshots().listen((event) {
      var documents = event.docs;
      for(var document in documents){
        var key = document.id;
        var data = document.data();
        var yemek = Yemekler.fromJson(data, key);
        yemeklerListesi.add(yemek);
      }

      emit(yemeklerListesi);
    });
  }

  Future<void> ara(String aramaKelimesi) async{
    var yemeklerListesi = <Yemekler>[];

    collectionYemekler.snapshots().listen((event) {
      var documents = event.docs;
      for(var document in documents){
        var key = document.id;
        var data = document.data();
        var yemek = Yemekler.fromJson(data, key);
        if(yemek.ad.toLowerCase().contains(aramaKelimesi.toLowerCase())){
        yemeklerListesi.add(yemek);
      }

      emit(yemeklerListesi);
    }});
  }

}