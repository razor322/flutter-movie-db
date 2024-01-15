import 'package:flutter/material.dart';
import 'package:movie_app/movie/provider/movie_get_discover.dart';
import 'package:provider/provider.dart';

class MoviePages extends StatelessWidget {
  const MoviePages({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MoviegetDiscoverprovider>().getDiscover(context);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie DB"),
      ),
      body: Consumer<MoviegetDiscoverprovider>(
        builder: (
          _,
          provider,
          __,
        ) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (provider.movies.isNotEmpty) {
            return ListView.builder(itemBuilder: (context, index) {
              final movie = provider.movies[index];

              return ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.overview),
              );
            });
          }

          return Center(
            child: Text("Not Found Discover Movies"),
          );
        },
      ),
    );
  }
}
