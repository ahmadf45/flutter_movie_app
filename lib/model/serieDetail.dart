class SerieDetail {
  final int id;
  final String name;
  final int runtime;
  final String posterPath;
  final String backdropPath;
  final num popularity;
  final int numberOfSeasons;
  final String overview;
  final num voteAverage;
  final String firstAirDate;
  List<Genre> genres;

  SerieDetail(
      {this.id,
      this.name,
      this.runtime,
      this.posterPath,
      this.backdropPath,
      this.overview,
      this.popularity,
      this.numberOfSeasons,
      this.voteAverage,
      this.firstAirDate,
      this.genres});

  factory SerieDetail.fromJson(Map<String, dynamic> json) {
    return SerieDetail(
        id: json['id'],
        name: json['name'],
        runtime: json['runtime'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        popularity: json['popularity'],
        numberOfSeasons: json['number_of_seasons'],
        overview: json['overview'],
        voteAverage: json['vote_average'],
        firstAirDate: json['first_air_date'],
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
