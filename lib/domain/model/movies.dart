class Movie {
  int id;
  String title;
  String overView;
  DateTime releaseDate;
  String posterPath;
  String backdropPath;
  List genre;
  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overView,
    required this.backdropPath,
    required this.releaseDate,
    required this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      overView: json['overview'],
      backdropPath: json['backdrop_path'],
      releaseDate: DateTime.tryParse(json['release_date'])! ,
      genre: json['genre_ids']
    );
  }
}

class MovieList {
  List<Movie> movieList;
  MovieList({required this.movieList});

  factory MovieList.fromJson(List<dynamic> json) {
    List<Movie> popular = [];
    popular = json.map((popular) => Movie.fromJson(popular)).toList();
    return MovieList(movieList: popular);
  }
}
