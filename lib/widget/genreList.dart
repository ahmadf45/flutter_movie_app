import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/serieDetail.dart';
//import 'package:flutter_movie_app/model/movieDetail.dart';

class GenreList extends StatelessWidget {
  final List<Genre> genres;

  GenreList({Key key, this.genres}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            return Text(
              genres[index].name + ', ',
              style: TextStyle(color: Colors.grey),
            );
          }),
    );
  }
}
