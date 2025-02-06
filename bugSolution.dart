```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Use jsonData
      return; //Added return to avoid unnecessary rethrow if no exception occurs
    } else {
      //Handle error response more gracefully
      throw Exception('Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } on SocketException catch (e) {
    print('Network error: $e');
  } on FormatException catch (e) {
    print('Invalid JSON format: $e');
  } on Exception catch (e) {
    print('An error occurred: $e');
  } catch (e) {
    print('Unknown error: $e');
  } finally {
    //Optional: Cleanup after the operation
    print('Operation finished!');
  }
}
```