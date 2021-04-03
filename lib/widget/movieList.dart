import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/movieDetail.dart';
import 'package:flutter_movie_app/model/movies.dart';
import '../page/moviePage.dart';

class MoviesList extends StatelessWidget {
  final List<Movies> movies;
  String imageUrl = 'https://image.tmdb.org/t/p/w500';

  MoviesList({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MoviePage(
                        id: movies[index].id,
                      )),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.33,
            margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image:
                              NetworkImage(imageUrl + movies[index].posterPath),
                          fit: BoxFit.cover)),
                  height: MediaQuery.of(context).size.height * 0.28,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(movies[index].title,
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                      maxLines: 2,
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
