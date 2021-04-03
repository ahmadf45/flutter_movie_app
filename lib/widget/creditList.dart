import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/credit.dart';

class CreditList extends StatelessWidget {
  final List<Credit> credits;
  String imageUrl = 'https://image.tmdb.org/t/p/w200';
  CreditList({Key key, this.credits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: credits.length,
      itemBuilder: (context, index) {
        return (credits[index].profilePath != null)
            ? GestureDetector(
                onTap: () {
                  print(credits[index].id);
                },
                child: Hero(
                  tag: credits[index].profilePath,
                  child: Container(
                    width: 70,
                    margin: EdgeInsets.only(right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.network(
                          imageUrl + credits[index].profilePath,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              )
            : Hero(
                tag: "https://picsum.photos/id/130/200/300",
                child: Container(
                  width: 70,
                  margin: EdgeInsets.only(right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network("https://picsum.photos/id/130/200/300",
                        fit: BoxFit.cover),
                  ),
                ),
              );
      },
    );
  }
}
