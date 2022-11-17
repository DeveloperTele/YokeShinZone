import 'package:rxdart/rxdart.dart';
import 'package:yokeshinzone/background/models/home/movie_model.dart';
import 'package:yokeshinzone/background/repository/repository.dart';

class MovieListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieModel> _poSubject = BehaviorSubject<MovieModel>();
  final BehaviorSubject<MovieModel> _tSubject = BehaviorSubject<MovieModel>();
  final BehaviorSubject<MovieModel> _plSubject = BehaviorSubject<MovieModel>();
  final BehaviorSubject<MovieModel> _uSubject = BehaviorSubject<MovieModel>();

  getPopularMovies() async {
    MovieModel response = await _repository.getPopularMovies();
    _poSubject.sink.add(response);
  }

  getTopRatedMovies() async {
    MovieModel response = await _repository.getTopRatedMovies();
    _tSubject.sink.add(response);
  }

  getNowPlayingMovies() async {
    MovieModel response = await _repository.getPlayingMovies();
    _plSubject.sink.add(response);
  }

  getUpcomingMovies() async {
    MovieModel response = await _repository.getUpcomingMovies();
    _uSubject.sink.add(response);
  }

  dispose() {
    _poSubject.close();
    _tSubject.close();
    _plSubject.close();
    _uSubject.close();
  }

  BehaviorSubject<MovieModel> get popularSubject => _poSubject;
  BehaviorSubject<MovieModel> get topSubject => _tSubject;
  BehaviorSubject<MovieModel> get playingSubject => _plSubject;
  BehaviorSubject<MovieModel> get upcomingSubject => _uSubject;

}
final moviesBloc = MovieListBloc();