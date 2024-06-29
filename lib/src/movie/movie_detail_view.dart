import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/movie/movie.dart';

class MovieDetailView extends StatefulWidget {
  final String imdbID;

  const MovieDetailView({Key? key, required this.imdbID}) : super(key: key);

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();

}

class _MovieDetailViewState extends State<MovieDetailView> {

  late DetailMovie _data = DetailMovie(
    Title: "", Year: "", Rated: "", Released: "", Runtime: "", Genre: "", 
    Director: "", Writer: "", Actors: "", Plot: "", Language: "", Country: "", 
    Awards: "", Poster: "", imdbRating: "", imdbVotes: "", imdbID: "", Type: "", 
    BoxOffice: "", Production: ""
  );

  void _getDetailData() {
    DetailMovie.getData(widget.imdbID).then((value) {
      setState(() {
        if (value != null) {
        _data = value;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getDetailData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Detail"),
      ),
      body: _data.imdbID != "" ? 
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(_data.Title, style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            )),
            const SizedBox(height: 12,),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_data.Poster != "N/A" || _data.Poster.isEmpty) Image.network(
                        _data.Poster,
                        width: 225,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("IMDB Rating", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                                Text(_data.imdbRating, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                                const SizedBox(height: 10)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("IMDB Votes", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                                Text(_data.imdbVotes, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                                const SizedBox(height: 10)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Box Office", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                                Text("${_data.BoxOffice}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                                const SizedBox(height: 10),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.075),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(6)
                                        )
                                        
                                      ),
                                      child: Text(
                                        _data.Year,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.075),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(6)
                                        )
                                        
                                      ),
                                      child: Text(
                                        _data.Type,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                  ],  
                                ),
                                const SizedBox(height: 10)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Runtime", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                                Text(_data.Runtime, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                                const SizedBox(height: 10)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Date Released", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                                Text(_data.Released, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                                const SizedBox(height: 10)
                              ],
                            ),
                          ]
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24,),
                  Text(_data.Plot, style: const TextStyle(fontSize: 16),),

                  const SizedBox(height: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Genres", style: TextStyle(fontSize:16, fontWeight: FontWeight.w600)),
                      Text(_data.Genre, style: const TextStyle(fontSize: 16,)),
                      const SizedBox(height: 10)
                    ],
                  ),

                  const SizedBox(height: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Actors", style: TextStyle(fontSize:16, fontWeight: FontWeight.w600)),
                      Text(_data.Actors, style: const TextStyle(fontSize: 16,)),
                      const SizedBox(height: 10)
                    ],
                  ),
                  
                  const SizedBox(height: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Language", style: TextStyle(fontSize:16, fontWeight: FontWeight.w600)),
                      Text(_data.Language, style: const TextStyle(fontSize: 16,)),
                      const SizedBox(height: 10)
                    ],
                  ),

                  const SizedBox(height: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Country", style: TextStyle(fontSize:16, fontWeight: FontWeight.w600)),
                      Text(_data.Country, style: const TextStyle(fontSize: 16,)),
                      const SizedBox(height: 10)
                    ],
                  ),

                  const SizedBox(height: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Writer", style: TextStyle(fontSize:16, fontWeight: FontWeight.w600)),
                      Text(_data.Writer, style: const TextStyle(fontSize: 16,)),
                      const SizedBox(height: 10)
                    ],
                  ),

                  const SizedBox(height: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Director", style: TextStyle(fontSize:16, fontWeight: FontWeight.w600)),
                      Text(_data.Director, style: const TextStyle(fontSize: 16,)),
                      const SizedBox(height: 10)
                    ],
                  ),
                ],
              )
            )
          ],
        ),
      ) : Row(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            child: const CircularProgressIndicator(),
          ),
          const SizedBox(width: 12,),
          const Text("Sedang Mengambil data...")
        ],
      )
    );
  }

}