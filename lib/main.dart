import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/const.dart';
import 'package:movie_app/movie/pages/movie_page.dart';
import 'package:movie_app/movie/provider/movie_get_discover.dart';
import 'package:movie_app/movie/repositories/movie_repository.dart';
import 'package:movie_app/movie/repositories/movie_repository_impl.dart';
import 'package:provider/provider.dart';

void main() {
  final dioOptions = BaseOptions(
      baseUrl: Const.baseUrl, queryParameters: {'api_key': Const.apiKey});

  final Dio dio = Dio(dioOptions);
  final MovieRepository movieRepository = MovieRepositoryImpl(dio);
  runApp(App(
    movieRepository: movieRepository,
  ));
}

class App extends StatelessWidget {
  const App({super.key, required this.movieRepository});

  final MovieRepository movieRepository;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => MoviegetDiscoverprovider(movieRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MoviePages(),
      ),
    );
  }
}
