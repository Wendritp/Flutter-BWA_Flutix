part of 'models.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String posterPath;
  final String backdropPath;

  Movie(
      {@required this.id,
      @required this.title,
      @required this.voteAverage,
      @required this.overview,
      @required this.backdropPath,
      @required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      id: json['id'],
      title: json['title'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path']);
  @override
  List<Object> get props =>
      [id, title, voteAverage, overview, backdropPath, posterPath];
}
