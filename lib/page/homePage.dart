import 'package:flutter/material.dart';
import 'package:flutter_movie_app/widget/serieList.dart';
import 'package:flutter_movie_app/widget/movieList.dart';
import '../api/dataApi.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white10,
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Movies",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Flexible(
              flex: 15,
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: FutureBuilder(
                    future: DataApi().fetchPopularMovies(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);

                      return snapshot.hasData
                          ? (MoviesList(movies: snapshot.data))
                          : Center(child: CircularProgressIndicator());
                    }),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Series",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Flexible(
              flex: 15,
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: FutureBuilder(
                    future: DataApi().fetchPopularSeries(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);

                      return snapshot.hasData
                          ? (SeriesList(series: snapshot.data))
                          : Center(child: CircularProgressIndicator());
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
