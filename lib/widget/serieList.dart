import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/series.dart';
import '../page/seriePage.dart';

class SeriesList extends StatelessWidget {
  final List<Series> series;
  String imageUrl = 'https://image.tmdb.org/t/p/w500';

  SeriesList({Key key, this.series}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: series.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print(series[index].id);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SeriePage(
                        id: series[index].id,
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
                              NetworkImage(imageUrl + series[index].posterPath),
                          fit: BoxFit.cover)),
                  height: MediaQuery.of(context).size.height * 0.28,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(series[index].name,
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
