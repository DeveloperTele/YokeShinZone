import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yokeshinzone/background/constants/app_constants.dart';
import 'package:yokeshinzone/background/models/detail/movie_detail_model.dart';
import 'package:yokeshinzone/pages/detail/widgets/detail_appbar.dart';
import 'package:yokeshinzone/pages/detail/widgets/detail_poster_bar.dart';

class DetailInfo extends StatefulWidget {

  final MovieDetailModel movie;

  const DetailInfo({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  State<DetailInfo> createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          DetailAppbar(movie: widget.movie),
          DetailPosterBar(movie: widget.movie),
          SliverFillRemaining(
            child: Container(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
