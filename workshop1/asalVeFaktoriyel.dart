void main() {
//1'den N'e kadar olan asal sayıları hesaplayan fonksiyon yazınız, fonksiyon parametre olarak aldığı sayıya kadar (N) hesaplama yapacaktır.
  asalSayilar(10);
//Aldığı sayının faktöriyelini hesaplayarak sayıyı geriye dönen fonksiyonu oluşturunuz.
  faktoriyel(4);
}

void asalSayilar(int deger) {
  var asalMi;
  for (var i = 2; i <= deger; i++) {
    asalMi = true;
    for (var j = 2; j < i; j++) {
      if (i % j == 0) //eger i sayısı j sayisina tam bolunuyorsa o asal degildir
      {
        asalMi =
            false; // degiskeni false yapip aşagida true olanlari yazdiririz
      }
    }
    if (asalMi == true) {
      print(i); //asalları ekrana basıyoruz
    }
  }
}

void faktoriyel(int deger) {
  int faktoriyel = 1;
  if (deger == 0 || deger == 1) {
    //eger sayi 0 veya 1 ise
    print("1");
  } else {
    //girilen sayi 0 ve 1 in disinda bir sayi ise
    for (var i = deger; i >= 1; i--) {
      //o degerden baslayip 1 azaltip carparak faktoriyel degiskenine esitle
      faktoriyel = faktoriyel * i;
    }
    print(faktoriyel);
  }
}
