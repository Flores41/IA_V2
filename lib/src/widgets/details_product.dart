import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scraping_ia/src/core/utils/colors.dart';
import 'package:scraping_ia/src/core/utils/responsive.dart';
import 'package:scraping_ia/src/data/data.dart';
import 'package:scraping_ia/src/providers/providers.dart';
import 'package:scraping_ia/src/screens/details/product_details_screen.dart';

// Asegúrate de tener bien el path

class CategoryProductsScreen extends StatefulWidget {
  final String gender;
  final String category;

  const CategoryProductsScreen({
    super.key,
    required this.gender,
    required this.category,
  });

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  String? selectedCategory;
  String? selectedColor;
  double? minPrice;
  double? maxPrice;
  Set<String> selectedColors = {};

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.category;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScrapingProvider>(context);

    List<ScrapingModel> products = provider.allScrapingList.where((p) {
      final matchGender = p.genero.toLowerCase() == widget.gender.toLowerCase();
      final matchCategory = selectedCategory == null || p.categoria == selectedCategory;
      final matchColor = selectedColors.isEmpty || (p.color != null && selectedColors.contains(p.color!));

      return matchGender && matchCategory && matchColor;
    }).toList();

    final allCategories = provider.allScrapingList
        .where((p) => p.genero.toLowerCase() == widget.gender.toLowerCase())
        .map((e) => e.categoria)
        .toSet()
        .toList();

    final allColors = provider.allScrapingList.map((e) => e.color).whereType<String>().toSet().toList();
    final w = context.w;
    final h = context.h;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
          child: SizedBox(
            width: w * 0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🔍 Filtros
                Container(
                  width: 250,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey.shade300))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            "Categoría".toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        DropdownButton<String>(
                          isExpanded: true,
                          value: selectedCategory,
                          hint: const Text("Selecciona categoría"),
                          items: allCategories
                              .map((cat) => DropdownMenuItem(
                                  value: cat, child: Text(cat.toUpperCase(), style: const TextStyle(fontSize: 12))))
                              .toList(),
                          onChanged: (value) => setState(() => selectedCategory = value),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            "Color".toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ...allColors.map((color) {
                          final isSelected = selectedColors.contains(color);
                          return CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            visualDensity: VisualDensity.compact,
                            title: Text(color.toUpperCase(),
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            value: isSelected,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  selectedColors.add(color);
                                } else {
                                  selectedColors.remove(color);
                                }
                              });
                            },
                          );
                        }).toList(),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            elevation: 10,
                            shadowColor: Colors.black.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedCategory = null;
                              selectedColor = null;
                              minPrice = null;
                              maxPrice = null;
                              selectedColors.clear();
                            });
                          },
                          child: Text(
                            "Limpiar filtros".toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // 🛍️ Productos
                Expanded(
                  child: products.isEmpty
                      ? const Center(child: Text("No hay productos disponibles"))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: GridView.builder(
                            itemCount: products.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: Responsive.isMobile(context)
                                  ? 2
                                  : Responsive.isTablet(context)
                                      ? 3
                                      : 4,
                              mainAxisSpacing: 30, // Espacio vertical entre filas
                              crossAxisSpacing: 30, // Espacio horizontal entre columnas
                              childAspectRatio: Responsive.isMobile(context)
                                  ? 2
                                  : Responsive.isTablet(context)
                                      ? 0.56
                                      : 0.65,
                            ),
                            itemBuilder: (context, index) {
                              final item = products[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ProductDetailScreen(product: item),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    // color: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.black.withOpacity(0.2),
                                    //     blurRadius: 10,
                                    //     offset: const Offset(0, 2),
                                    //   ),
                                    // ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // Imagen
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                        child: Image.network(
                                          item.imagen,
                                          height: 250,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      // Nombre
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                        child: Text(
                                          item.nombre.toUpperCase(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: Responsive.isMobile(context)
                                                ? 2
                                                : Responsive.isTablet(context)
                                                    ? 9
                                                    : 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            height: 1.6,
                                            letterSpacing: 2,
                                            wordSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      // Precio
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.2),
                                                blurRadius: 10,
                                                blurStyle: BlurStyle.outer,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            "S/ ${item.precio.toStringAsFixed(2)}",
                                            style: TextStyle(
                                                fontSize: Responsive.isMobile(context)
                                                    ? 2
                                                    : Responsive.isTablet(context)
                                                        ? 10
                                                        : 13,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
