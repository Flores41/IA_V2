// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ImageGenerationProvider extends ChangeNotifier {
//   String? generatedImageUrl;
//   bool isLoading = false;

//   Future<void> generateImageFromPrompt(String prompt) async {
//     isLoading = true;
//     notifyListeners();

//     const String apiToken = 'r8_Usgu2G78UApxO9TWkwcZ8a4rpyvxG8a4PScQ6';
//     const String endpoint = 'https://api.replicate.com/v1/predictions';

//     try {
//       final response = await http.post(
//         Uri.parse(endpoint),
//         headers: {
//           'Authorization': 'Token $apiToken',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           "version": "db21e45a3f6c6f09b3ba886374f5c3e60e2d61484886b54bfb60c2a6a575b5a0", // Stable Diffusion 1.5
//           "input": {
//             "prompt": prompt,
//             "num_outputs": 1,
//           }
//         }),
//       );

//       if (response.statusCode == 201) {
//         final prediction = jsonDecode(response.body);
//         final getUrl = prediction['urls']['get'];

//         // Poll for completion
//         bool completed = false;
//         while (!completed) {
//           await Future.delayed(const Duration(seconds: 3));
//           final pollResponse = await http.get(
//             Uri.parse(getUrl),
//             headers: {'Authorization': 'Token $apiToken'},
//           );

//           final pollData = jsonDecode(pollResponse.body);
//           if (pollData['status'] == 'succeeded') {
//             generatedImageUrl = pollData['output'][0];
//             completed = true;
//           } else if (pollData['status'] == 'failed') {
//             throw Exception('La generación de imagen falló');
//           }
//         }
//       } else {
//         throw Exception('Error en la petición inicial: ${response.body}');
//       }
//     } catch (e) {
//       debugPrint('🧨 Error al generar imagen: $e');
//       generatedImageUrl = null;
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }
// }
