import 'package:flutter/material.dart';
import 'package:movie_app/movie/models/movie_model.dart';
import 'package:movie_app/movie/repositories/movie_repository.dart';

class MoviegetDiscoverprovider with ChangeNotifier {
  final MovieRepository _movieRepository;

  MoviegetDiscoverprovider(this._movieRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  void getDiscover(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final result = await _movieRepository.getDiscover();
    result.fold((errorMessage) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
      _isLoading = false;
      notifyListeners();
      return;
    }, (response) {
      _movies.clear();
      _movies.addAll(response.results);
      response.results;
      _isLoading = false;
      notifyListeners();
      return null;
    });
  }
}
