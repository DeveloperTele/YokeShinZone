import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yokeshinzone/background/constants/app_constants.dart';

class DetailLoadingWidget extends StatelessWidget {

  final String? backdrop;

  const DetailLoadingWidget({
    Key? key,
    this.backdrop
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 550,
          child: Stack(children: <Widget>[
            CachedNetworkImage(
              imageUrl: '$imgUrl$backdrop',
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
        const Expanded(child: Center(
          child: Text('LOADING', style: TextStyle(
            color: Colors.white,
            fontSize: 22
          ),),
        ))
      ],
    );
  }
}
