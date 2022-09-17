import 'package:code_union_test/core/api/api.dart';
import 'package:code_union_test/core/local_storage/local_storage.dart';

abstract class AppProvider {
  final _api = Api();
  final _storage = LocalStorage();

  Api get api => _api;
  LocalStorage get storage => _storage;
}
