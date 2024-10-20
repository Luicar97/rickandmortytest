import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
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

class CharacterRemoteDataSource {
  ///
  CharacterRemoteDataSource(this.dio, this.baseUrl);

  ///
  final Dio dio;

  ///
  final String baseUrl;

  Future<CharacterListModel> characterList(
      {Map<String, dynamic>? params}) async {
    final response = await dio.get(
      '$baseUrl/character',
      queryParameters: params,
    );
    return CharacterListModel.fromJson(response.data);
  }
}
