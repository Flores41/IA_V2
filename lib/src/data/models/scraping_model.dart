import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/domain.dart';

class ScrapingModel extends Scraping {
  ScrapingModel({
    required super.id,
    required super.nombre,
    required super.color,
    required super.genero,
    required super.categoria,
    required super.imagen,
    required super.precio,
    required super.precioAntes,
  });

  factory ScrapingModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    double parsePrecio(dynamic raw) {
      if (raw is num) return raw.toDouble();
      if (raw is String) {
        return double.tryParse(raw.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0;
      }
      return 0.0;
    }

    return ScrapingModel(
      id: snapshot.id,
      nombre: data?['nombre'],
      color: data?['color'],
      genero: data?['genero'],
      categoria: data?['categoria'],
      imagen: data?['imagen'],
      precio: parsePrecio(data?['precio']),
      precioAntes: parsePrecio(data?['precioAntes']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'color': color,
      'genero': genero,
      'categoria': categoria,
      'imagen': imagen,
      'precio': precio,
      'precioAntes': precioAntes,
    };
  }

  factory ScrapingModel.fromMap(Map<String, dynamic> map) {
    return ScrapingModel(
      id: map['id'],
      nombre: map['nombre'],
      color: map['color'],
      genero: map['genero'],
      categoria: map['categoria'],
      imagen: map['imagen'],
      precio: double.parse(map['precio'].toString()),
      precioAntes: double.parse(map['precioAntes'].toString()),
    );
  }
}
