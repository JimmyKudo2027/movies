class Movie{
  final int id;
  final double rate;
  final String title;
  final String overview;
  final String posterUrl;

  Movie({required this.id, required this.rate, required this.title, required this.overview, required this.posterUrl});

  static Movie get (dynamic item){
    return Movie(
        id: item['id'],
        rate: item['vote_average']/2,
        title: item['title'],
        overview: item['overview'],
        posterUrl: item['poster_path']);
  }


}