import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'درباره ما',
          style: TextStyle(
            fontFamily: 'iranSans',
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'ما در این اپلیکیشن به نام "فال حافظ" توانسته‌ایم یک تجربه جذاب و منحصربه‌فرد را برای کاربران خود فراهم کنیم. با این اپلیکیشن، کاربران می‌توانند به سادگی و به صورت خودکار از تعبیر فال‌های مختلفی از جمله فال تاروت، جادویی، روزانه و... بهره‌مند شوند.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontFamily: 'vazir',
                ),
              ),
            ),
            const SizedBox(height: 5),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'تمامی فال‌های ارائه شده در این اپلیکیشن، با دقت و دانش تخصصی از جانب کارشناسان و استادان متخصص ارائه می‌شوند تا به کاربران کمک کنند تا بهترین تفسیر را برای سوالات و نیازهایشان داشته باشند.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontFamily: 'vazir',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Divider(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'ویژگی‌های اصلی این اپلیکیشن شامل :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18,
                  fontFamily: 'iranSans',
                ),
              ),
            ),
            const SizedBox(height: 15),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                '1)  تنوع در فال‌ها: ارائه انواع مختلف فال‌ها از جمله تاروت، جادویی، روزانه، عشق و روابط، شانس و... برای پاسخ به نیازهای مختلف کاربران.\n\n2) خودکارسازی: این اپلیکیشن با بهره‌گیری از الگوریتم‌های پیشرفته، به صورت خودکار فال‌ها را برای کاربران ارائه می‌دهد، بدون نیاز به تداخل انسانی. \n\n3) دقت و تخصص: تفسیرات ارائه شده توسط این اپلیکیشن، بر اساس دانش و تخصص کارشناسان متخصص صورت می‌گیرد تا بهترین تجربه ممکن برای کاربران فراهم شود. \n\n4) رابط کاربری کارآمد: رابط کاربری ساده و دوستانه که امکان دسترسی آسان و سریع به فال‌ها را برای همه ارائه می‌دهد.',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.secondary,
                  fontFamily: 'lalezar',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
