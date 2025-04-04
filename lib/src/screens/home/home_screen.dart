import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scraping_ia/src/core/utils/utils.dart';

import 'package:scraping_ia/src/widgets/hero_banner.dart';
import 'package:scraping_ia/src/widgets/section_products.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ScrapingProvider>(context, listen: false).fecthScrapingData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = context.w;
    final h = context.h;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigationHeader(),
            const HeroBanner(),
            Container(
              width: double.infinity,
              height: h * 0.1,
              decoration: BoxDecoration(
                color: Colors.black,
                // color: Colors.amber,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(title: 'Polos'),
                  CustomText(title: 'Bermudas'),
                  CustomText(title: 'Vestidos'),
                  CustomText(title: 'Pantalones'),
                  CustomText(title: 'Accesorios'),
                  CustomText(title: 'Poleras'),
                ],
              ),
            ),
            const SizedBox(height: 70),
            HomePage(),
            const SizedBox(height: 70),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                width: w * 0.5,
                height: h * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFf0f0f0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Explora tu estilo'.toUpperCase(),
                      style: TextStyle(
                        fontSize: Responsive.isMobile(context)
                            ? 30
                            : Responsive.isTablet(context)
                                ? 30
                                : 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.1,
                        letterSpacing: Responsive.isMobile(context)
                            ? 30
                            : Responsive.isTablet(context)
                                ? 3
                                : 8,
                        wordSpacing: 10,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: NewWidget(
                            h: h,
                            image: 'assets/1.jpg',
                            title: 'Casual',
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 3,
                          child: NewWidget(
                            h: h,
                            image: 'assets/2.jpg',
                            title: 'Formal',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: NewWidget(
                            h: h,
                            image: 'assets/3.jpg',
                            title: 'Party',
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: NewWidget(
                            h: h,
                            image: 'assets/4.jpg',
                            title: 'Gym',
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            const SizedBox(height: 20),
          ],
        ) // Ocupa toda la pantalla
            ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontSize: Responsive.isMobile(context)
            ? 30
            : Responsive.isTablet(context)
                ? 18
                : 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        height: 1.1,
        letterSpacing: 7,
        wordSpacing: 10,
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.h,
    required this.image,
    required this.title,
  });

  final double h;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isMobile(context)
          ? 30
          : Responsive.isTablet(context)
              ? h * 0.20
              : h * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: Responsive.isMobile(context)
                ? 30
                : Responsive.isTablet(context)
                    ? 20
                    : 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.1,
            letterSpacing: Responsive.isMobile(context)
                ? 30
                : Responsive.isTablet(context)
                    ? 4
                    : 7,
            wordSpacing: 10,
          ),
        ),
      ),
    );
  }
}
