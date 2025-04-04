import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scraping_ia/main.dart';
import 'package:scraping_ia/src/providers/providers.dart';
import 'package:scraping_ia/src/widgets/details_product.dart';

class NavigationHeader extends StatefulWidget implements PreferredSizeWidget {
  const NavigationHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  State<NavigationHeader> createState() => _NavigationHeaderState();
}

class _NavigationHeaderState extends State<NavigationHeader> with SingleTickerProviderStateMixin {
  bool _isMenuOpen = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void _toggleMenu() {
    setState(() => _isMenuOpen = !_isMenuOpen);
    _isMenuOpen ? _animationController.forward() : _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.12),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Scraping IA'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.black,
                  ),
                ),
                if (!isMobile)
                  Row(
                    children: const [
                      GenderDropdown(genderLabel: 'Mujer'),
                      GenderDropdown(genderLabel: 'Hombre'),
                    ],
                  )
                else
                  IconButton(
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _animationController,
                      color: Colors.white,
                    ),
                    onPressed: _toggleMenu,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Este archivo contiene el navigatorKey

class GenderDropdown extends StatefulWidget {
  final String genderLabel;

  const GenderDropdown({super.key, required this.genderLabel});

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isPointerInside = false;

  void _showMenu() {
    _overlayEntry = _buildOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _buildOverlayEntry() {
    final provider = Provider.of<ScrapingProvider>(context, listen: false);

    final categories = provider.allScrapingList
        .where((item) => item.genero.toLowerCase() == widget.genderLabel.toLowerCase())
        .map((e) => e.categoria)
        .toSet()
        .toList();

    return OverlayEntry(
      builder: (context) => Positioned(
        width: 300,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: const Offset(0, 50),
          showWhenUnlinked: false,
          child: MouseRegion(
            onEnter: (_) => _isPointerInside = true,
            onExit: (_) {
              _isPointerInside = false;
              Future.delayed(const Duration(milliseconds: 100), () {
                if (!_isPointerInside) _hideMenu();
              });
            },
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: categories.map((cat) {
                    return GestureDetector(
                      onTap: () async {
                        final scrapingProvider = Provider.of<ScrapingProvider>(context, listen: false);
                        scrapingProvider.updateGender(widget.genderLabel);
                        scrapingProvider.updateCategory(cat);
                        _hideMenu();

// Guardamos los valores temporales
                        final String selectedGender = widget.genderLabel;
                        final String selectedCategory = cat;

                        await Future.delayed(const Duration(milliseconds: 100));

// Navegamos
                        await navigatorKey.currentState?.push(
                          MaterialPageRoute(
                            builder: (_) => CategoryProductsScreen(
                              gender: selectedGender,
                              category: selectedCategory,
                            ),
                          ),
                        );

// ✅ Restauramos el estado para que el menú se vea completo al volver
                        scrapingProvider.updateGender('Todos');
                        scrapingProvider.updateCategory('Todas');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            cat.toUpperCase(),
                            style: const TextStyle(fontSize: 12, color: Colors.black87),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _isPointerInside = true;
        _showMenu();
      },
      onExit: (_) {
        _isPointerInside = false;
        Future.delayed(const Duration(milliseconds: 100), () {
          if (!_isPointerInside) _hideMenu();
        });
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Row(
          children: [
            Text(
              widget.genderLabel.toUpperCase(),
              style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.black),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
