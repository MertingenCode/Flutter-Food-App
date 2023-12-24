import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_uygulamasi/data/entity/favoriler.dart';
import 'package:yemek_uygulamasi/data/repo/yemek_repository.dart';
class FavoriCubit extends Cubit<List<Favoriler>>{
  FavoriCubit():super(<Favoriler>[]);

  var yRepo = YemekRepository();

  var collectionFavori = FirebaseFirestore.instance.collection("Favoriler");

  Future<void> favoriYukle() async{
    var favoriListesi = <Favoriler>[];

    collectionFavori.snapshots().listen((event) {
      var documents = event.docs;
      for(var document in documents){
        var key = document.id;
        var data = document.data();
        var favori = Favoriler.fromJson(data, key);
        favoriListesi.add(favori);
      }

      emit(favoriListesi);
    });
  }

  Future<void> favoriSil(String kullanici_adi) async{
    await yRepo.favoriSil(kullanici_adi);
    await favoriYukle();
  }
}