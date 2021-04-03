class MovieDetail {
  final int id;
  final String title;
  final int runtime;
  final String posterPath;
  final String backdropPath;
  final num popularity;
  final String releaseDate;
  final String overview;
  final num voteAverage;
  List<Genre> genres;

  MovieDetail(
      {this.id,
      this.title,
      this.runtime,
      this.posterPath,
      this.backdropPath,
      this.overview,
      this.popularity,
      this.releaseDate,
      this.voteAverage,
      this.genres});

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
        id: json['id'],
        title: json['title'],
        runtime: json['runtime'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        popularity: json['popularity'],
        releaseDate: json['release_date'],
        overview: json['overview'],
        voteAverage: json['vote_average'],
        genres:
            new List<Genre>.from(json['genres'].map((x) => Genre.fromJson(x))));
  }
}

class Genre {
  final int id;
  final String name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json['id'], name: json['name']);
  }
}
