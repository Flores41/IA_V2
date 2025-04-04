import 'package:flutter/material.dart';

import 'package:scraping_ia/src/core/utils/utils.dart';
import 'package:scraping_ia/src/data/local/ropa.dart';

class ProductCard extends StatelessWidget {
  final Ropa product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                product.image,
                height: Responsive.isMobile(context)
                    ? 30
                    : Responsive.isTablet(context)
                        ? 180
                        : 200,
                width: Responsive.isMobile(context)
                    ? 30
                    : Responsive.isTablet(context)
                        ? 150
                        : 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6),
            // Nombre
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                product.name ?? 'Nombre del producto',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: Responsive.isMobile(context)
                      ? 30
                      : Responsive.isTablet(context)
                          ? 9
                          : 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: Responsive.isMobile(context)
                      ? 30
                      : Responsive.isTablet(context)
                          ? 0
                          : 1.1,
                  letterSpacing: Responsive.isMobile(context)
                      ? 30
                      : Responsive.isTablet(context)
                          ? 0
                          : 1,
                  wordSpacing: Responsive.isMobile(context)
                      ? 30
                      : Responsive.isTablet(context)
                          ? 0
                          : 1,
                ),
              ),
            ),
            const SizedBox(height: 2),
            // Rating simulado
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.white),
                    const SizedBox(width: 5),
                    Text(
                      "4.5/5",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Responsive.isMobile(context)
                              ? 30
                              : Responsive.isTablet(context)
                                  ? 10
                                  : 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = context.w;
    final h = context.h;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'NEW ARRIVALS',
          style: TextStyle(
            fontSize: Responsive.isMobile(context)
                ? 30
                : Responsive.isTablet(context)
                    ? 30
                    : 40,
            fontWeight: FontWeight.bold,
            height: 1.1,
            letterSpacing: 4,
            wordSpacing: 4,
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          height: Responsive.isMobile(context)
              ? 30
              : Responsive.isTablet(context)
                  ? 260
                  : 285,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...ropa.map((product) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: ProductCard(product: product),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'TOP SELLING',
          style: TextStyle(
            fontSize: Responsive.isMobile(context)
                ? 30
                : Responsive.isTablet(context)
                    ? 20
                    : 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          height: Responsive.isMobile(context)
              ? 30
              : Responsive.isTablet(context)
                  ? 260
                  : 285,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...ropa.map((product) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: ProductCard(product: product),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
