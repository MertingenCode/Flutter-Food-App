import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_uygulamasi/data/repo/yemek_repository.dart';

class DetaySayfaCubit extends Cubit<void>{
  DetaySayfaCubit():super(0);

  var yRepo = YemekRepository();

  Future<void> sepeteEkle(String ad,String resim,int fiyat,int adet,String kullanici_adi) async{
    await yRepo.sepeteEkle(ad, resim, fiyat, adet, kullanici_adi);
  }
  Future<void> favoriEkle(String ad,String resim,int fiyat,String kullanici_adi) async{
    await yRepo.favoriEkle(ad, resim, fiyat, kullanici_adi);
  }
}