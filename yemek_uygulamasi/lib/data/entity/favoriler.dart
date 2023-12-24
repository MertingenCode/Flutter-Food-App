class Favoriler{
  String favori_id;
  String favori_ad;
  String favori_resim;
  int favori_fiyat;
  String kullanici_adi;

  Favoriler(
      {required this.favori_id, required this.favori_ad, required this.favori_resim, required this.favori_fiyat, required this.kullanici_adi});

  factory Favoriler.fromJson(Map<dynamic,dynamic> json,String key){
    return Favoriler(favori_id: key, favori_ad: json["ad"] as String, favori_resim: json["resim"] as String,
        favori_fiyat: json["fiyat"] as int, kullanici_adi: json["kullanici_adi"] as String);
  }
}
