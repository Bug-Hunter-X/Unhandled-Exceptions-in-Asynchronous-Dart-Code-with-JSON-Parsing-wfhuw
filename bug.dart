```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the API returns a JSON array
      final jsonData = jsonDecode(response.body);
      // Accessing elements without checking for null or out-of-bounds can cause errors.
      final firstElement = jsonData[0]; //Error prone if jsonData is empty or not a list.
      final nestedValue = firstElement['nestedField']; //Error prone if nestedField doesn't exist in firstElement.
      print(nestedValue);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    //Handle the error appropriately, such as showing an error message to the user or retrying the request.
  }
}
```