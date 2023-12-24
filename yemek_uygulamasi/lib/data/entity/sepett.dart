class Sepett{
  String sepet_id;
  String sepet_ad;
  String sepet_resim;
  int sepet_fiyat;
  int sepet_adet;
  String kullanici_adi;

  Sepett(
      {required this.sepet_id, required this.sepet_ad, required this.sepet_resim, required this.sepet_fiyat, required this.sepet_adet, required this.kullanici_adi});

  factory Sepett.fromJson(Map<dynamic,dynamic> json,String key){
    return Sepett(sepet_id: key, sepet_ad: json["ad"] as String, sepet_resim: json["resim"] as String,
       sepet_fiyat: json["fiyat"] as int, sepet_adet: json["adet"] as int, kullanici_adi: json["kullanici_adi"] as String);
  }
}
