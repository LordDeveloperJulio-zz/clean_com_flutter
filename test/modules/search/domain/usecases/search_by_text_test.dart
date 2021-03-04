import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:semana_flutter/modules/search/domain/entities/result_search.dart';
import 'package:semana_flutter/modules/search/domain/errors/errors.dart';
import 'package:semana_flutter/modules/search/domain/repositories/search_repository.dart';
import 'package:semana_flutter/modules/search/domain/usecases/search_by_text.dart';

class SearchRepositoryMock extends Mock implements SearchRepository{}

main(){
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);

  test('deve retornar uma lista de ResultSearch', () async {
    when(repository.search(any)).thenAnswer((_) async => Right(<ResultSearch>[]));

    final result = await usecase("julio");
    expect(result.getOrElse(() => null), isA<List<ResultSearch>>());
  });

  test('deve retornar um InvalideTextError caso o texto seja invalido', () async {
    when(repository.search(any)).thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await usecase(null);
    expect(result.fold(id,id), isA<InvalideTextError>());
    result = await usecase("");
    expect(result.fold(id,id), isA<InvalideTextError>());
  });
}