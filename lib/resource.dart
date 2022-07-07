import 'dart:async';
import 'model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Repository {
  final contactApiProvider = ContactApiProvider();
  Future<ItemModel> fetchAllContact() => contactApiProvider.fetchContactList();
}
class ContactApiProvider {
  final _baseUrl = "https://reqres.in/api/users?per_page=12";

  Future<ItemModel> fetchContactList() async {
    final response = await http.get(Uri.parse("$_baseUrl"));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}