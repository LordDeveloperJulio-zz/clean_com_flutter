import 'package:bloc/bloc.dart';
import 'package:semana_flutter/modules/search/domain/usecases/search_by_text.dart';
import 'package:semana_flutter/modules/search/presenter/search/state/state.dart';

class SearchBloc extends Bloc<String, SearchState>{
  final SearchByText usecase;

  SearchBloc(this.usecase) : super(null);

  @override
  Stream<SearchState> mapEventToState(String searchText) async* {
    yield SearchLoading();
    final result = await usecase(searchText);
    yield result.fold((l) => SearchError(l), (r) => SearchSuccess(r));
  }



}