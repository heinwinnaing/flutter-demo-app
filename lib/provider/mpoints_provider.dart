import 'package:get/get.dart';
import 'package:mpoints_app/features/auth/models/master_data_model.dart';
import 'package:mpoints_app/provider/http/api_client.dart';
import 'package:mpoints_app/provider/http/status_code.dart';
import 'package:mpoints_app/provider/storage/db_sqlite.dart';
import 'package:mpoints_app/provider/storage/local_storage.dart';
import 'package:sqflite/sqflite.dart';

class MPointsProvider extends GetConnect {
  final String basicAuth = 'Basic YXBwOmRldg==';
  //const String.fromEnvironment('BASIC_AUTHE', defaultValue: 'Basic YXBwOmRldg==');
  ApiClient apiClient = const ApiClient();
  LocalStorage localStorage = LocalStorage();
  DbSqlite database = DbSqlite();

  Future getMasterData() async {
    final response = await apiClient.get('v1/master-data', basicAuth,
        fromJson: (json) => MasterDataModel.fromJson(json));
    if (response.code == StatusCodes.success.value) {
      var db = await database.getDataBase();
       await db.execute(
            'CREATE TABLE IF NOT EXISTS contentUrls(url TEXT PRIMARY KEY, title TEXT)');
            
      await db.insert('contentUrls', {'url': response.data?.about_us ?? '', 'title': ''},
          conflictAlgorithm: ConflictAlgorithm.replace);
      await db.insert('contentUrls', {'url': response.data?.terms_of_user ?? '', 'title': ''},
          conflictAlgorithm: ConflictAlgorithm.replace);
      await db.insert('contentUrls', {'url': response.data?.privacy_policy ?? '', 'title': ''},
          conflictAlgorithm: ConflictAlgorithm.replace);
      await db.insert('contentUrls', {'url': response.data?.contact_us ?? '', 'title': ''},
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }
}
