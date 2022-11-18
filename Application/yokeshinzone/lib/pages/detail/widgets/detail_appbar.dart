import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yokeshinzone/background/constants/app_constants.dart';
import 'package:yokeshinzone/background/models/detail/movie_detail_model.dart';

class DetailAppbar extends StatelessWidget {

  final MovieDetailModel movie;

  const DetailAppbar({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: 450,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('${movie.title}', style: const TextStyle(
          color: Colors.white,
          fontSize: 27,
          overflow: TextOverflow.visible
        )),
        background: Stack(children: <Widget>[
          CachedNetworkImage(
            imageUrl: '$imgUrl${movie.backdropPath}',
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => Container(
              height: 550,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: 550.0,
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.black,
                    ],
                    stops: const [0.0,1.0])
            ),
          )
        ]),
      ),
    );
  }
}
