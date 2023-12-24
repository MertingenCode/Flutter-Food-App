class Yemekler{
  String id;
  String ad;
  String resim;
  int fiyat;

  Yemekler({required this.id,required this.ad,required this.resim,required this.fiyat});

  factory Yemekler.fromJson(Map<dynamic,dynamic> json, String key){
    return Yemekler(id: key,
        ad: json["ad"] as String,
        resim: json["resim"] as String,
        fiyat: json["fiyat"] as int,
    );
  }
}