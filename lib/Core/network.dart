import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_final_exam/Models/product_model.dart';

class Endpoints 
{
  static const baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String userUrl = '$baseUrl/todos';
  static const String productUrl = 'https://dummyjson.com/products';
}

class DataAPIClient
{
  final http.Client httpClient;

  DataAPIClient({required this.httpClient});

  Future<List<Products>> fecthDataFutureFunctionNetworkFile() async
  {
    final dataAPIResponse = await httpClient.get(Uri.parse(Endpoints.userUrl));

    if (dataAPIResponse.statusCode != 200) 
    {
      throw Exception('Api nahin chal rahi - Error');
    }
    //List<dynamic> parsedListJson = jsonDecode(dataAPIResponse.body)/*['products'];*/;
    List<dynamic> parsedListJson = jsonDecode(dataAPIResponse.body)['products'];
    List<Products> itemsList = List<Products>.from
    (
      parsedListJson.map<Products>((dynamic i) => Products.fromJson(i))
    );
    return itemsList;
  }
}