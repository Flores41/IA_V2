// import 'package:flutter/material.dart';
// import 'package:scraping_ia/src/core/utils/utils.dart';

// class ContainerCustom extends StatelessWidget {
//   const ContainerCustom({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final w = context.w;
//     final h = context.h;
//     return Center(
//       child: SizedBox(
//         width: w * 4,
//         height: h * 0.8,
//         child: Stack(
//           children: [
//             ClipPath(
//               clipper: HeaderClipper(),
//               child: Image.network(
//                 'https://images.unsplash.com/photo-1606787366850-de6330128bfc',
//                 fit: BoxFit.cover,
//                 width: w * 4,
//                 height: h * 0.8,
//                 alignment: Alignment.center,
//               ),
//             ),
//             // Opcional: pintar bordes sobre la imagen
//             CustomPaint(
//               painter: HeaderPainter(),
//               size: Size(
//                 w * 8,
//                 h * 0.8,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HeaderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final lapiz = Paint()
//       ..color = const Color(0xFFD2FF3A)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.0
//       ..strokeCap = StrokeCap.round;

//     final r = 15.0;
//     final rSmall = 15.0;
//     final path = Path();

//     path.moveTo(r, 0);

//     path.lineTo(size.width * 0.26 - r, 0);
//     path.arcToPoint(
//       Offset(size.width * 0.26, r),
//       radius: Radius.circular(r),
//     );

//     path.lineTo(size.width * 0.26, size.height * 0.15 - r);
//     path.arcToPoint(
//       Offset(size.width * 0.26 - r, size.height * 0.15),
//       radius: Radius.circular(r),
//       // clockwise: false,
//     );

//     path.lineTo(size.width * 0.2 + r, size.height * 0.15);
//     path.arcToPoint(
//       Offset(size.width * 0.2, size.height * 0.15 + r),
//       radius: Radius.circular(r),
//       clockwise: false,
//     );

//     path.lineTo(size.width * 0.2, size.height * 0.3 - rSmall);
//     path.arcToPoint(
//       Offset(size.width * 0.2 - rSmall, size.height * 0.3),
//       radius: Radius.circular(rSmall),
//       clockwise: true, // ← Esto arregla la curva
//     );

//     path.lineTo(r, size.height * 0.3);
//     path.arcToPoint(
//       Offset(0, size.height * 0.3 - r),
//       radius: Radius.circular(r),
//     );

//     path.lineTo(0, r);
//     path.arcToPoint(
//       Offset(r, 0),
//       radius: Radius.circular(r),
//     );

//     canvas.drawPath(path, lapiz);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

// class HeaderClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final r = 15.0;
//     final rSmall = 15.0;
//     final path = Path();

//     // color

//     path.moveTo(r, 0);
//     path.lineTo(size.width * 0.26 - r, 0);
//     path.arcToPoint(
//       Offset(size.width * 0.26, r),
//       radius: Radius.circular(r),
//     );
//     path.lineTo(size.width * 0.26, size.height * 0.15 - r);
//     path.arcToPoint(
//       Offset(size.width * 0.26 - r, size.height * 0.15),
//       radius: Radius.circular(r),
//     );
//     path.lineTo(size.width * 0.2 + r, size.height * 0.15);
//     path.arcToPoint(
//       Offset(size.width * 0.2, size.height * 0.15 + r),
//       radius: Radius.circular(r),
//       clockwise: false,
//     );
//     path.lineTo(
//       size.width * 0.2,
//       size.height * 0.3 - rSmall,
//     );
//     path.arcToPoint(
//       Offset(
//         size.width * 0.2 - rSmall,
//         size.height * 0.3,
//       ),
//       radius: Radius.circular(rSmall),
//     );
//     path.lineTo(
//       r,
//       size.height * 0.3,
//     );
//     path.arcToPoint(
//       Offset(0, size.height * 0.3 - r),
//       radius: Radius.circular(r),
//       clockwise: true,
//     );
//     path.lineTo(0, r);
//     path.arcToPoint(
//       Offset(r, 0),
//       radius: Radius.circular(r),
//       clockwise: true,
//     );

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => true;
// }
