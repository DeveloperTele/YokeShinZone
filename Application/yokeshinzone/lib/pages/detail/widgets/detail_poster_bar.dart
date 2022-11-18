import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yokeshinzone/background/constants/app_constants.dart';
import 'package:yokeshinzone/background/models/detail/movie_detail_model.dart';
import 'package:intl/intl.dart';

class DetailPosterBar extends StatelessWidget {

  final MovieDetailModel movie;

  const DetailPosterBar({
    Key? key,
    required this.movie
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                shadowColor: Colors.white,
                elevation: 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: '$imgUrl${movie.posterPath}',
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 250,
                      width: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: List<TextSpan>.generate(movie.genres!.length, (index) {
                        return TextSpan(text: '${movie.genres![index].name!}, ');
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Release : ${DateFormat('dd/MMM/yyyy').format(movie.movieDate!)}'),
                  const SizedBox(height: 10),
                  Text('Vote Total : ${movie.voteCount!}'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
