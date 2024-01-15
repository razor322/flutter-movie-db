import 'package:dartz/dartz.dart';
import 'package:movie_app/movie/models/movie_model.dart';
import 'package:movie_app/movie/repositories/movie_repository.dart';
import 'package:dio/dio.dart';

class MovieRepositoryImpl implements MovieRepository {
  final Dio _dio;

  MovieRepositoryImpl(this._dio);

  @override
  Future<Either<String, MovieResponseModel>> getDiscover({int page = 1}) async {
    try {
      final result =
          await _dio.get('/discover/movie', queryParameters: {'page': page});

      if (result.statusCode == 200 && result.data != null) {
        final model = MovieResponseModel.fromMap(result.data);
        return Right(model);
      }
      return Left("Error get discover movie");
    } on DioError catch (e) {
      if (e.response == null) {
        return Left(e.response.toString());
      }
      return Left("Another error get discover movie");
    }
  }
}
