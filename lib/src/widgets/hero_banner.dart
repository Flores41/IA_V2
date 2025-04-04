import 'package:flutter/material.dart';
import 'package:scraping_ia/src/core/utils/colors.dart';
import 'package:scraping_ia/src/core/utils/responsive.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final w = context.w;
    final h = context.h;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: Responsive.isMobile(context)
              ? 30
              : Responsive.isTablet(context)
                  ? MediaQuery.of(context).size.height * 0.7
                  : MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Color(0XFFf2f1f0),
            // color: Colors.amber,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: Responsive.isMobile(context)
                    ? 30
                    : Responsive.isTablet(context)
                        ? MediaQuery.of(context).size.height * 0.99
                        : MediaQuery.of(context).size.height * 0.8,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Responsive.isMobile(context)
                        ? 12
                        : Responsive.isTablet(context)
                            ? w * 0.09
                            : w * 0.12,
                    top: Responsive.isMobile(context)
                        ? 12
                        : Responsive.isTablet(context)
                            ? h * 0.03
                            : h * 0.1,
                    bottom: Responsive.isMobile(context)
                        ? 12
                        : Responsive.isTablet(context)
                            ? h * 0.03
                            : h * 0.1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ENCUENTRA ROPA \nQUE COMBINE \nCON TU ESTILO',
                        style: TextStyle(
                          fontSize: Responsive.isMobile(context)
                              ? 30
                              : Responsive.isTablet(context)
                                  ? 50
                                  : 70,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                          letterSpacing: Responsive.isMobile(context)
                              ? 2
                              : Responsive.isTablet(context)
                                  ? 5
                                  : 10,
                          wordSpacing: 10,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Explora nuestra amplia colección de prendas cuidadosamente seleccionadas mediante técnicas de extracción automatizada, diseñadas para destacar tu estilo único y adaptarse a tus preferencias gracias a un sistema de recomendación inteligente.',
                        style: TextStyle(
                          fontSize: Responsive.isMobile(context)
                              ? 12
                              : Responsive.isTablet(context)
                                  ? 11
                                  : 16,
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.7),
                          // fontWeight: FontWeight.w400,
                          letterSpacing: Responsive.isMobile(context)
                              ? 12
                              : Responsive.isTablet(context)
                                  ? 2
                                  : 2,
                          wordSpacing: 7,
                          height: 2,
                          shadows: [
                            Shadow(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: Responsive.isMobile(context)
                                ? 12
                                : Responsive.isTablet(context)
                                    ? 12
                                    : 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Responsive.isMobile(context)
                                ? 12
                                : Responsive.isTablet(context)
                                    ? 15
                                    : 20,
                            vertical: Responsive.isMobile(context)
                                ? 12
                                : Responsive.isTablet(context)
                                    ? 5
                                    : 5,
                          ),
                          child: Text(
                            'Explorar ahora'.toUpperCase(),
                            style: TextStyle(
                              fontSize: Responsive.isMobile(context)
                                  ? 12
                                  : Responsive.isTablet(context)
                                      ? 15
                                      : 20,
                              letterSpacing: 2,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: Responsive.isMobile(context)
                              ? 12
                              : Responsive.isTablet(context)
                                  ? 15
                                  : 30),
                      Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            label: Text(
                              'Recomendaciones personalizadas'.toUpperCase(),
                              style: TextStyle(
                                fontSize: Responsive.isMobile(context)
                                    ? 12
                                    : Responsive.isTablet(context)
                                        ? 9
                                        : 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: Responsive.isMobile(context)
                                  ? 12
                                  : Responsive.isTablet(context)
                                      ? 5
                                      : 10),
                          // ignore: deprecated_member_use
                          Text('|',
                              style: TextStyle(
                                  fontSize: Responsive.isMobile(context)
                                      ? 12
                                      : Responsive.isTablet(context)
                                          ? 15
                                          : 30,
                                  color: Colors.black.withOpacity(0.3))),
                          SizedBox(
                              width: Responsive.isMobile(context)
                                  ? 12
                                  : Responsive.isTablet(context)
                                      ? 6
                                      : 10),
                          TextButton.icon(
                            onPressed: () {},
                            label: Text(
                              'Prendas actualizadas automáticamente'.toUpperCase(),
                              style: TextStyle(
                                fontSize: Responsive.isMobile(context)
                                    ? 12
                                    : Responsive.isTablet(context)
                                        ? 9
                                        : 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: Responsive.isMobile(context)
                                  ? 12
                                  : Responsive.isTablet(context)
                                      ? 6
                                      : 10),
                          // ignore: deprecated_member_use
                          Text('|', style: TextStyle(fontSize: 30, color: Colors.black.withOpacity(0.3))),
                          const SizedBox(width: 10),
                          TextButton.icon(
                            onPressed: () {},
                            label: Text(
                              'IA que aprende de tus gustos'.toUpperCase(),
                              style: TextStyle(
                                fontSize: Responsive.isMobile(context)
                                    ? 12
                                    : Responsive.isTablet(context)
                                        ? 9
                                        : 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                // color: Colors.red,
                // padding: EdgeInsets.symmetric(horizontal: 20),
                width: Responsive.isMobile(context)
                    ? 12
                    : Responsive.isTablet(context)
                        ? MediaQuery.of(context).size.width * 0.35
                        : MediaQuery.of(context).size.width * 0.35,
                height: Responsive.isMobile(context)
                    ? 12
                    : Responsive.isTablet(context)
                        ? MediaQuery.of(context).size.height * 0.7
                        : MediaQuery.of(context).size.height * 0.8,
                child: Image.asset(
                  'assets/banner.jpg',
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
