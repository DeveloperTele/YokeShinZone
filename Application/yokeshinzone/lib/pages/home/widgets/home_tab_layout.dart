import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yokeshinzone/background/models/home/movie_model.dart';
import 'package:yokeshinzone/pages/home/widgets/movie_cell.dart';
import 'package:yokeshinzone/pages/home/widgets/movie_error_page.dart';
import 'package:yokeshinzone/pages/home/widgets/movie_loading_page.dart';

class HomeTabLayout extends StatelessWidget {
  final Stream<MovieModel> stream;
  const HomeTabLayout({
    Key? key,
    required this.stream
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieModel>(
      stream: stream,
      builder: (context, AsyncSnapshot<MovieModel> snapshot) {
        if (snapshot.hasData) {
          if (kDebugMode) {
            print('HomeUpcomingTab ====> ${snapshot.data!.movies!.length}');
          }
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.6,
              ),
              itemCount: snapshot.data!.movies!.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieCell(
                  movie: snapshot.data!.movies![index],
                );
              }
          );
        } else if (snapshot.hasError) {
          return const MovieErrorPage();
        } else {
          return const MovieLoadingPage();
        }
      },
    );
  }
}
