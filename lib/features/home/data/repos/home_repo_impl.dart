import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService = ApiService();
  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endpoints:
              "volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Programming");
      List<BookModel> books = [];

      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e  is DioException) {
      return left(ServiceFailure.fromDioException(e));  
      }
      return left(ServiceFailure(e.toString())); // handle it better
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks()async {
     try {
      var data = await apiService.get(
          endpoints:
              "volumes?Filtering=free-ebooks&q=subject:Programming");
      List<BookModel> books = [];

      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e  is DioException) {
      return left(ServiceFailure.fromDioException(e));  
      }
      return left(ServiceFailure(e.toString())); // handle it better
    }
  }
}
