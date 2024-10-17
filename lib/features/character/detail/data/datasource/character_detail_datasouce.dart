import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trumed/features/character/detail/data/models/character_detail_model.dart';
import 'package:trumed/features/character/home/data/models/character_list_model.dart';

// part 'character_datasource.g.dart';

// @RestApi()
// abstract class CharacterRemoteDataSource {
//   factory CharacterRemoteDataSource(Dio dio, {String baseUrl}) =
//       _CharacterRemoteDataSource;

//   @GET("/character")
//   Future<CharacterListModel> characterList(
//       {required Map<String, dynamic> queryParameters});
// }

class CharacterDetailRemoteDataSource {
  ///
  CharacterDetailRemoteDataSource(this.dio, this.baseUrl);

  ///
  final Dio dio;

  ///
  final String baseUrl;

  Future<CharacterDetailModel> characterDetail({required int id}) async {
    final response = await dio.get(
      '$baseUrl/character/2',
    );
    print(response.data);
    return CharacterDetailModel.fromJson(response.data);
  }
}
