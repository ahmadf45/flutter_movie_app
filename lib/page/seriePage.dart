import 'package:flutter/material.dart';
import 'package:flutter_movie_app/api/dataApi.dart';
import 'package:flutter_movie_app/model/serieDetail.dart';
import 'package:flutter_movie_app/widget/creditList.dart';
import 'package:flutter_movie_app/widget/genreList.dart';

class SeriePage extends StatelessWidget {
  final int id;

  SeriePage({Key key, @required this.id}) : super(key: key);

  Container topView(
      String name,
      String backdropPath,
      String posterPath,
      num voteAverage,
      String firstAirDate,
      int numberOfSeasons,
      String overview,
      int runtime,
      List<Genre> genres,
      BuildContext context) {
    String durationToString(int minutes) {
      var d = Duration(minutes: minutes);
      List<String> parts = d.toString().split(':');
      return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
    }

    String imageUrl = 'https://image.tmdb.org/t/p/w780';
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  image: DecorationImage(
                      // colorFilter: ColorFilter.mode(Colors.grey, BlendMode.hue),
                      image: NetworkImage(imageUrl + backdropPath),
                      fit: BoxFit.cover),
                ),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 280,
                        width: 180,
                        margin: EdgeInsets.only(bottom: 20, top: 50),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            image: DecorationImage(
                                // colorFilter: ColorFilter.mode(Colors.grey, BlendMode.hue),
                                image: NetworkImage(imageUrl + posterPath),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      Text(
                        name + ' (' + firstAirDate.substring(0, 4) + ')',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20, child: GenreList(genres: genres)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(numberOfSeasons.toString() + ' Seasons',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey)),
                          SizedBox(width: 50),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 15,
                          ),
                          SizedBox(width: 1),
                          Text(voteAverage.toString(),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                )),
            Container(
                width: MediaQuery.of(context).size.width * 1,
                margin: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Overview',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white70),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        overview,
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Cast',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white70),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 1,
                      child: FutureBuilder(
                        future: DataApi().fetchSerieCredit(id),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) print(snapshot.error);

                          return snapshot.hasData
                              ? (CreditList(credits: snapshot.data))
                              : Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.brown),
                                    strokeWidth: 5,
                                  ),
                                );
                        },
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white70,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      backgroundColor: Colors.white10,
      body: Stack(
        children: [
          FutureBuilder(
              future: DataApi().fetchDetailSerie(id),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? topView(
                        snapshot.data.name,
                        snapshot.data.backdropPath,
                        snapshot.data.posterPath,
                        snapshot.data.voteAverage,
                        snapshot.data.firstAirDate,
                        snapshot.data.numberOfSeasons,
                        snapshot.data.overview,
                        snapshot.data.runtime,
                        snapshot.data.genres,
                        context)
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.brown),
                            strokeWidth: 5,
                          ),
                        ),
                      );
              })
        ],
      ),
    );
  }
}
