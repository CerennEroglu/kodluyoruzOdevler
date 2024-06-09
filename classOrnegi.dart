
class Sekiller{
  double alan;
  String renk;
  int kenarSayisi;

  Sekiller(this.alan, this.renk, this.kenarSayisi);

  void alaniBastir(){
    return print(this.alan);
  }
}

void main(){
 // 2.soru
  double uzunKenar=9.54;
  double kisaKenar=4.76;
  double hesaplama= uzunKenar*kisaKenar;
  print(hesaplama);

  // 3.soru
  int sonuc= carp(5,3);
  print(sonuc);

  // 4.soru
  var arabaMarkasi=['BMW','Mercedes','Audi','Fiat','Ford'];
  print(arabaMarkasi);
  arabaMarkasi.add('Hyundai');
  print(arabaMarkasi);
  arabaMarkasi.removeAt(arabaMarkasi.indexOf('Hyundai'));
  print(arabaMarkasi);

  // 5.soru
  var dikdortgen = Sekiller(120,'Mavi', 4 );
  var kare = Sekiller(100, 'Kırmızı', 4);
  var daire = Sekiller((5*5*3.14),'Sarı', 0);

  daire.alaniBastir();

}

  int carp(int a,int b){
  int multiplyByTwo(int x){
    x*=2;
    return x;
  }
  int result= a;
  for (int i=0; i<b-1; i++){
    result = multiplyByTwo(result);
  }
  return result;
}