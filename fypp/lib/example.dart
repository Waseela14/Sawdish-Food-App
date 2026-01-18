// import 'dart:convert';
// import 'package:http/http.dart' as http;

// void main() async {
//   // The string you want to send
//   String text = "i am sad";

//   // The URL of the Flask backend
//   String url =
//       "https://sorry-karlotte-neduniversityofengineeringandtechnology-f82558e3.koyeb.app/predict";

//   // The headers and body for the POST request
//   Map<String, String> headers = {"Content-Type": "application/json"};
//   Map<String, dynamic> body = {"text": text};

//   try {
//     // Making the POST request
//     http.Response response = await http.post(
//       Uri.parse(url),
//       headers: headers,
//       body: json.encode(body),
//     );

//     // Checking if the request was successful
//     if (response.statusCode == 200) {
//       // Parsing the JSON response
//       Map<String, dynamic> responseBody = json.decode(response.body);
//       // Printing the response to the console
//       print("Predicted Sentiment: ${responseBody['predicted_sentiment']}");
//     } else {
//       print("Failed to get response: ${response.statusCode}");
//     }
//   } catch (e) {
//     print("Error: $e");
//   }
// }
