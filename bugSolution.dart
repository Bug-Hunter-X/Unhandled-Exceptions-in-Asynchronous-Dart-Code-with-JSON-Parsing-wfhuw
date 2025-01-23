```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      // Check if jsonData is a list and not empty
      if (jsonData is List && jsonData.isNotEmpty) {
        final firstElement = jsonData[0];
        // Check if firstElement is a map and contains 'nestedField'
        if (firstElement is Map && firstElement.containsKey('nestedField')) {
          final nestedValue = firstElement['nestedField'];
          print(nestedValue);
        } else {
          print('Error: Unexpected JSON structure or missing field.');
        }
      } else {
        print('Error: Empty or invalid JSON data.');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```