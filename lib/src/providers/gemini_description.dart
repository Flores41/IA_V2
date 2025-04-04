import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:scraping_ia/src/data/data.dart';

class GeminiDescriptionProvider extends ChangeNotifier {
  final GenerativeModel _model = GenerativeModel(
    model: 'gemini-2.0-flash', // ✅ Ya sabes que este funciona
    apiKey: 'AIzaSyA0PkP6I-6U8Rob-i7_kJmKex6d3fePkDg',
  );

  String description = '';
  String features = '';
  String modelMeasures = '';
  bool isLoading = false;

  Future<void> generateProductDetails(ScrapingModel product) async {
    isLoading = true;
    notifyListeners();

    try {
      final prompt = """
Eres un experto redactor de moda y tecnología de vestimenta. Escribe contenido altamente detallado y atractivo en español para un producto, dividiéndolo en tres secciones claramente marcadas usando el siguiente formato en Markdown:

**Descripción:**
Redacta una descripción persuasiva y emocional del producto. Usa adjetivos atractivos, resalta su utilidad, estilo, ocasión de uso y beneficios emocionales que transmite. Evita repetir el nombre del producto más de una vez.

**Características:**
Incluye una lista de al menos 6 características técnicas o funcionales en viñetas. Enfócate en materiales, diseño, beneficios prácticos, estilo y durabilidad. Usa negritas (`**`) para destacar los títulos de cada viñeta.

**Medidas del modelo:**
Si el producto es ropa, indica: \"La modelo mide 1.75m y usa talla S.\"  
Si el producto **no es ropa** (como carteras, relojes, accesorios), indica: \"Este producto no requiere medidas del modelo.\"

Producto:
- Nombre: ${product.nombre}
- Categoría: ${product.categoria}
- Color: ${product.color}
- Género: ${product.genero}
""";

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      final raw = response.text ?? '';
      debugPrint('📦 Markdown crudo:\n$raw');

      // 🧩 Dividimos por secciones usando encabezados con RegExp
      final descMatch = RegExp(r"\*\*Descripci[óo]n:\*\*\n(.*?)(\n\*\*|$)", dotAll: true).firstMatch(raw);
      final featsMatch = RegExp(r"\*\*Caracter[íi]sticas:\*\*\n(.*?)(\n\*\*|$)", dotAll: true).firstMatch(raw);
      final medidasMatch = RegExp(r"\*\*Medidas del modelo:\*\*\n(.*)", dotAll: true).firstMatch(raw);

      description = descMatch?.group(1)?.trim() ?? 'No disponible';
      features = featsMatch?.group(1)?.trim() ?? 'No disponible';
      modelMeasures = medidasMatch?.group(1)?.trim() ?? 'No disponible';
    } catch (e) {
      description = 'Error al generar descripción';
      features = 'Error al generar características';
      modelMeasures = 'Error al generar medidas';
      debugPrint('🧨 Error en GeminiDescriptionProvider: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
