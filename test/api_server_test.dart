import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:trumed/features/character/detail/data/datasource/character_detail_datasouce.dart';
import 'package:trumed/features/character/home/data/datasource/character_datasource.dart';

import 'api_server_test.mocks.dart';

// Generamos un mock para la clase http.Client
@GenerateMocks([http.Client])
void main() {
  group('ApiService Test', () {
    test(
        'fetchData devuelve los datos si la llamada http se completa con éxito con caracteres',
        () async {
      final client = MockClient();
      final apiService =
          CharacterRemoteDataSource(Dio(), 'https://rickandmortyapi.com/api/');
      when(client.get(Uri.parse('${apiService.baseUrl}/character'))).thenAnswer(
          (_) async => http.Response(
              '{"info": {"count": 826}, "results": [{"id": 1, "name": "Rick Sanchez"}, {"id": 2, "name": "Morty Smith"}]}',
              200));

      final data = await apiService.characterList();
      expect(data.info.count.toString(), '826');
      expect(data.results[0].id, 1);
      expect(data.results[0].name, 'Rick Sanchez');
      expect(data.results[1].name, 'Morty Smith');
    });
    test(
        'fetchCharacter devuelve un personaje específico si la llamada http se completa con éxito',
        () async {
      final client = MockClient();
      final apiService = CharacterDetailRemoteDataSource(
          Dio(), 'https://rickandmortyapi.com/api/');
      const characterId = 2;
      const characterJson = '{"id": 2, "name": "Morty Smith"}';

      when(client
              .get(Uri.parse('${apiService.baseUrl}/character/$characterId')))
          .thenAnswer((_) async => http.Response(characterJson, 200));

      final character = await apiService.characterDetail(id: characterId);
      expect(character.id, 2);
      expect(character.name, 'Morty Smith');
    });
  });
}
