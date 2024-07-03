import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/presentation/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_results_state.dart';

class SearchResultsCubit extends Cubit<SearchResultsState> {
  SearchResultsCubit(this.searchRepo) : super(SearchResultsInitial());
  final SearchRepo searchRepo;

  Future<void> getSearchResults({required String? query}) async {
    if (query !=null) {
  emit(SearchResultsLoading());
  var result = await searchRepo.fetchSearchResults(query: query);
  
  result.fold(
    (failure) {
      emit(SearchResultsFailure(errorMessage: failure.errorMessage));
    },
    (books) {
      emit(SearchResultsSuccess(books: books));
    },
  );
}
  }
}
