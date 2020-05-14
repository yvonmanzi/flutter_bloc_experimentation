// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    json['id'] as int,
    json['video'] as bool,
    json['vote_count'] as int,
    json['vote_average'] as int,
    json['title'] as String,
    json['release_date'] as String,
    json['original_language'] as String,
    json['original_title'] as String,
    (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
    json['backdrop_path'] as String,
    json['adult'] as bool,
    json['overview'] as String,
    json['poster_path'] as String,
    json['popularity'] as int,
    json['media_type'],
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'video': instance.video,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'release_date': instance.releaseDate,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'genre_ids': instance.genreIds,
      'backdrop_path': instance.backdropPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'media_type': instance.mediaType,
    };

MovieDBTrendingApiResult _$MovieDBTrendingApiResultFromJson(
    Map<String, dynamic> json) {
  return MovieDBTrendingApiResult(
    json['total_pages'] as int,
    json['total_results'] as int,
    json['page'] as int,
    (json['results'] as List)
        ?.map(
            (e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieDBTrendingApiResultToJson(
        MovieDBTrendingApiResult instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'page': instance.page,
      'results': instance.movieList,
    };
