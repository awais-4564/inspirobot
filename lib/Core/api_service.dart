// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'api_config.dart'; // Import the configuration
//
// class ApiService {
//   Future<Map<String, dynamic>> generateImage(String prompt) async {
//     final response = await http.post(
//       Uri.parse(ApiConfig.apiUrl), // Use the config values
//       headers: {
//         "Authorization": "Bearer ${ApiConfig.apiKey}",
//         "OpenAI-Organization": ApiConfig.organization,
//         "Content-Type": "application/json",
//       },
//       body: json.encode({"prompt": prompt, "n": 1, "size": "512x512"}),
//     );
//
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to generate image: ${response.body}');
//     }
//   }
// }
