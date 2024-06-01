import 'package:dictionary/core/network/api_manager.dart';
import 'package:dictionary/core/network/api_uris.dart';
import 'package:dictionary/core/network/base_result.dart';
import 'package:dictionary/model/dictionary_model.dart';

class DictionaryRepo {
  ApiManager apiManager = ApiManager();

  Future<Result<DictionaryModel>> search(String searchQuery) async {
    try {
      final response =
          await apiManager.get('${ApiUris.dictionaryUri}$searchQuery');

      if (response.statusCode == 200) {
        final dictionary = response.data;
        final result = DictionaryModel.fromJson(dictionary[0]);

        return Result.success(result);
      }
      return Result.failure('Api fetching failed');
    } catch (e) {
      return Result.failure('An error occurred');
    }
  }
}
