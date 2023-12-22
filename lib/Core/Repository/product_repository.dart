import 'package:flutter_final_exam/Core/network.dart';
import 'package:flutter_final_exam/Models/product_model.dart';

class DataRepository
{
  final DataAPIClient dataAPIClient;

  DataRepository({required this.dataAPIClient});

  Future<List<Products>> getDataFutureFunctionRepositoryFile() async
  {
    return dataAPIClient.fecthDataFutureFunctionNetworkFile();
  }
}