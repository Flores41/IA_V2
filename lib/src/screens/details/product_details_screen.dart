import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:scraping_ia/src/data/data.dart';
import 'package:scraping_ia/src/providers/gemini_description.dart';

class ProductDetailScreen extends StatefulWidget {
  final ScrapingModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final gemini = Provider.of<GeminiDescriptionProvider>(context, listen: false);
      gemini.generateProductDetails(widget.product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 200),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 📸 Imagen del producto
              Expanded(
                flex: 3,
                child: Container(
                  height: 350,
                  width: 350,
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    // border: Border.all(color: Colors.black.withOpacity(0.1), width: 2),
                    image: DecorationImage(
                      image: NetworkImage(product.imagen),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  // child: ClipRRect(
                  //   // borderRadius: BorderRadius.circular(16),
                  //   child: Image.network(
                  //     product.imagen,
                  //     fit: BoxFit.fill,
                  //     height: 350,
                  //   ),
                  // ),
                ),
              ),

              const SizedBox(width: 70),

              // 📄 Info del producto + IA
              Expanded(
                flex: 6,
                child: Consumer<GeminiDescriptionProvider>(
                  builder: (_, gemini, __) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.nombre.toUpperCase(),
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.star, color: Colors.white, size: 12),
                                  SizedBox(width: 7),
                                  Text("4.5/5",
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                "S/ ${product.precio.toStringAsFixed(2)}",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // 🔽 Secciones desplegables
                        gemini.isLoading
                            ? const CircularProgressIndicator()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ExpansionTile(
                                    title: Text("Descripción".toUpperCase(),
                                        style:
                                            TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 13)),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: MarkdownBody(
                                          data: gemini.description,
                                          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                                            p: const TextStyle(fontSize: 15, height: 1.5, color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text("Características".toUpperCase(),
                                        style:
                                            TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 13)),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: MarkdownBody(
                                          data: gemini.features,
                                          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                                            p: const TextStyle(fontSize: 15, height: 1.5, color: Colors.black45),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (gemini.modelMeasures.trim().isNotEmpty &&
                                      !gemini.modelMeasures.toLowerCase().contains("modelo"))
                                    ExpansionTile(
                                      title: const Text("Medidas del modelo",
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: MarkdownBody(
                                            data: gemini.modelMeasures,
                                            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                                              p: const TextStyle(fontSize: 14, height: 1.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
