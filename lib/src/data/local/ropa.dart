class Ropa {
  final String? name;
  final String? precio;
  final String image;

  Ropa({
    required this.name,
    required this.precio,
    required this.image,
  });
}

final ropa = <Ropa>[
  Ropa(
    name: 'T-SHIRT WITH TAPE DETAILS',
    precio: '\S 56.00',
    //URL DE INTERNET
    image: 'assets/5.jpg',
  ),
  Ropa(
    name: 'SKINNY FIT JEANS',
    precio: 'Lenguaje de programación',
    image: 'assets/6.jpg',
  ),
  Ropa(
    name: 'CHECKERED SHIRT',
    precio: 'Base de datos en tiempo real',
    image: 'assets/7.jpg',
  ),
  Ropa(
    name: 'SLEEVE STRIPED T-SHIRT',
    precio: 'Repositorio de proyectos',
    image: 'assets/8.jpg',
  ),
];
