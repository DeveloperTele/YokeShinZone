import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yokeshinzone/background/constants/app_constants.dart';
import 'package:yokeshinzone/background/models/home/movie_model.dart';

class MovieCell extends StatelessWidget {

  final Movie? movie;

  const MovieCell({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: '$imgUrl${movie!.backdropPath!}',
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.black87,
                    ],
                    stops: const [0.0,1.0])
            ),
            padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Text('${movie!.title}', style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}