import "dart:convert";
import "package:http/http.dart" as http;

class Movie {
  String title;
  String year;
  String imdbID;
  String type;
  String poster;

  
  static String endpoint = "https://www.omdbapi.com";
  static String apiKey = "8cb42e46";

  Movie({
    required this.title,
    required this.year,
    required this.imdbID,
    required this.type,
    required this.poster,
  });

  factory Movie.mapping(Map<String, dynamic> object) {
    return Movie(
      title: object["Title"] ?? "",
      year: object["Year"] ?? "",
      imdbID: object["imdbID"] ?? "",
      type: object["Type"] ?? "",
      poster: object["Poster"] ?? "",
    );
  }


  static Future<List<Movie>?> getAll(
    String s,   // search : "name"
    int y,  // number: 2024
    int page, // number : 1-100
  ) async {

    var urlData = Uri.parse("${endpoint}/?apikey=${apiKey}&y=${y}&r=json&s=${s}&page=${page}");
    var resultData = await http.get(urlData, headers: {
      'Content-Type': "application/json"
    });

    if (resultData.statusCode == 200) {
      var jsonData = jsonDecode(resultData.body);
      List<Movie> datas = [];
      for(int i = 0; i < jsonData["Search"].length; i++) {
        datas.add(Movie.mapping(jsonData["Search"][i]));
      }
      return datas;
    } else {
      return null;
    }

  }

}

class DetailMovie {
  String Title;
  String Year;
  String Rated;
  String Released;
  String Runtime;
  String Genre;
  String Director;
  String Writer;
  String Actors;
  String Plot;
  String Language;
  String Country;
  String Awards;
  String Poster;
  String imdbRating;
  String imdbVotes;
  String imdbID;
  String Type;
  String BoxOffice;
  String Production;

  static String endpoint = "https://www.omdbapi.com";
  static String apiKey = "8cb42e46";

  DetailMovie({
    required this.Title,
    required this.Year,
    required this.Rated,
    required this.Released,
    required this.Runtime,
    required this.Genre,
    required this.Director,
    required this.Writer,
    required this.Actors,
    required this.Plot,
    required this.Language,
    required this.Country,
    required this.Awards,
    required this.Poster,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.Type,
    required this.BoxOffice,
    required this.Production,
  });

  factory DetailMovie.mapping(Map<String, dynamic> object) {
    return DetailMovie(
      Title: object["Title"] ?? "",
      Year: object["Year"] ?? "",
      Rated: object["Rated"] ?? "",
      Released: object["Released"] ?? "",
      Runtime: object["Runtime"] ?? "",
      Genre: object["Genre"] ?? "",
      Director: object["Director"] ?? "",
      Writer: object["Writer"] ?? "",
      Actors: object["Actors"] ?? "",
      Plot: object["Plot"] ?? "",
      Language: object["Language"] ?? "",
      Country: object["Country"] ?? "",
      Awards: object["Awards"] ?? "",
      Poster: object["Poster"] ?? "",
      imdbRating: object["imdbRating"] ?? "",
      imdbVotes: object["imdbVotes"] ?? "",
      imdbID: object["imdbID"] ?? "",
      Type: object["Type"] ?? "",
      BoxOffice: object["BoxOffice"] ?? "-",
      Production: object["Production"] ?? "",
    );
  }

  static Future<DetailMovie?> getData(String id) async {
    var urlData = Uri.parse("${endpoint}/?apikey=${apiKey}&i=${id}");
    var resultData = await http.get(urlData, headers: {
      'Content-Type': 'application/json',
    });
    if (resultData.statusCode == 200) {
      var jsonData = jsonDecode(resultData.body);
      return DetailMovie.mapping(jsonData);
    } else {
      return null;
    }
  }
}