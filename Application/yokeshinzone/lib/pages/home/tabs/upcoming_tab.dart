import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yokeshinzone/background/bloc/movie_list_bloc.dart';
import 'package:yokeshinzone/background/models/home/movie_model.dart';
import 'package:yokeshinzone/pages/home/widgets/movie_cell.dart';
import 'package:yokeshinzone/pages/home/widgets/movie_error_page.dart';
import 'package:yokeshinzone/pages/home/widgets/movie_loading_page.dart';

class HomeUpcomingTab extends StatefulWidget {
  const HomeUpcomingTab({Key? key}) : super(key: key);

  @override
  State<HomeUpcomingTab> createState() => _HomeUpcomingTabState();
}

class _HomeUpcomingTabState extends State<HomeUpcomingTab> {

  @override
  void initState() {
    super.initState();
    moviesBloc.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieModel>(
      stream: moviesBloc.popularSubject.stream,
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
