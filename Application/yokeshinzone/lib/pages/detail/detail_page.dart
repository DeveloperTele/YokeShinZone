import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yokeshinzone/background/bloc/movie_detail_bloc.dart';
import 'package:yokeshinzone/background/models/detail/movie_detail_model.dart';
import 'package:yokeshinzone/background/models/home/movie_model.dart';
import 'package:yokeshinzone/pages/detail/widgets/detail_info.dart';
import 'package:yokeshinzone/pages/detail/widgets/detail_loading_widget.dart';
import 'package:yokeshinzone/pages/home/widgets/movie_error_page.dart';
import 'package:yokeshinzone/pages/home/widgets/movie_loading_page.dart';

class MovieDetailPage extends StatefulWidget {

  final Movie? movie;

  const MovieDetailPage({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {

  @override
  void initState() {
    super.initState();
    movieDetailBloc.getMovieDetail(widget.movie!.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder<MovieDetailModel>(
        stream: movieDetailBloc.subject.stream,
        builder: (context, AsyncSnapshot<MovieDetailModel> snapshot) {
          if (snapshot.hasData) {
            if (kDebugMode) {
              print('MovieDetailPage ====> ${snapshot.data!.toJson()}');
            }
            return DetailInfo(movie: snapshot.data!);
          } else if (snapshot.hasError) {
            return const MovieErrorPage();
          } else {
            return DetailLoadingWidget(backdrop: widget.movie!.backdropPath!,);
          }
        },
      ),
    );
  }
}
