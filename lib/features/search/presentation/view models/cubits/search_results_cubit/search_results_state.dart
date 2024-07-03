part of 'search_results_cubit.dart';

sealed class SearchResultsState extends Equatable {
  const SearchResultsState();

  @override
  List<Object> get props => [];
}

final class SearchResultsInitial extends SearchResultsState {}

final class SearchResultsSuccess extends SearchResultsState {
  final List<BookModel> books;

  const SearchResultsSuccess({required this.books});
}

final class SearchResultsFailure extends SearchResultsState {
  final String errorMessage;

  const SearchResultsFailure({required this.errorMessage});
}

final class SearchResultsLoading extends SearchResultsState {}
