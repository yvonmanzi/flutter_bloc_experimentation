import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  final bool video;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @JsonKey(name: 'vote_average')
  final int voteAverage;
  final String title;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  final bool adult;
  final String overview;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  final int popularity;
  @JsonKey(name: 'media_type')
  final mediaType;

  Movie(
      this.id,
      this.video,
      this.voteCount,
      this.voteAverage,
      this.title,
      this.releaseDate,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.posterPath,
      this.popularity,
      this.mediaType);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
@JsonSerializable(explicitToJson: true)
class MovieDBTrendingApiResult {
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;
  final int page;
  @JsonKey(name: 'results')
  final List<Movie> movieList;

  MovieDBTrendingApiResult(
      this.totalPages, this.totalResults, this.page, this.movieList);

  factory MovieDBTrendingApiResult.fromJson(Map<String, dynamic> json) =>
      _$MovieDBTrendingApiResultFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDBTrendingApiResultToJson(this);
}
