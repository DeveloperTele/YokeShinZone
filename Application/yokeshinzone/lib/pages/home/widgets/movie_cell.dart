import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yokeshinzone/background/constants/app_constants.dart';
import 'package:yokeshinzone/background/models/home/movie_model.dart';
import 'package:yokeshinzone/pages/detail/detail_page.dart';
import 'package:yokeshinzone/pages/widgets/round_background_text/round_background_text.dart';

class MovieCell extends StatelessWidget {

  final Movie? movie;

  const MovieCell({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (c) => MovieDetailPage(movie: movie))
      ),
      child: Card(
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
                  Text('${movie!.title}', style: const TextStyle(color: Colors.white))
                ],
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
                child: RoundedBackgroundText(movie!.voteAverage.toStringAsFixed(1),
                  backgroundColor: Colors.purple,
                  innerRadius: 10,
                  outerRadius: 13.0,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                //child: Text('${movie!.voteAverage}')
            )
          ],
        ),
      ),
    );
  }
}