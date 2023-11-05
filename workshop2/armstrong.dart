import "dart:math";
//Verilen sayının Armstrong Sayı olup olmadığını bulan fonksiyonu yazınız ve test ediniz.

//Armstrong Sayı Nedir ?
//N haneli bir sayının basamaklarının n’inci üstlerinin toplamı, sayının kendisine eşitse, böyle sayılara Armstrong sayı denir.

//Örneğin 407 = (4^3)+ (0^3)+(7^3) = 64+0+343 = 407  bir armstrong sayıdır.

void main() {
  armstrong(121); //10
  armstrong(15); //26
  armstrong(407); //407
}

void armstrong(int sayi) {
  int basamakSayisi = 0;
  int toplam = 0;
  basamakSayisi = sayi.toString().length;

  for (var i = 0; i < basamakSayisi; i++) {
    toplam = toplam +
        pow(int.parse(sayi.toString().split("")[i]), basamakSayisi).toInt();
  }
  print(toplam);

  if (sayi == toplam) {
    print("armstrong sayidir");
  } else {
    print("armstrong sayi degildir");
  }
}
