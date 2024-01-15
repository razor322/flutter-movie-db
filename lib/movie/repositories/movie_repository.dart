import 'package:dartz/dartz.dart';
import 'package:movie_app/movie/models/movie_model.dart';

abstract class MovieRepository {
  Future<Either<String, MovieResponseModel>> getDiscover({int page = 1});
}
