import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/movie/movie.dart';
import 'package:flutter_movie_app/src/widgets/CustomTextField.dart';
import 'package:flutter_movie_app/src/widgets/CustomButton.dart';
import 'package:flutter_movie_app/src/movie/movie_detail_view.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({super.key});

  @override
  State<MovieListView> createState() => _PageView();
}

class _PageView extends State<MovieListView> {
  List<Movie> _movies = [];
  String _search = "Love";
  int _year = 2023;
  int _page = 1;
  bool _isLoading = false;

  void _getAllMovie() {
    setState(() {
      _isLoading = true;
    });
    Movie.getAll(_search, _year, _page).then((value) => {
      setState(() {
        if (value != null) {
          _movies = value;
        }
        _isLoading = false;
      })
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllMovie();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text("MoviePedia"),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            Row(children: [
              Expanded(
                flex: 7,
                child: CustomTextField(
                  hintText: "Judul",
                  onChanged: (value) {
                    _search = value;
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3, 
                child: CustomTextField(
                  hintText: "Tahun",
                  onChanged: (value) {
                    _search = value;
                  },
                ),
              ),
              const SizedBox(width: 8),
              CustomButton(
                buttonText: "CARI",
                onPressed: _getAllMovie,
                backgroundColor: Colors.blue,
              ),
            ]),

            if (_isLoading) Container(
              padding: const EdgeInsets.all(24),
              child: const CircularProgressIndicator(),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                itemCount: _movies.length,
                itemBuilder: (BuildContext context, index) {
                  final posterUrl = _movies[index].poster;
                  final defaultPosterUrl = "https://img.freepik.com/free-vector/cinema-realistic-poster-with-illuminated-bucket-popcorn-drink-3d-glasses-reel-tickets-blue-background-with-tapes-vector-illustration_1284-77070.jpg";
                  
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MovieDetailView(
                          imdbID: _movies[index].imdbID
                        )
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            posterUrl == "N/A" || posterUrl.isEmpty 
                              ? defaultPosterUrl
                              : posterUrl,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 16,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8,),
                                Text(
                                  _movies[index].title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.075),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(6)
                                        )
                                        
                                      ),
                                      child: Text(
                                        _movies[index].year,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8,),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.075),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(6)
                                        )
                                        
                                      ),
                                      child: Text(
                                        _movies[index].type,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                  ],  
                                )
                              ],
                            )
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
            const SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  buttonText: "Sebelumnya",
                  onPressed: () {
                    if (_page == 1) return;
                    _page--;
                    _getAllMovie();
                    print("CLicked");
                  },
                  backgroundColor: Colors.blue,
                ),
                const SizedBox(width: 16,),
                CustomButton(
                  buttonText: "Selanjutnya",
                  onPressed: () {
                    _page++;
                    _getAllMovie();
                    print("CLicked");
                  },
                  backgroundColor: Colors.blue,
                ),
              ],
            )
          ])
        ),
      ),
    );
  }
}