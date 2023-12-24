import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_uygulamasi/data/entity/sepett.dart';
import 'package:yemek_uygulamasi/data/repo/yemek_repository.dart';
class SepetCubit extends Cubit<List<Sepett>>{
  SepetCubit():super(<Sepett>[]);

  var yRepo = YemekRepository();

  var collectionSepet = FirebaseFirestore.instance.collection("Sepet");

  Future<void> sepetYukle() async{
    var sepetListesi = <Sepett>[];

    collectionSepet.snapshots().listen((event) {
      var documents = event.docs;
      for(var document in documents){
        var key = document.id;
        var data = document.data();
        var sepet = Sepett.fromJson(data, key);
        sepetListesi.add(sepet);
      }

      emit(sepetListesi);
    });
  }

  Future<void> sil(String sepet_id) async{
    await yRepo.sil(sepet_id);
    await sepetYukle();
  }
}
